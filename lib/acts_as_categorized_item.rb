module ActsAsCategorizedItem
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_categorized_item
      has_many :categorizations, :as => "categorized_item", :dependent => :destroy
      has_many :categories, :through => :categorizations

      named_scope :for_category, lambda { |category|
        if category.blank?
          {}
        else
          category = Category.find_by_name(category)
          category_ids = [category.id] + category.children.map(&:id)
          {
            :joins => "INNER JOIN categorizations ON categorizations.categorized_item_id = #{self.table_name}.id " +
                      "INNER JOIN categories ON categorizations.category_id = categories.id",
            :conditions => ["categories.id in (?)", category_ids]
          }
        end
      }
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsCategorizedItem)
