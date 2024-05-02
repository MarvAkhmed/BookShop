//
//  HomeViewModel.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 02/05/2024.
//

import Foundation
import Combine

class HomeViewModel {

    @Published var allBooks: String = "in seconds everything will be displayed, it depends on your interet"
    private var cancelable : Set<AnyCancellable> = []
    @Published var errorMessage: String?
    
    func fetchDataFromTheURL() {
        let urlString = "http://localhost:8080/books"
        
        guard let url = URL(string: urlString) else {
            self.allBooks = "can't fetch data "
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Book.self , decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  book in
                switch book {
                case .finished:
                    print("data should be displayed")
                    break
                case .failure(let error):
                    self?.errorMessage = "failed to fetch data with error : \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] book in
                self?.allBooks = ""
            }.store(in: &cancelable)

        
    }
}
