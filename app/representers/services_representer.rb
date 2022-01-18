class ServicesRepresenter
  def initialize(services)
    @services = services
  end

  def as_json
    services.map do |service|
      {
        id: service.id,
        title: service.title,
      }
    end
  end
  ##
  private

  attr_reader :services

end