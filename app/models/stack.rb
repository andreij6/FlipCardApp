class Stack < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  
  accepts_nested_attributes_for :cards, allow_destroy: true
  
  def cards_for_form
    collection = cards.where(stack_id: id)
    collection.any? ? collection : cards.build
  end
end
