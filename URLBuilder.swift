// This is designed to work with my REST API. 

/// URL builder used to map resources to URLs using a fluent interface.
///
///```
/// Resource()
/// .collection(.user)
/// .identifier(user.id)
/// .collection(.followers)
/// .url
///```
/// - Field `url` returns a `URL` object.
class Resource {
    /// Base domain
    private static let domain = "https://api.your.domain"
    
    /// Components in array form
    private var urlComponents: [String] = [domain]
    
    /// String rendering of urlComponents
    private var urlString: String = ""
    
    /// URL object from urlString
    public var url: URL = URL(string: domain)!
    
    func collection(_ component: ResourceURLComponent) -> Resource {
        self.urlComponents.append(component.rawValue)
        self.urlString = urlComponents.joined(separator: "/")
        self.url = URL(string: urlString)!
        return self
    }
    
    // adds a resource identifier (like the `2` in `api/user/2/followers`)
    func identifier(_ id: Int) -> Resource {
        self.urlComponents.append(String(id))
        self.urlString = urlComponents.joined(separator: "/")
        self.url = URL(string: urlString)!
        return self
    }
    
    // my API can take @me as a resource ID that represents the current logged in user
    func me() -> Resource {
        self.urlComponents.append("@me")
        self.urlString = urlComponents.joined(separator: "/")
        self.url = URL(string: urlString)!
        return self
    }
}

enum ResourceURLComponent: String {
    case user = "user"
    case following = "following"
    case followers = "followers"
}
