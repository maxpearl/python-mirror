# Docker Container to mirror websites using python_mirror

This container is designed to provide a mirror of a specific site.

```bash
docker run -d -p 80:80 -e URL=url pearlbear/python-mirror -e REPLACE_URLS=url_to_replace,url_to_replace -e WAIT=wait_time
```

- URL: url to mirror (full URL, include http:// or https://)
- REPLACE_URLS - comma separated (no spaces) list of urls to replace with relative links (like http://www.example.com,http://example.com,https://www.example.com,http://example.com)
- WAIT: wait time in seconds between requests. Use -1 for random number between 0 and 2 seconds.

The python_mirror.py script repository is [here](https://github.com/maxpearl/python_mirror)