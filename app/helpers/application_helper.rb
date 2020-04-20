module ApplicationHelper
  def readable_time(time)
    time.strftime("%b %d, %I:%M%P")
  end
end
