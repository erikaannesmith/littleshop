CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAIECWIW36JAP5EB5Q',
    aws_secret_access_key: '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',
  }
  config.fog_directory  = 'littleshopitemimages'
end
