# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tree_view(node)
    node_path = "/#{node.model.pluralize}/category/#{node.name}"

    html = "<li>"
    html << link_to(node.name, node_path)
    node.children.each{|child_node|
      html << "<ul>"
      html << tree_view( child_node )
      html << "</ul>"
    }
    html << "</li>"
  end

  def sidebar_for(object)
    objects = { "Page" => "页面", "Broadcast" => "新闻", "Product" => "产品", "Asset" => "资源", "Recruitment" => "招聘信息" }

    content_for(:sidebar) do
      if can? :create, object.constantize
        content_tag :div, :class => "list" do
          list = content_tag :li, link_to("创建#{objects[object]}", :action => "new")
          list += content_tag :li, link_to("#{objects[object]}列表", :action => "index")
          list += content_tag :li, link_to("订单列表", orders_path) if object == 'Product'

          content_tag :ul, list
        end
      else
        render :partial => "sidebar"
      end
    end
  end

  def neighbours(object)
    next_object = object.next
    previous_object = object.previous

    html = "上一个:"
    if previous_object
      html += link_to(previous_object, previous_object)
    else
      html += "无"
    end

    html += "  下一个:"
    if next_object
      html += link_to(next_object, next_object)
    else
      html += "无"
    end

    html
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def list(items = {})
    content_for :sidebar do
      content_tag :div, :class => "list" do
        content_tag :ul do
          items.inject("") do |list, item|
            list += content_tag :li do 
                      link_to item.first, item.last
                    end
          end
        end
      end
    end
  end
end
