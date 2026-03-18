# OpenClaw-k8s

This repository stores my config files to deploy OpenClaw instance on andyjjrt's k8s cluster

## How to deploy
### 1. First, create secrets
```
kubectl create secret generic openclaw-secret \
--from-literal=SELAB_LLM_URL=<SELAB_LLM_URL> \
--from-literal=DISCORD_BOT_TOKEN=<DISCORD_BOT_TOKEN> \
--from-literal=BRAVE_API_KEY=<BRAVE_API_KEY> \
--namespace roychshao \
--dry-run=client -o yaml > openclaw-raw-secret.yaml
```

Seal the secret by execute ./scripts/secrets/seal_secrets.sh, it will generate a **openclaw-sealed-secret.yaml**
Deploy it with
```
kubectl apply -f ./scripts/secrets/openclaw-sealed-secret.yaml
```

### Second, deploy the pods
```
kubectl apply -f ./scripts/pods/openclaw.yml
```

### Finally, forward the OpenClaw dashboard
```
bash open_dashboard.sh
```
And visit localhost:18789 in the browser

Before forward the dashboar, the pods should be successfully deployed.
One can check the status by `kubectl get pods`
