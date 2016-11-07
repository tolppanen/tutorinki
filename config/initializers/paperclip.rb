# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = 'http://s3.amazonaws.com/tutorinki/'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
