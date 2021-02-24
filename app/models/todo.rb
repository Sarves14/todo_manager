class Todo < ApplicationRecord
  belongs_to :users
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
    where("due_date < ? ", Date.today)
  end

  def self.completed?
    where(completed: true)
  end

  def completed?
    completed
  end
end
