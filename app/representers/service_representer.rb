class ServiceRepresenter
  def initialize(service)
    @service = service
  end

  def as_json
    {
      id: service.id,
      title: service.title,
    }
  end
  ##
  private

  attr_reader :service

end