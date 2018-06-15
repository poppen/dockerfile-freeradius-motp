# FreeRADIUS supports Mobile-OTP Docker image

Lightweight and fast FreeRADIUS 3 server supports [Mobile-OTP].

This image is based on [marcelmaatkamp/freeradius](https://hub.docker.com/r/marcelmaatkamp/freeradius/).
The installed shell script enables Mobile-OTP is taken from [Mobile-OTP], and modified to fit with FreeRADIUS 3.

# How to use

```
$ docker run --name freeradius -p 1812:1812/udp -p 1813:1813/udp -p 18120:18120 -v ./clients.conf:/etc/raddb/clients.conf -v ./authorize:/etc/raddb/mods-config/files/authorize -d poppen/freeradius-motp
```

# How to debug

```
$ docker run --rm --name freeradius -v ./clients.conf:/etc/raddb/clients.conf -v ./authorize:/etc/raddb/mods-config/files/authorize poppen/freeradius-motp radiusd -X
```

On another terminal:

```
$ docker exec -it freeradius radtest USER PASSWORD localhost 0 SECRET
```

[Mobile-OTP]: http://motp.sourceforge.net/
