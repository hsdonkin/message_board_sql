class Message
  attr_reader :user_name, :timestamp, :id

  def initialize(attr)
    @user_name = attr.fetch(:name)
    @content = attr.fetch(:content)
    @timestamp = attr.fetch(:time)
    @id = attr.fetch(:id)
  end

end
