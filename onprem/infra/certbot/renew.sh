#!/bin/bash

SECRET=tls-secret

KEY_PATH=/etc/letsencrypt/live/apjung.me/privkey.pem
CERT_PATH=/etc/letsencrypt/live/apjung.me/cert.pem


ARGOCD=argocd
JENKINS=jenkins

# 기존 시크릿 제거
kubectl delete secret $SECRET
kubectl -n $ARGOCD delete secret $SECRET
kubectl -n $JENKINS delete secret $SECRET 


# default에 시크릿생성
kubectl create secret tls $SECRET --key $KEY_PATH --cert $CERT_PATH

# Argocd로 시크릿복사
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$ARGOCD -f -

# Jenkins로 시크릿복사
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$JENKINS -f -






