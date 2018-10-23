require 'sortable_list/engine'
require 'sortable_list/reorder_dsl'

module SortableList
  mattr_accessor :models, :parent_controller
end

require_relative '../config/initializers/reorder_dsl.rb'