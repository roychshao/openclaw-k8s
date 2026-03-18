kubeseal --format=yaml --controller-name=sealed-secrets < openclaw-raw-secret.yaml > openclaw-sealed-secret.yaml
rm ./openclaw-raw-secret.yaml
