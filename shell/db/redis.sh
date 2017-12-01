redis-server redis.conf --daemonize yes --protected-mode no # 启动redis
redis-cli -h 127.0.0.1 -p 6379 shutdown # 停止redis
