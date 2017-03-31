class User
  def initialize(role:)
    @role = role.present? ? role : 'simpleton'
  end

  def role
    Role.find_by(name: @role)
  end
end

