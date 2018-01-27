class PkoSet < ApplicationRecord
  validates :code, presence: true

  SDK_ATTRS = %w(name series total_cards standard_legal expanded_legal release_date)

  def self.create_from_api(api_data)
    set = find_or_initialize_by(code: api_data.code)
    SDK_ATTRS.each do |attr|
      set.send("#{attr}=", api_data.send(attr))
    end
    set.save
    set
  end
end
