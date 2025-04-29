#!/bin/sh

ARCHIVE=/tmp/$(date +"%F.%T").tar
echo $ARCHIVE

#compress
tar czf $ARCHIVE $1

#upload
lftp << EOF
connect f/
cd ftp/dev-uploads
put $ARCHIVE
bye
EOF

#delete archive
rm $ARCHIVE


