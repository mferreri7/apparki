class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :demo]

  def home
  end

  def dashboard
    @tickets = policy_scope(Ticket)
    @week_tickets = Ticket.group_tickets("week")
    @month_tickets = Ticket.group_tickets("month")
    @year_tickets = Ticket.group_tickets("year")
    @users = User.all
    @beginning_of_week = Time.zone.now.beginning_of_week
    @end_of_week = Time.zone.now.end_of_week
    @reported_tickets = Ticket.where(status: "reportado")

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def demo
  end
end
