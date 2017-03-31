class ActivitiesController < ApplicationController
  def index
    @activities = YAML.load_file("#{Rails.root}/config/activities.yml")
  end
end
