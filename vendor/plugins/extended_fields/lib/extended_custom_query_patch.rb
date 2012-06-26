require_dependency 'query'

module ExtendedCustomQueryPatch

    def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable

            alias_method_chain :add_custom_fields_filters, :extended
        end
    end

    module InstanceMethods

        def add_custom_fields_filters_with_extended(custom_fields)
            add_custom_fields_filters_without_extended(custom_fields)

            custom_fields.select(&:is_filter?).each do |field|
                case field.field_format
                when "project"
                    options = { :type => :list_optional, :values => field.possible_values_options, :order => 20 }
                end
                @available_filters["cf_#{field.id}"] = options.merge({ :name => field.name }) if options
            end
        end

    end

end
