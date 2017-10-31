require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Comments
    module Backend
      module Configuration
        def configure
          yield self
        end

        mattr_accessor :registered_controllers do
          lambda do
            [
              Ecm::Comments::Backend::CommentsController
            ]
          end
        end

        mattr_accessor :registered_services do
          lambda do
            []
          end
        end
      end
    end
  end
end
