# HerokuConda
A Dockerfile for a python3 miniconda setup tested on heroku based on [continuumio/miniconda3](https://hub.docker.com/r/continuumio/miniconda3/)
This container will run a miniconda Python 3 jupyter notebook with pandas scipy matplotlib and scikit-learn


---

Deploying a docker images requires both docker and the heroku cli to be installed

To deploy docker images you need to logging in to the heroku registry (see [herkuku docs](https://devcenter.heroku.com/articles/container-registry-and-runtime))

```bash
docker login --username=_ --password=$(heroku auth:token) registry.heroku.com
```


Next build and deploy your app, change <heroku_app_name> to your heroku app name

```bash
docker build . -t registry.heroku.com/<heroku_app_name>/web
docker push registry.heroku.com/<heroku_app_name>/web
```

---
**note:** deploying again destorys the file system, export your work before updating your app
