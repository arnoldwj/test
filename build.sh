docker run -d -t \
  --name=budibase \
  -p 10000:80 \
  -v /local/path/data:/data \
  --restart unless-stopped \
  budibase/budibase:latest