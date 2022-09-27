class StaticPagesController < ApplicationController
  
  def top
    if user_signed_in?
      @wip_pct = donut(current_user.tasks)
    else
      @wip_pct = 0
    end
    @data = [["wip", @wip_pct], ["rem", 100 - @wip_pct]]
  end
end
