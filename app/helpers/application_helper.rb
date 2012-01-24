module ApplicationHelper
	
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
	
	def menu(elements)
		menuStr = "<ul>"
		elements.each do |element|
			if element.kind_of?(Array)
				menuStr+="<li><a href='#'>"+element[0].to_s+"<span class='arrow'></span></a><ul>"
				element.drop(1).each do |e|
					menuStr+="<li><a href='"+e[1]+"'>"+e[0].to_s+"</a></li>"
				end
				menuStr+="</ul></li>"
			else
				menuStr+="<li><a href='#'>"+element.to_s+"</a></li>"
			end
		end
		menuStr+="</ul>"
		content_tag :div,raw(menuStr),:class=>"menu"
	end
	
	def table(elements) 
		content=raw('')
		elements.each do |element|
			content+=raw('<tr>')
				Etudiant.column_names.drop(1).each do |column_name|
					content+=raw('<td>')+element.attributes[column_name]+raw('</td>')
				end
			content+=raw('<td colspan="3">')
			content+=link_to 'Show', element
			content+=link_to 'Edit', edit_etudiant_path(element)
			content+=link_to 'Destroy', element, confirm: 'Are you sure?', method: :delete
			content+=raw('</td>')
			content+=raw('</tr>')
		end
		content_tag :table, content , :class=>"pretty" ,:cellspacing=>"0"
	end
end
