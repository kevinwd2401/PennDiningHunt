//
//  ContentView.swift
//  PennDiningHunt
//
//  Created by Kevin D on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var diningViewModel: DiningHallViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Penn Dining Hunt!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Kevin Du & Chris Yuen")
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
                    .padding()
            
                List {
                    ForEach(diningViewModel.diningHalls) { diningHall in
                        NavigationLink(destination: DiningHallDetailView(viewModel: diningViewModel, diningHall: diningHall)) {
                            DiningHallRowView(diningHall: diningHall)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.2, green: 0.7, blue: 1))
        }
    }
}

struct DiningHallRowView: View {
    @ObservedObject var diningHall: DiningHall
    var body: some View {
        HStack {
            Text(diningHall.name)
            Spacer()
            if diningHall.isCollected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else {
                Text("Not Collected")
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(DiningHallViewModel())
}
