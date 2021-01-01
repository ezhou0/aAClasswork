class CatRentalRequest < ApplicationRecord
    STATUSES = ["PENDING", "APPROVED", "DENIED"]
    validates :cat_id, :end_date, :start_date, :status, presence: true
    validates :status, inclusion: STATUSES
    validates :does_not_overlap_approved_request
    belongs_to :cat


    def overlapping_requests
        CatRentalRequest
            .where(cat_id: cat_id)
            .where("? < ?", :end_date, start_date)
            .where("? > ?",:start_date, end_date)

    end

    def overlapping_approved_requests
        overlapping_requests
            .where(status: "APPROVED")
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.nil?
            errors.add(:cat_id,"dates can't overlap") 
        end
    end

       

end
