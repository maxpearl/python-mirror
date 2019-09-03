# Docker Container to mirror websites using python_mirror

This container is designed to provide a mirror of a specific site.

```bash
docker run -d -p 80:80 -e URL=<url> pearlbear/python-mirror
```
