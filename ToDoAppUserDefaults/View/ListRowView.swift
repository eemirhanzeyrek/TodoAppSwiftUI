import SwiftUI

struct ListRowView: View {
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

#Preview {
    var item1 = Item(title: "First item", isCompleted: false)
    var item2 = Item(title: "Second item", isCompleted: true)
    
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
