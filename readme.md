# ETCD Configuration Uploader

This Bash script facilitates the bulk upload of configuration data to an ETCD (etcd.io) key-value store. It reads configuration data from a file, organizes it, and uploads it to the specified ETCD server.

## Requirements

- Bash shell
- `etcdctl` command-line tool (part of etcd.io)

## Setup

1. **ETCD Configuration**: Ensure that you have the necessary configuration details for your ETCD server. This includes the ETCD server URL and, if applicable, user credentials.

2. **Input File**: Prepare a file (`configs.out` by default) containing the configuration data to be uploaded. The script expects data in a specific format where each line represents a key-value pair, with keys starting with `/system`.

3. **Script Configuration**: Customize the script by setting the following variables:

   - `USERPASS`: ETCD username and password in the format `username:password`. Uncomment this line and provide the credentials if your ETCD server requires authentication.
   - `URL`: URL of the ETCD server.
   - `FILE`: Path to the input file containing configuration data.

## Usage

1. **Run the Script**: Execute the script in your Bash environment. Ensure that the script has execute permissions (`chmod +x main.sh`).

   ```
   ./main.sh
   ```

2. **Review Output**: The script will display the keys and corresponding values as it uploads the configuration data to the ETCD server.

## Additional Notes

- Customize the script further to suit your specific requirements, such as handling authentication, error handling, or additional data transformations.
- Ensure that the ETCD server is reachable from the host running the script and that proper network access permissions are configured.
- Regularly review and update the script to accommodate changes in your environment or ETCD server configurations.