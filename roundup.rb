require_relative 'client'

client = Client.new :access_token, ENV['ACCESS_TOKEN']
workspace = client.workspace('fixedpoint.xyz')
puts workspace

blog = client.project('Blog', workspace)
puts blog

roundup_task = client.tasks.find_all(project: blog.id).find { |task| task.name == 'Weekly roundup' }
puts roundup_task
puts roundup_task.send(:client)
