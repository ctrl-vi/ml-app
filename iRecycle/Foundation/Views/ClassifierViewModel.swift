//
//  ClassifierViewModel.swift
//  coreML-starter
//
//  
//

import Foundation

public enum Area {
    case seattle, newYork, portland, sanFrancisco, dc
}

final class ClassifierViewModel: ObservableObject {
    @Published var seattleData: [Classification] = []
    @Published var newYorkData: [Classification] = []
    @Published var portlandData: [Classification] = []
    @Published var sanFranciscoData: [Classification] = []
    @Published var dcData: [Classification] = []
    func loadJSON() {
        print("load JSON")
        if let url = Bundle.main.url(forResource: "seattle", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                seattleData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
        
        if let url = Bundle.main.url(forResource: "newYork", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                newYorkData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
        
        if let url = Bundle.main.url(forResource: "portland", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                portlandData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
        
        if let url = Bundle.main.url(forResource: "sanFrancisco", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                sanFranciscoData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
        
        if let url = Bundle.main.url(forResource: "dc", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                dcData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
        
        
    }
    
    func getPredictionData(label: String, area: Area) -> Classification {
        if(area == .seattle) {
            return seattleData.filter { $0.label == label }.first ?? Classification()
        }
        else if(area == .newYork)
        {
            return newYorkData.filter { $0.label == label }.first ?? Classification()
        }
        else if(area == .portland)
        {
            return portlandData.filter { $0.label == label }.first ?? Classification()

        }
        else if(area == .sanFrancisco)
        {
            return sanFranciscoData.filter { $0.label == label }.first ?? Classification()

        }
        else if(area == .dc)
        {
            return dcData.filter { $0.label == label }.first ?? Classification()

        }
        else
        {
            return Classification()
        }
    }
}
