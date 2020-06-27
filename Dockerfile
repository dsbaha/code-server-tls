FROM linuxserver/code-server:latest
EXPOSE 80 443
RUN mkdir -p /etc/services.d/quicktlsproxy ; \
    echo "#!/usr/bin/with-contenv bash" > /etc/services.d/quicktlsproxy/run & \
    echo "exec /usr/bin/quicktlsproxy -destination http://127.0.0.1:8443 -certdir /config/certs \${TLS_DOMAIN_NAME}" > /etc/services.d/quicktlsproxy/run & \
    chmod +x /etc/services.d/quicktlsproxy/run & \
    curl -sL https://github.com/dsbaha/quicktlsproxy/releases/download/0.0.2/quicktlsproxy -o /usr/bin/quicktlsproxy ; \
    chmod +x /usr/bin/quicktlsproxy
