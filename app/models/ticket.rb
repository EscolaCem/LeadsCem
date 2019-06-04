class Ticket < ApplicationRecord
  belongs_to :responsible, optional: :true
  belongs_to :course, optional: :true
  belongs_to :user, optional: :true
  belongs_to :client, optional: :true
  belongs_to :company, optional: :true
  belongs_to :source, optional: :true

  has_many :activities
  validates :status, :telephone, :name, :responsible, :course,:source,presence: true
  

  def is_late?
    if  self.activities.last&.created_at&.saturday? || self.activities.last&.created_at&.sunday?
    elsif self.status == "Novo" && self.activities.count > 0 && self.activities.last.created_at < 3.days.ago
    elsif self.status == "Agendado" && self.activities.count > 0 && self.activities.last.created_at < 3.days.ago
    elsif self.status == "NãoAtende" && self.activities.count > 0 && self.activities.last.created_at < 3.days.ago
    elsif self.status == "Negociação" && self.activities.count > 0 && self.activities.last.created_at < 3.days.ago

  return true
 else
   return false
  end
 end



  def total_id
    self.where(status: 'Novo').count
  end
 
    def is_new?
    if  self.status == 'Novo'
          return true
         else
           return false
        end
      end

      def is_scheduled?
        if  self.status == 'Agendado'
              return true
             else
               return false
            end
          end
      def is_contact?
      if  self.status == 'Negociação'
            return true
           else
             return false
          end
        end
        def is_registration?
        if  self.status == 'Matriculado'
              return true
             else
               return false
            end
        end
        def is_potential?
        if  self.status == 'SemPotencial'
              return true
             else
               return false
            end
        end

        def is_inscrition?
          if  self.status == 'Inscrição'
                return true
               else
                 return false
              end
          end
        def is_nomet?
          if  self.status == 'NãoAtende'
                return true
               else
                 return false
              end
            end
          end
