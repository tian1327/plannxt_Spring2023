module PlanModelHelper
    def link_to_add_row(name, f, association)
        print "helper is executing"
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for association,new_object  do |builder|
            render association.to_s.singularize+"_field", f:builder
        end
        link_to(name, '#', class: "add_row", data: {id: id, fields: fields.gsub("\n","")})
    end
end
