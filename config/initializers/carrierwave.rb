# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'
# require 'carrierwave/orm/activerecord'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET') # for AWS-side bucket access permissions config, see section below
    config.aws_acl    = 'public-read'

    config.aws_credentials = {
      access_key_id:     ENV.fetch('S3_ACCESS_KEY'),
      secret_access_key: ENV.fetch('S3_SECRET_KEY'),
      region:            ENV.fetch('S3_REGION'), # Required
      stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
    }
  end
end
