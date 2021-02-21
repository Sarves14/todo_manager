class Todo < ActiveRecord::Base
  def to_pleasant_string
    status = completed ? "[X]" : "[]"
    "#{id} #{status} #{todo_text} #{due_date}"
  end

  def self.due_today
    where(due_date: Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.completed?
    where(completed: true)
  end

  def completed?
    completed
  end
end
