## Support for Laravel
As laravel serves files from its `/public/`-directory, we need to do the following modification to our `.env`
```env
APACHE_DOCUMENT_ROOT=/var/www/html/public
```

## Domain
When dealing with multiple instances of apache and nginx, setting a domain in our `config/vhosts.conf`
```conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot ${APACHE_DOCUMENT_ROOT}
# Here we can define what domain we mainly want to use
    ServerName domain.test
# Here we can define an alias for our vhost, such as www.
    ServerAlias www.domain.test
	<Directory ${APACHE_DOCUMENT_ROOT}>
		AllowOverride all
	</Directory>
</VirtualHost>
```

Then we need to add our domain and alias in our local host-file, for example on Mac OS:
```
sudo nano /etc/hosts

127.0.0.1 domain.test www.domain.test
```
