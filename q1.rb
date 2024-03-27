require 'httparty'
require 'json'

def get_attributes(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  repo_list = JSON.parse(response.body)
  most_forked_repo = repo_list.max_by{|repo| repo['forks']}

  puts "This is the most forked repo of #{username}\n
  Name: #{most_forked_repo['name']}\n
  URL: #{most_forked_repo['html_url']}\n
  Fork Count: #{most_forked_repo['forks']}"
end
get_attributes('kbridson')
