import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        ZStack {
            if vm.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                    .onMove(perform: vm.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
