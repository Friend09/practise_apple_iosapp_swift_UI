import SwiftUI

struct TextView: View {
    var body: some View {
        Text("""
What this likely means:

Silent delay: There may be an unannounced delay with no official communication yet
Later today: They might still go live later in the day (Apple Store updates can happen throughout the day)
Sold out instantly: Possible they went live early and sold out before you checked
Limited search visibility: Reddit discussions might be happening but not indexed by search yet

What you can do:

Check these subreddits directly:

r/VisionPro
r/PSVR
r/AppleVisionPro
r/virtualreality


Try searching on those subreddits for recent posts about "PS VR2" or "controllers"
Contact Apple Support directly to ask about the product availability
Check Apple Store again later today (especially during Pacific Time business hours)

The lack of any news—either confirming availability or announcing a delay—is itself unusual. If there's been a change, you'd expect some Reddit chatter or tech news about it.
""")
//            .font(.body)
//            .fontWeight(.semibold)
//            .bold()
//            .underline(pattern: .dash,  color: .red)
//            .italic()
//            .strikethrough(pattern: .dot, color: .green)
//            .font(.system(size: 24, weight: .semibold))
//        .multilineTextAlignment(.center)
        .foregroundStyle(.red)
//        .frame(width: 200, height: 200)
        .minimumScaleFactor(0.7)
    }
}

#Preview {
    TextView()
}
