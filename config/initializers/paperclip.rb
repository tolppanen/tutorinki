# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = ':tutorinki.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 'eu-west-1.amazonaws.com'
