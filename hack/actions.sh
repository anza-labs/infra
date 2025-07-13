retry() {
  local max_attempts=$1
  shift
  local attempt=1

  while [ $attempt -le $max_attempts ]; do
    echo "Attempt $attempt of $max_attempts: $*"

    if "$@"; then
      echo "Command succeeded on attempt $attempt."
    else
      echo "Attempt $attempt failed."
      attempt=$((attempt + 1))

      if [ $attempt -le $max_attempts ]; then
        echo "Retrying..."
      else
        echo "All $max_attempts attempts failed."
        exit 1
      fi
    fi
  done
}
