import SwiftUI

struct PickerView: View {
    
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent",
        "Most Popular",
        "Most Liked"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
                ForEach(filterOptions.indices) { index in
                    Text(filterOptions[index])
                        .tag(filterOptions[index])
                }
            }
        )
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    PickerView()
}
