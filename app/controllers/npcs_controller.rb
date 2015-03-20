class NpcsController < ApplicationController
  def view
    @npc = Npc.find(params[:id])
  end
end
