//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Gamil Ali Qaid Shamar on 04/07/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import Foundation

// MARK: - Weather
class Weather: Codable {
    let coord: Coord?
    let weather: [WeatherElement]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?

    init(coord: Coord?, weather: [WeatherElement]?, base: String?, main: Main?, visibility: Int?, wind: Wind?, clouds: Clouds?, dt: Int?, sys: Sys?, id: Int?, name: String?, cod: Int?) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.id = id
        self.name = name
        self.cod = cod
    }
}

// MARK: Weather convenience initializers and mutators

extension Weather {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Weather.self, from: data)
        self.init(coord: me.coord, weather: me.weather, base: me.base, main: me.main, visibility: me.visibility, wind: me.wind, clouds: me.clouds, dt: me.dt, sys: me.sys, id: me.id, name: me.name, cod: me.cod)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        coord: Coord?? = nil,
        weather: [WeatherElement]?? = nil,
        base: String?? = nil,
        main: Main?? = nil,
        visibility: Int?? = nil,
        wind: Wind?? = nil,
        clouds: Clouds?? = nil,
        dt: Int?? = nil,
        sys: Sys?? = nil,
        id: Int?? = nil,
        name: String?? = nil,
        cod: Int?? = nil
    ) -> Weather {
        return Weather(
            coord: coord ?? self.coord,
            weather: weather ?? self.weather,
            base: base ?? self.base,
            main: main ?? self.main,
            visibility: visibility ?? self.visibility,
            wind: wind ?? self.wind,
            clouds: clouds ?? self.clouds,
            dt: dt ?? self.dt,
            sys: sys ?? self.sys,
            id: id ?? self.id,
            name: name ?? self.name,
            cod: cod ?? self.cod
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Clouds
class Clouds: Codable {
    let all: Int?

    init(all: Int?) {
        self.all = all
    }
}

// MARK: Clouds convenience initializers and mutators

extension Clouds {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Clouds.self, from: data)
        self.init(all: me.all)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        all: Int?? = nil
    ) -> Clouds {
        return Clouds(
            all: all ?? self.all
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Coord
class Coord: Codable {
    let lon, lat: Double?

    init(lon: Double?, lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
}

// MARK: Coord convenience initializers and mutators

extension Coord {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Coord.self, from: data)
        self.init(lon: me.lon, lat: me.lat)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lon: Double?? = nil,
        lat: Double?? = nil
    ) -> Coord {
        return Coord(
            lon: lon ?? self.lon,
            lat: lat ?? self.lat
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Main
class Main: Codable {
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }

    init(temp: Double?, pressure: Int?, humidity: Int?, tempMin: Double?, tempMax: Double?) {
        self.temp = temp
        self.pressure = pressure
        self.humidity = humidity
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
}

// MARK: Main convenience initializers and mutators

extension Main {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Main.self, from: data)
        self.init(temp: me.temp, pressure: me.pressure, humidity: me.humidity, tempMin: me.tempMin, tempMax: me.tempMax)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        temp: Double?? = nil,
        pressure: Int?? = nil,
        humidity: Int?? = nil,
        tempMin: Double?? = nil,
        tempMax: Double?? = nil
    ) -> Main {
        return Main(
            temp: temp ?? self.temp,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            tempMin: tempMin ?? self.tempMin,
            tempMax: tempMax ?? self.tempMax
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Sys
class Sys: Codable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?

    init(type: Int?, id: Int?, message: Double?, country: String?, sunrise: Int?, sunset: Int?) {
        self.type = type
        self.id = id
        self.message = message
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: Sys convenience initializers and mutators

extension Sys {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Sys.self, from: data)
        self.init(type: me.type, id: me.id, message: me.message, country: me.country, sunrise: me.sunrise, sunset: me.sunset)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: Int?? = nil,
        id: Int?? = nil,
        message: Double?? = nil,
        country: String?? = nil,
        sunrise: Int?? = nil,
        sunset: Int?? = nil
    ) -> Sys {
        return Sys(
            type: type ?? self.type,
            id: id ?? self.id,
            message: message ?? self.message,
            country: country ?? self.country,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - WeatherElement
class WeatherElement: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

    init(id: Int?, main: String?, weatherDescription: String?, icon: String?) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

// MARK: WeatherElement convenience initializers and mutators

extension WeatherElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(WeatherElement.self, from: data)
        self.init(id: me.id, main: me.main, weatherDescription: me.weatherDescription, icon: me.icon)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        main: String?? = nil,
        weatherDescription: String?? = nil,
        icon: String?? = nil
    ) -> WeatherElement {
        return WeatherElement(
            id: id ?? self.id,
            main: main ?? self.main,
            weatherDescription: weatherDescription ?? self.weatherDescription,
            icon: icon ?? self.icon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Wind
class Wind: Codable {
    let speed: Double?
    let deg: Int?

    init(speed: Double?, deg: Int?) {
        self.speed = speed
        self.deg = deg
    }
}

// MARK: Wind convenience initializers and mutators

extension Wind {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Wind.self, from: data)
        self.init(speed: me.speed, deg: me.deg)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        speed: Double?? = nil,
        deg: Int?? = nil
    ) -> Wind {
        return Wind(
            speed: speed ?? self.speed,
            deg: deg ?? self.deg
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

