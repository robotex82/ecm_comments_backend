module Ecm
  module Comments
    module Backend
      class CommentsController < Itsf::Backend::Resource::BaseController
        def self.resource_class
          Ecm::Comments::Comment
        end

        def create
          @resource = initialize_scope.new(permitted_params)
          @resource.creator = current_user
          @resource.created_by_ip_address = request.remote_ip
          @resource.save
          respond_with @resource, location: after_create_location
        end

        def update
          @resource = load_resource
          @resource.updater = current_user
          @resource.updated_by_ip_address = request.remote_ip
          @resource.update(permitted_params)
          respond_with @resource, location: after_update_location
        end

        private

        def permitted_params
          params.require(:comment).permit(:commentable_type, :commentable_id, :homepage, :name, :email, :body)
        end
      end
    end
  end
end

