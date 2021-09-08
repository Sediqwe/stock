module TranslaterHelper

    def reader(numi)
        trans = Translate.where(trans_id: numi)
        
    end
    def status(stat)
        case stat
        when 0
          bg = ' bg-secondary '
          
        when 2
          bg =  ' bg-success '
          
        when 4
          bg = ' bg-danger '
          
        else
          bg =  ' bg-warning '
        end
    end
    def trans_controll(numb)
        contr = Translate.where(trans_id: numb, trans_type: :true, users_id: current_user.id)
    end 

end
