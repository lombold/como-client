module COMOClient
  module Tasks
    class Observer
      def update(_time, result, ex)
        if result
          Rails.logger.debug "Execution successfully returned #{result}\n"
        elsif ex.is_a?(Concurrent::TimeoutError)
          Rails.logger.fatal "Execution timed out\n"
        else
          Rails.logger.fatal "Execution failed with error #{ex}\n"
        end
      end
    end
  end
end