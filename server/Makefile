SERVER=dockerserver

clean:
		rm -f ca.* server.* client.* *.key

all: ca.crt server.crt client.crt

%.key:
		openssl genrsa -out $@ 4096

ca.crt: ca.key
		openssl req -new -x509 -days 365 -key ca.key -sha256 -out ca.crt \
				-subj "/C=US/ST=Texas/L=Austin/O=Abc123/OU=Operations/CN=${SERVER}/emailAddress=ops@abc123.io"

server.csr: server.key
		openssl req -new -key server.key -out server.csr \
				-subj "/C=US/ST=Texas/L=Austin/O=Abc123/OU=Operations/CN=${SERVER}/emailAddress=ops@abc123.io"

server.crt: ca.key ca.crt server.csr
		openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key \
				-CAcreateserial -out server.crt

client.csr: client.key
		openssl req -new -key client.key -out client.csr \
				-subj "/C=US/ST=Texas/L=Austin/O=Abc123/OU=Operations/CN=Docker Client/emailAddress=ops@abc123.io"

client.ext.cnf:
		echo "extendedKeyUsage = clientAuth" > client.ext.cnf

client.crt: client.csr ca.crt ca.key client.ext.cnf
		openssl x509 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key \
				-CAcreateserial -out client.crt -extfile client.ext.cnf

