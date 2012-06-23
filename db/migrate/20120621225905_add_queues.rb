class AddQueues < ActiveRecord::Migration
  COUNTERS = [
    {:title => 'Alex', :count => 0, :lamp_sum => 0, :queue => 2},
    {:title => 'Serg', :count => 0, :lamp_sum => 0, :queue => 2},
    {:title => 'YuYu', :count => 0, :lamp_sum => 0, :queue => 3},
    {:title => 'Alex', :count => 0, :lamp_sum => 0, :queue => 3},
    {:title => 'YuYu', :count => 0, :lamp_sum => 0, :queue => 4},
    {:title => 'Serg', :count => 0, :lamp_sum => 0, :queue => 4},
  ]
  def up
    COUNTERS.each do |c|
      Counter.create!(c)
    end
  end

  def down
    COUNTERS.each do |c|
      Counter.find_by_queue(c[:queue]).destroy
    end
  end
end

