class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_activities
    user.role.activities
  end

  def method_missing(method_name, *args)
    activity_inferrer = ActivityPolicyInferrer.new(method_name, record)

    if activity_inferrer.policy_method?
      user_activities.include?(activity_inferrer.key_name)
    else
      super
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
