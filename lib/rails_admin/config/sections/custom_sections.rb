require 'rails_admin/config/sections/edit'
module RailsAdmin
  module Config
    module Sections
      # Configuration of the edit view for a new object
      class CreateRecursively < RailsAdmin::Config::Sections::Edit
      end
    end
  end
end

module RailsAdmin
    module Config
      class Model
        # Re-execute included(self) to register custom sections
        RailsAdmin::Config::Sections.included(self)
      end
    end
  end
  