openssl genrsa -out ssl.key 2048 # 生成私钥
openssl pkcs8 -topk8 -inform PEM -in ssl.key -outform PEM –nocrypt # 转成PKCS8格式的私钥
openssl rsa -in ssl.key -pubout -out rsa_public_key.pem # 根据私钥生成公钥
openssl req -new -key ssl.key -out ssl.csr # 生成证书签名请求
openssl x509 -req -in ssl.csr -signkey ssl.key -out ssl.crt # 自签名私有证书

openssl x509 -in certificate.pem -text -noout # 查看证书
openssl rsa -in mykey.key -text -noout # 查看key
openssl req -noout -text -in my.csr # 查看证书签名请求
