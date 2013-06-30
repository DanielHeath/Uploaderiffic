require 'json'
S3DirectUpload.config do |c|
  cfg = JSON.parse File.read(Rails.root.join 'config', 'local.json')
  c.access_key_id = cfg["access_key"]
  c.secret_access_key = cfg["secret_key"]
  c.bucket = cfg["bucket"]
  c.url = cfg["url"]
end
