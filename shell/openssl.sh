openssl genrsa -out ssl.key 2048 # 生成私钥 -----BEGIN RSA PRIVATE KEY-----
openssl pkcs8 -topk8 -inform PEM -in pkcs1.pem -outform PEM -nocrypt -out pkcs8.pem # 从PKCS1转成PKCS8格式的私钥 -----BEGIN PRIVATE KEY-----
openssl pkcs8 -in pkcs8.pem -nocrypt -out pkcs1.pem # 从PKCS8转成PKCS1格式的私钥 -----BEGIN RSA PRIVATE KEY-----
openssl rsa -in ssl.key -pubout -out rsa_public_key.pem # 从私钥生成公钥 -----BEGIN PUBLIC KEY-----
openssl rsa -in ssl.key -RSAPublicKey_out -out rsa_public_key.pem # Mac上没有 -----BEGIN RSA PUBLIC KEY-----
ssh-keygen -e -m pem -f ssl.key > rsa_public_key.pem # 从私钥生成公钥 Mac上有 -----BEGIN RSA PUBLIC KEY-----
ssh-keygen -e -m pem -f id_rsa.pub > id_rsa.pem # 从openssh公钥生成openssl公钥
openssl req -new -key ssl.key -out ssl.csr # 生成证书签名请求
openssl x509 -req -in ssl.csr -signkey ssl.key -out ssl.crt # 自签名私有证书

openssl dgst -sha256 -sign privkey -out after before # sign before using sha256 with rsa
openssl rsa -pubin -in pubkey.pem -text -modulus # 查看公钥信息
openssl x509 -in certificate.pem -text -noout # 查看证书
openssl rsa -in mykey.key -text -noout # 查看key
openssl req -noout -text -in my.csr # 查看证书签名请求
openssl x509 -outform PEM -in ssl.crt -pubkey -out ssl.pubkey # 从证书中提取公钥

openssl enc -aes-128-ecb -e -K 11111111111111111111111111111111 -nosalt -in plain -out cipher # aes encryption
openssl enc -aes-128-ecb -d -K 11111111111111111111111111111111 -nosalt -in cipher -out plain.out # aes decryption

echo 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' | openssl base64 -A # 直接用base64命令不需要加-A
echo 'YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWEK' | openssl base64 -d -A
