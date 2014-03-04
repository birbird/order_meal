class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def update_picture!(uploaded_io, model, new_path)
    model.picture && FileUtils.rm_rf(Rails.root.join(File.join('public', model.picture)))
    upload_file(uploaded_io, new_path)

    model.picture = '/' + new_path
    model.save
    return model.picture
  end
  
  def upload_file(uploaded_io, path)
    file_path = Rails.root.join('public', path)
    dir = File.dirname(file_path)
    unless File.exist?(dir)
      FileUtils.mkdir_p(dir)
    end

    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    return file_path
  end
  
end
