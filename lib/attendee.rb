class Attendee
    attr_reader :name, :budget

    def initialize(attendee_params)
        @name = attendee_params[:name]
        @budget = attendee_params[:budget]
    end
end