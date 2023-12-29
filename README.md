# nse-dirscan
This Nmap script performs a comprehensive directory scan on a specified web server, checking for the presence of common directories and their HTTP status codes.

# Output
nmap hackerone.com --script dir-scan.nse
Starting Nmap 7.94SVN ( https://nmap.org ) at 2023-12-29 05:56 EST
Nmap scan report for hackerone.com (104.16.99.52)
Host is up (0.0078s latency).
Other addresses for hackerone.com (not scanned): 104.16.100.52 2606:4700::6810:6434 2606:4700::6810:6334
Not shown: 997 filtered tcp ports (no-response)
PORT     STATE SERVICE
80/tcp   open  http
| dir-scan: 
|   Directory: /.htpasswd - Status Code: 301
|   Directory: /.DS_Store - Status Code: 301
|   Directory: /.svn - Status Code: 301
|   Directory: /.well-known - Status Code: 301
|   Directory: /robots.txt - Status Code: 301
|   Directory: /sitemap.xml - Status Code: 301
|   Directory: /backup - Status Code: 301
|   Directory: /log - Status Code: 301
|_  Directory: /tmp - Status Code: 301
443/tcp  open  https
| dir-scan: 
|   Directory: /.DS_Store - Status Code: 404
|   Directory: /.svn - Status Code: 404
|   Directory: /.well-known - Status Code: 404
|   Directory: /robots.txt - Status Code: 200
|   Directory: /sitemap.xml - Status Code: 200
|   Directory: /backup - Status Code: 200
|   Directory: /log - Status Code: 200
|_  Directory: /tmp - Status Code: 200
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 39.00 seconds
