#!/bin/sh
set -eu

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var

# echo "The effective dev container remoteUser is '$_REMOTE_USER'"
# echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

# echo "The effective dev container containerUser is '$_CONTAINER_USER'"
# echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

if ! command -v apk >/dev/null 2>&1; then
    echo "This feature requires an Alpine-based image." >&2
    exit 1
fi

if [ -z "${VERSION:-}" ]; then
    echo "The VERSION option must be set." >&2
    exit 1
fi

echo "Installing ${VERSION}"
apk --no-cache add "${VERSION}"

JAVA_BIN="$(command -v java || true)"
if [ -z "$JAVA_BIN" ]; then
    echo "Java was not installed successfully." >&2
    exit 1
fi

JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$JAVA_BIN")")")"

cat >/etc/profile.d/java.sh <<EOF
export JAVA_HOME="$JAVA_HOME"
export PATH="\$JAVA_HOME/bin:\$PATH"
EOF

chmod 755 /etc/profile.d/java.sh
