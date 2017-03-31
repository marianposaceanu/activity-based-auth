class ActivitiesController < ApplicationController
  def index
    info = YAML.load_file("#{Rails.root}/config/activities.yml")

    to_render = ''

    info.keys.each do |key|
      to_render << <<-IS
        <h2>#{key}</h2>
        <p>#{info[key]}</p>
        <br />
      IS
    end

    render plain: to_render
  end
end
