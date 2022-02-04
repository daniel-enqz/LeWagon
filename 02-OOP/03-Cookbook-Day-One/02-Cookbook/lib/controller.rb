require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list; end

  def create; end

  def destroy; end
end
