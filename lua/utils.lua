--- helper function to go from owner/repo -> https://github.com/owner/repo
--- @param repo string
--- @return string
--- @diagnostic disable-next-line
function gh(repo) return 'https://github.com/' .. repo end
