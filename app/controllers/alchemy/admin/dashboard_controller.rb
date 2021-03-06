module Alchemy
  module Admin
    class DashboardController < Alchemy::Admin::BaseController

      def index
        @alchemy_version = Alchemy::VERSION
        @clipboard_items = session[:clipboard]
        @last_edited_pages = Page.all_last_edited_from(current_user)
        @locked_pages = Page.all_locked
        @online_users = User.logged_in.to_a - [current_user]
        @first_time = current_user.sign_in_count == 1 && current_user.last_sign_in_at.nil?
      end

    end
  end
end
