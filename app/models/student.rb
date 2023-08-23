class Student < ApplicationRecord

    has_one_attached :profile_image
    has_and_belongs_to_many :courses
    has_many :student_projects ,dependent: :destroy
    has_many :projects, through: :student_projects


    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true



    def full_name
        "#{first_name} #{last_name}"
    end
    
    def age 
        if dateOfbirth.present?
            Date.today.year - dateOfbirth.year 
        else
            nil
        end
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["courses", "projects", "student_projects"]
    end
    
    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "dateOfbirth", "email", "first_name", "id", "last_name", "phonenumber", "updated_at"]
      end


      validate :profile_image_must_be_image

      def profile_image_must_be_image
        if profile_image.attached? && !profile_image.content_type.in?(%w(image/jpeg image/png image/gif))
          errors.add(:profile_image, 'must be a JPEG, PNG, or GIF')
        end
      end
end
