module Ecm
  module Comments
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Comments::Backend
      end
    
    end
  end
end



