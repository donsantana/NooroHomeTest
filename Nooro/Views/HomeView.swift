//
//  HomeView.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isSearching = false
    @State private var showError = false
    @State private var selectedCity = ""
    @State private var searchCity = ""
    @State var weatherData: WeatherViewmodel?
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isSearching {
                    CityFoundView(weatherData: weatherData!,isSearching: $isSearching, searchCity: $searchCity)
                } else {
                    if !selectedCity.isEmpty {
                        if weatherData != nil {
                            WeatherView(weatherData: weatherData!)
                        }
                    } else {
                        NoCitySelectedView()
                    }
                }
            }
            .alert(Text("Error"), isPresented: $showError) {
                Button("OK") {
                    showError = false
                }
                
            } message: {
                Text(GlobalStrings.noCityFoundMessage)
            }
        }
        .searchable(text: $searchCity, placement: .navigationBarDrawer(displayMode: .automatic), prompt: GlobalStrings.searchLocationText)
        .onAppear() {
            selectedCity = UserDefaults.standard.string(forKey: "citySelected") ?? ""
            Task {
                weatherData = try await APIServices.shared.fetchWeatherData(city: selectedCity)
            }
        }
        .onSubmit(of: .search) {
            Task {
                do {
                    weatherData = try await APIServices.shared.fetchWeatherData(city: searchCity)
                    UserDefaults.standard.set(searchCity, forKey: "citySelected")
                    selectedCity = searchCity
                    isSearching = true
                } catch {
                    showError = true
                }
            }
        }
    }
}

struct CityFoundView: View {
    @Environment(\.dismiss) private var dismiss
    @State var weatherData: WeatherViewmodel
    @Binding var isSearching: Bool
    @Binding var searchCity: String
    var body: some View {
        ScrollView {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(Color(.customLightGray))
                    HStack(spacing: 60) {
                        VStack {
                            Text(weatherData.city)
                                .font(.largeTitle)
                            Text("\(weatherData.temperature)°")
                                .font(.system(size: 60))
                                .bold()
                        }
                        AsyncImage(url: URL(string: "https:\(weatherData.conditionIcon)")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            //Image(.defaultLogo)
                        }
                    }
                    .padding()
                    
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 150)
                .padding()
            }
            .onTapGesture {
                isSearching = false
                searchCity = ""
            }
        }.background(Color(.white))
    }
}
