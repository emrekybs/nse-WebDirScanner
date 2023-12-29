# nse-dirscan
--This Nmap script performs a comprehensive directory scan on a specified web server, checking for the presence of common directories and their HTTP status codes.
<img src="https://github.com/emrekybs/nse-dirscan/blob/main/dirscan.png">

# nse-dirscan-plus
 * WebDirScanner is a Lua script designed to perform security and configuration checks on web servers by scanning specific directories.
 * It operates integrated with the Nmap network scanning tool, sending HTTP requests to common directories on a target web server. 
 *This script can be used to identify configuration errors and potential security vulnerabilities in web servers.

Features
HTTP Status Codes: Records the HTTP status code of each directory request to assess the presence and accessibility of the directory.
Page Title and Content Length: Extracts the page title from the received HTML content and records the content length.
Server Information: Gathers information about the server software from HTTP response headers.
Redirection Details: In the case of redirected directories, records the final destination URL.
Response Time Measurement: Measures the response time for each request, which can be used to identify potential performance issues.

Use Cases
Assessing the security posture of web servers.
Identifying configuration errors and vulnerabilities.
Analyzing the configuration and deployment of web applications.
This Nmap script performs a comprehensive directory scan on a specified web server, checking for the presence of common directories and their HTTP status codes.
<img src="https://github.com/emrekybs/nse-dirscan/blob/main/dircan-plus.png">


