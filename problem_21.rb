



class Task
  # Constructor
  def initialize(args = {})
    @start_date = args.fetch(:start_date, "1/1/2014")
    @end_date = args.fetch(:end_date, "12/12/2014")
    @effort_needed = args.fetch(:effort_needed, "Med")
  end
end
