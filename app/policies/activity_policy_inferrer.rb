class ActivityPolicyInferrer
  attr_accessor :method_name
  attr_accessor :object

  def initialize(method_name, object)
    @method_name = method_name.to_s
    @object = object
  end

  def key_name
    infer_activity
  end

  def policy_method?
    method_name.last == '?'
  end

  private

  def infer_activity
    single_object = infer_object

    key_template(
      klass: single_object.class.name.downcase,
      method: method_name.gsub('?', '')
    )
  end

  def infer_object
    if object.respond_to?(:size)
      object.first
    else
      object
    end
  end

  def key_template(*args)
    '%{klass}:%{method}' % args
  end
end
