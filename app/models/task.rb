class Task < ApplicationRecord
  belongs_to :user
  has_many :mini_tasks, dependent: :destroy
  
  accepts_nested_attributes_for :mini_tasks, allow_destroy: true
  validates :name, presence: true
end
