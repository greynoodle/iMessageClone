//
//  Contact.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/10/22.
//

import Foundation
import Contacts

class FetchedContacts: ObservableObject, Identifiable {
    @Published var contacts: [CNContact] = []
    @Published var error: Error? = nil
    
    func fetchContacts() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            
            if granted {
                let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
                
                request.sortOrder = .givenName
                
                do {
                    var contactsArray = [CNContact]()
                    try store.enumerateContacts(with: request, usingBlock: { (contact, store) in
                        if (contact.phoneNumbers.first?.value.stringValue) != nil{
                            contactsArray.append(contact)
                        }
                    })
                    
                    self.contacts = contactsArray
                    
                } catch let error {
                    print("Failed to enumerate contact, error: \(error)")
                }
            } else {
                print("access denied")
            }
        }
    }
}

struct Contact: Identifiable, Hashable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumbers: [String]
    var emailAddresses: [String]
}
