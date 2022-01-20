module Users::Logic
  extend ActiveSupport::Concern

  included do
    def for_display
      {
        email: email,
        id: id,
      }
    end

    def for_others
      {
        email: email.presence || id,
        id: id
      }
    end
  end
end