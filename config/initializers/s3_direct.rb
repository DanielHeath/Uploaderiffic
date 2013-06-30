
S3DirectUpload.config do |c|
	cfg = File.read(File.join ENV["HOME"], ".s3cfg")
	access = cfg.lines.map {|l| l.split(/^access_key = /)[1]}.reject(&:blank?).first.strip
	secret = cfg.lines.map {|l| l.split(/^secret_key = /)[1]}.reject(&:blank?).first.strip

  c.access_key_id = access       # your access key id
  c.secret_access_key = secret   # your secret access key
  c.bucket = "imgup2"              # your bucket name
  c.url = "https://imgup2.s3-ap-southeast-2.amazonaws.com/"
end
