api_key= 'AIzaSyCIUu5YFfu5A_nwFb_E4BkfhqM38OSzOUo'

import pandas as pd
import googlemaps

#local_input = input('Digite sua localização: ')
local_input = input('Digite sua localização:')
df = pd.DataFrame({
   'address':['Statu',local_input]})
#   'address':['Statu','562 Rua Goias, João Pessoa, Paraiba, 58030061']})
#    'address':['Statu', '611 Commerce St, Nashville, TN 37203']})

gmaps_key = googlemaps.Client(key= 'AIzaSyCIUu5YFfu5A_nwFb_E4BkfhqM38OSzOUo')
df['Lat'] = None
df['Lon'] = None
for i in range(len(df)):
    geocode_result = gmaps_key.geocode(df.loc[i,'address'])
    try:
        lat = geocode_result[0]['geometry']['location']['lat']
        lng = geocode_result[0]['geometry']['location']['lng']
        df.loc[i,'Lat'] = lat
        df.loc[i,'Lon'] = lng
    except:
        lat = None
        lng = None
print(df)
