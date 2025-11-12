a) Tulosta DVD-elokuvien kielet (language) aakkosjärjestyksessä

mysql> use sakila;
Database changed
mysql> SELECT name FROM language ORDER BY name;
+----------+
| name     |
+----------+
| English  |
| French   |
| German   |
| Italian  |
| Japanese |
| Mandarin |
+----------+

b) Tulosta kaikkien niiden näyttelijöiden elokuvat, joiden sukunimi on Temple.

mysql> SELECT f.title FROM film f JOIN film_actor fa ON f.film_id = fa.film_id JOIN actor a ON fa.actor_id = a.actor_id WHERE a.last_name = 'Temple';
+-------------------------+
| title                   |
+-------------------------+
| ACADEMY DINOSAUR        |
| ALABAMA DEVIL           |
| BALLOON HOMEWARD        |
| BEACH HEARTBREAKERS     |
| BUTTERFLY CHOCOLAT      |
| CARRIE BUNCH            |
| CASUALTIES ENCINO       |
| CONTACT ANONYMOUS       |
| DROP WATERFRONT         |
| EARLY HOME              |
| ENGLISH BULWORTH        |
| FELLOWSHIP AUTUMN       |
| GILMORE BOILED          |
| GUMP DATE               |
| ICE CROSSING            |
| INTERVIEW LIAISONS      |
| JUMANJI BLADE           |
| JUNGLE CLOSER           |
| LAMBS CINCINATTI        |
| LIAISONS SWEET          |
| MICROCOSMOS PARADISE    |
| MIGHTY LUCK             |
| MILE MULAN              |
| PRIMARY GLASS           |
| REQUIEM TYCOON          |
| RESURRECTION SILVERADO  |
| VARSITY TRIP            |
| VISION TORQUE           |
| WASH HEAVENLY           |
| WIZARD COLDBLOODED      |
| BANG KWAI               |
| BILL OTHERS             |
| BREAKFAST GOLDFINGER    |
| CANYON STOCK            |
| CHASING FIGHT           |
| CHITTY LOCK             |
| CITIZEN SHREK           |
| CLOSER BANG             |
| COMFORTS RUSH           |
| CONNECTION MICROCOSMOS  |
| CRAZY HOME              |
| CROSSROADS CASUALTIES   |
| FROGMEN BREAKING        |
| GHOST GROUNDHOG         |
| GLORY TRACY             |
| GOLD RIVER              |
| INDIAN LOVE             |
| NOVOCAINE FLIGHT        |
| PELICAN COMFORTS        |
| PLATOON INSTINCT        |
| SANTA PARIS             |
| SHAKESPEARE SADDLE      |
| SLUMS DUCK              |
| SMILE EARRING           |
| TOWERS HURRICANE        |
| TRAINSPOTTING STRANGERS |
| TROOPERS METAL          |
| UNCUT SUICIDES          |
| VISION TORQUE           |
| VOLCANO TEXAS           |
| WRATH MILE              |
| ATTACKS HATE            |
| BLANKET BEVERLY         |
| BUCKET BROTHERHOOD      |
| BUTTERFLY CHOCOLAT      |
| CAPER MOTIONS           |
| CHICAGO NORTH           |
| COAST RAINBOW           |
| EVOLUTION ALTER         |
| GATHERING CALENDAR      |
| GILMORE BOILED          |
| GRAPES FURY             |
| HEAVYWEIGHTS BEAST      |
| INSIDER ARIZONA         |
| POLLOCK DELIVERANCE     |
| RACER EGG               |
| ROSES TREASURE          |
| SLEUTH ORIENT           |
| SPIKING ELEMENT         |
| SPOILERS HELLFIGHTERS   |
| STRAIGHT HOURS          |
| VARSITY TRIP            |
| WAIT CIDER              |
| WARS PLUTO              |
| AFRICAN EGG             |
| BADMAN DAWN             |
| BLANKET BEVERLY         |
| CANDIDATE PERDITION     |
| CAROL TEXAS             |
| CHRISTMAS MOONSHINE     |
| GALAXY SWEETHEARTS      |
| HOCUS FRIDA             |
| INSIDER ARIZONA         |
| INTERVIEW LIAISONS      |
| JADE BUNCH              |
| LOVER TRUMAN            |
| LOVERBOY ATTACKS        |
| MADISON TRAP            |
| RANDOM GO               |
| TELEGRAPH VOYAGE        |
| TROJAN TOMORROW         |
| VIRGINIAN PLUTO         |
| WARDROBE PHANTOM        |
| WRONG BEHAVIOR          |
+-------------------------+

c) Tulosta elokuvassa "Ghost Groundhog" näytelleet näyttelijät.

d) Montako kauhuelokuvaa ("Horror") tietokannassa on ?

mysql> SELECT a.first_name, a.last_name FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'Ghost Groundhog';
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| DAN        | HARRIS    |
| KENNETH    | TORN      |
| KEVIN      | GARLAND   |
| RUSSELL    | TEMPLE    |
| RENEE      | BALL      |
+------------+-----------+
e) Tulosta kaikki kauhuelokuvat.

mysql> SELECT f.title FROM film f JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id WHERE c.name = 'Horror';
+-----------------------------+
| title                       |
+-----------------------------+
| ACE GOLDFINGER              |
| AFFAIR PREJUDICE            |
| AIRPORT POLLOCK             |
| ALABAMA DEVIL               |
| ALI FOREVER                 |
| ANALYZE HOOSIERS            |
| ANYTHING SAVANNAH           |
| ARABIA DOGMA                |
| ARACHNOPHOBIA ROLLERCOASTER |
| BEHAVIOR RUNAWAY            |
| BOWFINGER GABLES            |
| CARRIE BUNCH                |
| COMMANDMENTS EXPRESS        |
| DESERT POSEIDON             |
| DRUMS DYNAMITE              |
| EGYPT TENENBAUMS            |
| ELEPHANT TROJAN             |
| FAMILY SWEET                |
| FIDELITY DEVIL              |
| FREDDY STORM                |
| GASLIGHT CRUSADE            |
| HIGH ENCINO                 |
| JAPANESE RUN                |
| KARATE MOON                 |
| KENTUCKIAN GIANT            |
| LADY STAGE                  |
| LOLA AGENT                  |
| LOVE SUICIDES               |
| MONTEREY LABYRINTH          |
| MOTIONS DETAILS             |
| PANIC CLUB                  |
| PARIS WEEKEND               |
| PATTON INTERVIEW            |
| PULP BEVERLY                |
| REAP UNFAITHFUL             |
| REEF SALUTE                 |
| ROCK INSTINCT               |
| ROLLERCOASTER BRINGING      |
| RULES HUMAN                 |
| SIMON NORTH                 |
| SINNERS ATLANTIS            |
| SLEEPING SUSPECTS           |
| SPIRIT FLINTSTONES          |
| STRANGERS GRAFFITI          |
| STREETCAR INTENTIONS        |
| SWARM GOLD                  |
| TARZAN VIDEOTAPE            |
| TEMPLE ATTRACTION           |
| TEXAS WATCH                 |
| TRAIN BUNCH                 |
| TREASURE COMMAND            |
| UNDEFEATED DALMATIONS       |
| WATERSHIP FRONTIER          |
| WORLD LEATHERNECKS          |
| YENTL IDAHO                 |
| ZHIVAGO CORE                |
+-----------------------------+