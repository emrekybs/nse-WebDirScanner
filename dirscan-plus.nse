-- Comprehensive Directory Scanning Script with Enhanced Features.
-- Checks for the presence of common directories on a specified web server and gathers additional information.
-- Author: emrekybs

categories = {"safe", "discovery"}
portrule = function(host, port)
    return port.number == 80 or port.number == 443
end

local function extract_title(body)
    local title = body:match("<title>(.-)</title>")
    return title or "No title"
end

action = function(host, port)
    local http = require "http"
    local stdnse = require "stdnse"
    local common_dirs = {
        "/admin", "/login", "/test", "/backup",
        "/.git", "/.env", "/.htaccess", "/.htpasswd", "/.DS_Store",
        "/.svn", "/.well-known", "/robots.txt", "/sitemap.xml",
        "/backup", "/log", "/tmp", "/config", "/database",
        "/dev", "/old", "/new", "/api", "/assets",
        "/bin", "/cgi-bin", "/cms", "/docs", "/downloads",
        "/email", "/files", "/forum", "/help", "/images",
        "/include", "/js", "/lib", "/media", "/news",
        "/private", "/public", "/scripts", "/server", "/service",
        "/sql", "/src", "/static", "/themes", "/upload",
        "/user", "/vendor", "/ws", "/xml", "/temp"
    }

    local results = {}
    for _, dir in ipairs(common_dirs) do
        local start_time = stdnse.clock_ms()
        local response = http.get(host, port, dir)
        local end_time = stdnse.clock_ms()
        local response_time = math.floor(end_time - start_time)

        if response.status then
            local title = extract_title(response.body)
            local content_length = response.header["content-length"] or "Unknown"
            local server_header = response.header["server"] or "Unknown"
            local location_header = response.header["location"] or "No redirection"

            local result = string.format("Directory: %s - Status Code: %s - Title: %s - Content Length: %s - Server: %s - Redirection: %s - Response Time: %d ms",
                                         dir, response.status, title, content_length, server_header, location_header, response_time)
            table.insert(results, result)
        end
    end

    return stdnse.format_output(true, results)
end
