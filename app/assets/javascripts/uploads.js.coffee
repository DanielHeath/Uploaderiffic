# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  window.foo = $("#myS3Uploader").S3Uploader(
    remove_completed_progress_bar: false
  )

  $('#myS3Uploader').bind 's3_uploads_start', (e) ->
    alert("Uploads have started")

  $('#myS3Uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")

  $('#myS3Uploader').bind "s3_upload_complete", (e, content) ->
    $('#someHiddenField').val(content.url)

  $(document).bind 's3_uploads_complete', ->
    alert("All Uploads completed")

  $('#myS3Uploader').bind "ajax:success", (e, data) ->
    alert("server was notified of new file on S3; responded with '#{data}")

  $('#myS3Uploader').bind "ajax:error", (data, status, xhr) ->
    alert("server died with '#{data}")
