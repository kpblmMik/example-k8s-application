# https://kubernetes.io/docs/concepts/services-networking/ingress/
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  namespace: default
spec:
  ingressClassName: nginx
  rules:
    - host: "${elb_dns}"
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: example-frontend
                port:
                  number: 80
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: example-backend
                port:
                  number: 3000
