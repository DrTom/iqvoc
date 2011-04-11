class DashboardController < ApplicationController
  
  before_filter :check_authorization
  
  def index
    @items = []
    Iqvoc.first_level_classes.each do |klass|
      @items += klass.for_dashboard.all # TODO (:include => [:locking_user, :pref_labels])
    end
    
    factor = params[:order] == "desc" ? -1 : 1

    if ['class', 'locking_user', 'follow_up', 'updated_at', 'state'].include?(params[:by])
      @items.sort! do |x, y|
        xval, yval = x.send(params[:by]), y.send(params[:by])
        xval = xval.to_s.downcase unless xval.is_a?(Date)
        yval = yval.to_s.downcase unless yval.is_a?(Date)
        (xval <=> yval) * factor
      end
    else
      @items.sort! { |x,y| (x.to_s.downcase <=> y.to_s.downcase) * factor } rescue nil
    end

  end
  
  private
  def check_authorization
    authorize! :use, :dashboard
  end
  
end