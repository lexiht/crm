module WorkshopsHelper
  def staffs_array
    User.where.not(role: "admin").pluck(:email)
  end

  def selected_staffs(workshop)
    result = ""
    workshop.users.where.not(role: "admin").pluck(:email).each do |staff|
      next if staff.blank?
      result += "<li>" + staff + "</li>"
    end
    raw(result)
  end
end
