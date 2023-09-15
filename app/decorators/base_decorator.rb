class BaseDecorator < SimpleDelegator
  def initialize(object)
    @object = object
    super(@object)
  end

  def self.decorate(object)
    new(object)
  end

  def self.decorate_collection(collection)
    collection.map { |object| new object }
  end

  def original_object
    @object
  end

  def source_object
    @object.respond_to?(:source_object) ? @object.source_object : @object
  end
end
