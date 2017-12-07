openssl genrsa -out ssl.key 2048 # 生成私钥
openssl pkcs8 -topk8 -inform PEM -in ssl.key -outform PEM –nocrypt # 转成PKCS8格式的私钥
openssl rsa -in ssl.key -pubout -out rsa_public_key.pem # 根据私钥生成公钥
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
