module CanCan::Links
  module Rest
    class << self
      def labels
        @lbs ||= translate_labels? ? translate_labels : default_labels
      end

      attr_accessor :translate

      def translate_labels?
        translate
      end

      def rest_labels
        %w{index new edit delete show confirm}
      end

      protected

      def default_labels
        rest_labels.inject({}) {|result, action| 
          result[action.to_sym] = action.to_s.humanize
          result
        }
      end    

      def translate_labels
        ns_actions = 'cream.actions'
        tlabels =rest_labels.inject({}) {|result, action| 
          result[action.to_sym] = t("#{ns_actions}.#{action}").humanize
          result
        }
        tlabels[:confirm] = t 'cream.confirm'
        tlabels
      end
    end
  end
end
