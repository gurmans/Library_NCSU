class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
                if resource_class == Student
                        student_path(current_student)
                end
    end	
end
