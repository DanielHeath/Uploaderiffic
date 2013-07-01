require 'hmac-sha2'

class UploadsController < ApplicationController

  before_filter :verify_metadata_signed!

  def create
    @upload = Upload.new
    @upload.intent = 'change_avatar'
    @upload.filepath = params[:filepath]
    @upload.metadata = metadata.to_s
    @upload.save!
  end

  def verify_metadata_signed!
    raise "No metadata, what use is that?" if metadata.blank?

    verifier = HMAC::SHA256.new(Intent['change_avatar'].hmac_key)
    verifier << metadata
    raise "Metadata signature doesn't match" if verifier.hexdigest != metadata_hmac
  end

  def metadata
    params[:metadata]
  end

  def metadata_hmac
    params[:metadata_hmac]
  end

  helper_method :metadata, :metadata_hmac

end
