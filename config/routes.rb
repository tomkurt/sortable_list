Rails.application.routes.draw do
  put "sortable_lists/reorder", to: 'sortable_lists#reorder'
end