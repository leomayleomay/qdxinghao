module ActsAsHitable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_hitable
      has_many :hits, :as => :hitable, :dependent => :destroy
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsHitable)
