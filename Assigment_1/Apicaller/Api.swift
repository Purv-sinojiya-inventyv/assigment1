import Foundation

func fetchData(user: UserModel, completion: @escaping (Result<Welcome, Error>) -> Void) {
    
    guard let url = URL(string: "https://test-hmsync.connect-beurer.com/BHMCWebAPI/User/GetValidateUser") else {  // ✅ Replace with actual API URL
        let error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        completion(.failure(error))
        return
    }
    
    do {
        let jsonData = try JSONEncoder().encode(user)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                // ✅ Ensure `httpResponse` is declared properly
                guard let httpResponse = response as? HTTPURLResponse else {
                    let error = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"])
                    completion(.failure(error))
                    return
                }
                
                // ✅ Validate HTTP status code range (2xx = success)
                guard (200...299).contains(httpResponse.statusCode) else {
                    let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Server returned an error"])
                    completion(.failure(error))
                    return
                }
                
                let result = try JSONDecoder().decode(Welcome.self, from: data)
                print("Response:", result)
                
                completion(.success(result))  // ✅ Call success completion
                
            } catch {
                print("Error fetching data:", error)
                completion(.failure(error))  // ✅ Call failure completion properly
            }
        }
    } catch {
        print("Encoding Error:", error)
        completion(.failure(error))  // ✅ Call failure completion for encoding error
    }
}
