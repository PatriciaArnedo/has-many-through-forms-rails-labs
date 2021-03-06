class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
  accepts_nested_attributes_for :category

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute["name"].present?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end
end
