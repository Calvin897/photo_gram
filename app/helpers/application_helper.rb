module ApplicationHelper
    def alert_for(flash_type)
        { success: 'alert-success alert-dismissible fade show',
          error: 'alert-danger alert-dismissible fade show',
          alert: 'alert-warning alert-dismissible fade show',
          notice: 'alert-info alert-dismissible fade show'
        }[flash_type.to_sym] || flash_type.to_s
      end
end
