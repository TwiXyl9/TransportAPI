class Order < ApplicationRecord
  belongs_to :car
  belongs_to :cargo_type
  belongs_to :delivery_type
  belongs_to :route
  has_and_belongs_to_many :additional_services

  enum stage: [:sent, :in_progress, :completed, :canceled]

  after_initialize :set_default_stage, :if => :new_record?

  private
  def set_default_stage
    self.stage ||= :sent
  end
end
