class ExtendedPriorityColumn < ExtendedColumn

    def initialize(priority, options = {})
        @open = options[:open]

        if @open
            self.name = "open_priority_#{priority.position}_issues".to_sym
            self.caption = l(:label_open_priority_column, :priority => priority.name)
        else
            self.name = "priority_#{priority.position}_issues".to_sym
            self.caption = l(:label_priority_column, :priority => priority.name)
        end
        self.align = :center

        @css_classes = "priority-#{priority.position}"
        @priority = priority
    end

    def value(project)
        if @open
            Issue.open.count(:conditions => [ "project_id = ? AND priority_id = ?", project.id, @priority.id ])
        else
            Issue.count(:conditions => [ "project_id = ? AND priority_id = ?", project.id, @priority.id ])
        end
    end

end
