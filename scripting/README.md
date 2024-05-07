# Server Health Checker

## Description

This Bash script automates the collection and reporting of system metrics and status health information for multiple servers. It logs the health information to local log files and sends the logs to a Slack channel.

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Priceless-P/Devops-Projects.git
    ```

2. Make the script executable:

    ```bash
    chmod +x server_health_checker.sh
    ```

3. Open the script (`server_health_checker.sh`) in a text editor and replace the following placeholders with your own information:

   - `YOUR_SLACK_API_TOKEN` with your Slack API token.
   - `YOUR_CHANNEL_ID` with the ID of the Slack channel where you want to post messages.
   - Update the script to collect and log server health information as needed.

4. Run the script:

    ```bash
    ./server_health_checker.sh
    ```

5. Follow the on-screen prompts to enter the list of servers to be checked (comma-separated) and the path to your SSH key file for each server.

6. The script will collect server health information and store it in local log files located in the specified directory.

7. The logs will be sent to the Slack channel you configured.

## Configuration

- You can specify multiple Slack channels by separating their IDs with commas in the `SLACK_CHANNELS` variable.

## Notes

- Make sure you have the necessary permissions to post messages in the specified Slack channel.
- The script will create log files in the directory you specify, with filenames indicating the date and the server name.

