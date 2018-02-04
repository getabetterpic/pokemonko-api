class PkoSet < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  has_many :cards, foreign_key: :set_code, primary_key: :code, class_name: 'PkoCard'

  SDK_ATTRS = %w(name series total_cards standard_legal expanded_legal)

  def self.create_from_api(api_data)
    set = find_or_initialize_by(code: api_data.code)
    SDK_ATTRS.each do |attr|
      set.send("#{attr}=", api_data.send(attr))
    end
    set.release_date = Date.strptime(api_data.release_date, '%m/%d/%Y')
    set.save
    set
  end
end
