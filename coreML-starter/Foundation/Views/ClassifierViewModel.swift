//
//  ClassifierViewModel.swift
//  coreML-starter
//
//  
//

import Foundation

public enum Area {
    case seattle, newYork
}

final class ClassifierViewModel: ObservableObject {
    @Published var seattleData: [Classification] = []
    @Published var newYorkData: [Classification] = []
    
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
    }
    
    func getPredictionData(label: String, area: Area) -> Classification {
        if(area == .seattle) {
            return seattleData.filter { $0.label == label }.first ?? Classification()
        }
        else if(area == .newYork)
        {
            return newYorkData.filter { $0.label == label }.first ?? Classification()
        }
        else
        {
            return Classification()
        }
    }
}
