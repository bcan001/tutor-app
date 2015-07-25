module ApplicationHelper
	def display_datetime(dt)
  	dt.strftime("%m/%d/%Y at %l:%M%P %Z")
  end
end
