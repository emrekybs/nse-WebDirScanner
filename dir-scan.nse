description = [[
  Comprehensive Directory Scanning Script.
  Checks for the presence and HTTP status codes of common directories on a specified web server.
]]

categories = {"safe", "discovery"}
portrule = function(host, port)
    return port.number == 80 or port.number == 443
end

action = function(host, port)
    local http = require "http"
    local stdnse = require "stdnse"
    local target = stdnse.get_hostname(host) .. ":" .. port.number
    local common_dirs = {
        "/admin", "/login", "/test", "/backup",
        "/.git", "/.env", "/.htaccess", "/.htpasswd", "/.DS_Store",
        "/.svn", "/.well-known", "/robots.txt", "/sitemap.xml",
        "/backup", "/log", "/tmp"
    }

    local results = {}
    for _, dir in ipairs(common_dirs) do
        local response = http.get(host, port, dir)
        if response.status then
            local result = string.format("Directory: %s - Status Code: %s", dir, response.status)
            table.insert(results, result)
        end
    end

    return stdnse.format_output(true, results)
end
