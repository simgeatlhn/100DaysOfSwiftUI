//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by simge on 3.03.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject ,Content:View>: View {
    
    //2
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content:(T) -> Content
    
    var body: some View {
         List(fetchRequest, id: \.self) { singer in
             self.content(singer)
         }
     }

    //dynamically filtering
     init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
         _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
         self.content = content
     }
    
}


