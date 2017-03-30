class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_activities
    @user.roles.select(:activities).distinct.map(&:activities).flatten
  end

  def inferred_activity(method)
    single_object = 
      if record.respond_to? :size
        record.first
      else
        record
      end

    "#{single_object.class.name.downcase}:#{method.to_s}"
  end

  def method_missing(name, *args)
    # byebug
    method_name = name.to_s

    if method_name.to_s.last == '?'
      user_activities.include?(inferred_activity(method_name.to_s.gsub('?','')))
    else
      super
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
