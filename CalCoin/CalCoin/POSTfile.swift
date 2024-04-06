import Foundation

func postRequest(completion: @escaping (Result<[Coin], Error>) -> Void) {
    // Define the URL of the API endpoint
    let url = URL(string: "https://strong-lion-83.hasura.app/v1/graphql")!
    
    // Create the request object and specify its method (POST)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // Set the content type of your request to indicate you're sending JSON
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("1S2fOGuKiyNzMDR6f761A5lcwCsNWG5h3cffI7CiqwzGxSRkrl8r2yheqeNVawMY", forHTTPHeaderField: "x-hasura-admin-secret")
    
    // Define the GraphQL query
    let graphqlQuery = """
    {
      "query": "query getAllCoins { coin { created_at id name updated_at } }"
    }
    """
    
    // Convert the GraphQL query to JSON data
    guard let jsonData = graphqlQuery.data(using: .utf8) else {
        print("Error creating JSON data")
        return
    }
    
    // Attach the JSON data to your request
    request.httpBody = jsonData
    
    // Create a URLSession to handle the request
    let session = URLSession.shared
    
    // Perform the request
    let task = session.dataTask(with: request) { data, response, error in
        // Check for errors
        if let error = error {
            print("Error with fetching data: \(error)")
            return
        }
        
        // Check for the response code and handle the response data
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode),
              let data = data else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network or parsing error"])))
            return
        }
        
        // Handle the response data
        do {
            let decodedResponse = try JSONDecoder().decode(CoinsResponse.self, from: data)
            if let coins = decodedResponse.data["coin"] {
                completion(.success(coins))
            } else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data parsing error"])))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
    
    // Start the task
    task.resume()
}
