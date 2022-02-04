require_relative "view"

class Controller
# gather data from the cookbook to hand them over to the view
# ask the view for information to create new recipes. 
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list # all the recipes
    @view.display(recipes)
  end

  
  def create # a new recipie
  end
  
  def destroy # an existing recipie
  end
end
