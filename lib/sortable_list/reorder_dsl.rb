module SortableList::ReorderDsl
  extend ActiveSupport::Concern

  module ClassMethods
    def reorder_by attribute
      class_eval <<-EOV
        define_model_callbacks :reorder

        def self.reorder ids
          ids.each_with_index do |id, index|
            where(id: id).update_all('#{attribute}' => index)
          end
          notify_observers :after_reorder, class: self, ids: ids
        end
      EOV
    end
  end
end
