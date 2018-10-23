class SortableListsController < SortableList.parent_controller
  def reorder
    if SortableList.models.include?(params[:model])
      params[:model].constantize.reorder(params[:ids])
    end
    head :ok
  end
end