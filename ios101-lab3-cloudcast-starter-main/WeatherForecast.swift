//
//  WeatherForecast.swift
//  CloudCast
//
//  Created by Yu-Shan Cheng on 7/1/25.
//
import Foundation
import UIKit
struct WeatherForecast {
  let windSpeed: Double
  let weatherCode: WeatherCode
  let precipitation: Double
  let temperature: Double
  let date: Date
}


enum WeatherCode {
  case clearSky
  case mainlyClear
  case partlyCloudy
  case rainy
  case overcast
  case fog
  case lightDrizzle
  case moderateDrizzle
  case denseDrizzle
  case slightRainShowers
  case moderateRainShowers
  case violentRainShowers

  var description: String {
    switch self {
    case .clearSky:
      return "Clear skies"
    case .mainlyClear:
      return "Mainly clear"
    case .partlyCloudy:
      return "Partly cloudy"
    case .rainy:
      return "Rainy"
    case .overcast:
      return "Overcast"
    case .fog:
      return "Foggy"
    case .lightDrizzle:
      return "Light Drizzle"
    case .moderateDrizzle:
      return "Moderate Drizzle"
    case .denseDrizzle:
      return "Dense Drizzle"
    case .slightRainShowers:
      return "Slight Showers"
    case .moderateRainShowers:
      return "Moderate Showers"
    case .violentRainShowers:
      return "Violent Showers"
    }
  }

  var image: UIImage? {
    switch self {
    case .clearSky, .mainlyClear:
      return UIImage(named: "sun")
    case .partlyCloudy:
      return UIImage(named: "cloud-sun")
    case .rainy:
        return UIImage(named:"rainy")
    case .overcast:
      return UIImage(named: "cloud")
    case .fog:
      return UIImage(named: "fog")
    case .lightDrizzle, .moderateDrizzle, .denseDrizzle:
      return UIImage(named: "drizzle")
    case .slightRainShowers, .moderateRainShowers, .violentRainShowers:
      return UIImage(named: "cloud-drizzle")
    }
  }
}
