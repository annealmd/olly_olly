class CityModel {
    final int id;
    final String name;
    final Coords coord;
    final String country;
    final int population;
    final int timezone;
    final int sunrise;
    final int sunset;

    CityModel({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

}

class Coords {
    final double lat;
    final double lon;

    Coords({
        required this.lat,
        required this.lon,
    });

}