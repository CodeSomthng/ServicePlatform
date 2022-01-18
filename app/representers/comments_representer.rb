class ServicesRepresenter
  def initialize(comments)
    @comments = comments
  end

  def as_json
    comments.map do |service|
      {
        id: comment.id,
        title: comment.title,
        service_id: comment.service_id,
        user_id: comment.user_id
      }
    end
  end
  ##
  private

  attr_reader :services

end