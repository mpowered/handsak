# Activate this handsak beauty via:
# require "handsak/closure_tree/extensions"

module Handsak
  module ClosureTree

    module Extensions

      def self.included(klass)
        # Returns the most senior nodes (nodes in the oldest generation)
        def klass.most_senior
          most_senior_generation = joins(:ancestor_hierarchies)
                                    .where("#{quoted_hierarchy_table_name}.ancestor_id <> #{quoted_hierarchy_table_name}.descendant_id")
                                    .minimum("#{quoted_hierarchy_table_name}.generations")
          find_all_by_generation(most_senior_generation)
        end

        # Returns the most junior nodes (nodes in the youngest generation)
        def klass.most_junior
          most_junior_generation = joins(:ancestor_hierarchies)
                                    .where("#{quoted_hierarchy_table_name}.ancestor_id <> #{quoted_hierarchy_table_name}.descendant_id")
                                    .maximum("#{quoted_hierarchy_table_name}.generations")
          find_all_by_generation(most_junior_generation)
        end
      end

    end

  end
end

ActiveRecord::Base.send :include, Handsak::ClosureTree::Extensions
