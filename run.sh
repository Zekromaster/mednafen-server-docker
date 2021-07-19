#/bin/sh
TMPFILE="$(mktemp)"
sed 's/_PASSWORD_/'"$SERVER_PASSWORD"'/' /etc/mednafen-server.conf > "$TMPFILE"
cat $TMPFILE
/usr/bin/mednafen-server "$TMPFILE"