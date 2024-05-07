import boto3

def lambda_handler(event, context):
    response = boto3.client('ec2')

    snapshots = response.describe_snapshots(OwnerId=['self'])
    running_instances = response.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
    active_instance_id = set()

    for reservation in running_instances['Reservation']:
        for instance in reservation['Instance']:
            active_instance_id.add(instance['InstanceId'])

    for snapshot in snapshots['Snapshots']:
        snapshot_id = snapshot['SnapshotId']
        volume_id = snapshot.get('VolumeId')

        if not volume_id:
            print("Deleting EBS snapshot {} as it is not attached to any volume".format(snapshot_id))
            response.delete_snapshot(SnapshotId=snapshot_id)
        else:
            try:
                volume_response = response.describe_volumes(VolumeIds=volume_id)
                if not volume_response['Volumes'][0]['Attachments']:
                    print("Deleting EBS snapshot {} as it was taken from a volume not attached to any instances".format(snapshot_id))
                    response.delete_snapshot(SnapshotId=snapshot_id)
            except response.exceptions.ClientError as e:
                if e.response['Error']['Code'] == 'InvalidVolume.NotFound':
                    print(f"Deleted EBS snapshot {snapshot_id} as its associated volume was not found.")
                    response.delete_snapshot(SnapshotId=snapshot_id)
