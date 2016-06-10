class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :owner
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  self.per_page = 10
  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, '品目が存在しています')
        return false
      end
    end
end
