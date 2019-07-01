response = JSON.parse(RestClient.get("https://api.fda.gov/drug/label.json?limit=100"))
    response["results"].each do |results|
        medication = Medication.create do |key|
          key.name = results.dig("openfda", "generic_name")
            if key.name == nil
                key.name = results.dig("generic_name")
              if key.name == nil
                key.name = results.dig("openfda", "brand_name")
                if key.name == nil
                  key.name = results.dig("brand_name")
                  if key.name == nil
                    key.name = "unavailable"
                end
              end
            end
          end
          key.route = results.dig("openfda", "route")
            if key.route == nil
              key.route = results.dig("route")
              if key.route == nil
                key.route = "unavailable"
              end
            end
          key.purpose = results.dig("purpose")
          if key.purpose == nil
            key.purpose = "unavailable"
            end
          end
        end
        
Code.create(begin_time: "05:00", end_time: "05:15", patient_status: "Dead", patient_id: 3)
Patient.create(name: "Bob Brown", age: 50, history:"DM2, MI, CVA", user_id: 2)
Patient.create(name: "Denise Jones", age: 72, history:"CABG, ETOH", user_id: 2)
Patient.create(name: "Bob Brown", age: 58, history:"HLD, MI, CABG, Amphetamines", user_id: 2)
