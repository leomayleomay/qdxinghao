module MessagesHelper
  def sidebar
    content_for :sidebar do
      render :partial => "sidebar"
    end
  end
end
