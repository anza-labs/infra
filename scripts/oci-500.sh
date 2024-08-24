#!/usr/bin/env bash

source .env

# Define your command here
command_to_run="tofu -chdir=./terraform/oci apply -auto-approve"

# Function to generate a random sleep time between 1 and 5 seconds
function jitter_backoff() {
  sleep_time=$(shuf -i 1-5 -n 1)
  echo "Sleeping for $sleep_time seconds before retrying..."
  sleep $sleep_time
}

# Loop to run the command until it succeeds
while true; do
  export TF_VAR_availability_domain=$(shuf -i 1-3 -n 1)

  if $command_to_run ; then
    echo "Command completed successfully on AD=$TF_VAR_availability_domain."
    break
  else
    echo "Command failed with exit code $exit_code. Retrying..."
    jitter_backoff
  fi
done
