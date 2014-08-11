module Search
  def self.included(base)
    base.class_eval do
      # Simple search. It doesn't necessarily to create something more advanced than that for current project
      #
      scope :search, lambda { |query|
        where("name ~* ?", query) unless query.blank?
      }
    end
  end
end
