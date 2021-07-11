module TranslaterHelper

    def reader(numi)
        trans = Translate.where(trans_id: numi, trans_type: :true)
        
    end

end
