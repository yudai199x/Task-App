module TasksHelper
  
  def wip(task)
    top = task.mini_tasks.where(cpl_chk: true).count
    bottom = task.mini_tasks.count
    if bottom > 0
      wip = (top * 100 / bottom).floor
    else
      wip = 0
    end
    return wip
  end
  
  def donut(tasks)
    top = 0
    tasks.each do |task|
      top += wip(task)
    end
    bottom = 100 * tasks.count
    if bottom > 0
      wip = (top * 100 / bottom).floor
    else
      wip = 0
    end
    return wip
  end
end
