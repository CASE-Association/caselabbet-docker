


# Tjänster
## Astro
Kör caselabbet.se

## LibreBooking
Bokningstjänsten. Mappen innehåller följande filer:
- `config.php` är defaultconfigen som laddas 

## Adminer
Databashanteringsverktyg. Går bara att nå via tunnel.

## nginx
Routar trafik utifrån beroende på subdomän.

- Lyssnar på `0.0.0.0:80`
- caselabbet.se -> `localhost:8000`
- booked.caselabbet.se -> `localhost:8001`

## Inventory
Hämtar data från Zettle och inventory-bladet och publicerar på `caselabbet.se/components` en gång om dagen.


# Interna tjänster
Astro: 8000
LibreBooking: 8001
adminer: 8002

# Envvariabler
ZETTLE_APIKEY - Skaffa en API-nyckel på Zettle-kontot med "Products"-behörighet
DB_ROOT_PWD,LB_DBUSER_PWD,LB_INSTALL_PWD - Godtyckliga starka, används bara internt

# Nystart
Starta dockern.

Om du nu öppnar booked.caselabbet.se bör du se "Uknown Error". Detta är för att LB:s databas finns, men är tom.

<Öppna tunnel>
Logga in i adminer som LibreBooking-användaren. Öppna databasen `librebooking`, klicka "Import", ladda upp senaste backup under "File Upload". Klicka sedan "Execute" och vänta tills sidan laddar igen (kan ta någon minut). Det bör sedan säga ca "508 queries executed OK" i grönt på toppen. Nu ska Booked vara igång! Testa att logga in som Admin.
