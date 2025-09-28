# 📱 Tazo AI Chat  

**Tazo AI Chat** არის iOS აპლიკაცია, რომელიც იყენებს Google Gemini API-ს, შექმნილია როგორც სასწავლო და პრაქტიკული პროექტი.  
აპი გაძლევს საშუალებას კომუნიკაცია გქონდეს Gemini AI მოდელთან (gemini-2.5-flash-lite).  

---

# 🎥 Demo  
![App Demo](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3psMHA5MGxsazNiNWNqbWlibWhyOWRnNWVpemhpOTFkbWZvMzltZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/HNXX2MHyYSUNJfOUfe/giphy.gif)


# 🛠 Tech Stack
- *Language*: Swift 5.10  
- *Framework*: SwiftUI  
- *Architecture*: MVVM (Model–View–ViewModel)  
- *Networking*: URLSession + async/await  
- *Dependency Injection*: Protocol-based abstraction ("NetworkService")  
- *Error Handling*: Strong typing with "enum GeminiNetworkError" 
- *UI/UX*: SwiftUI Property Wrappers ("@State", "@StateObject", "@Binding")  

---

# 📚 Swift Fundamentals
ამ პროექტში გამოყენებულია:  
- ✅ *Protocol-oriented programming* → "NetworkService"  
- ✅ *Async/await concurrency* → "sendMessage(_:)"  
- ✅ *Error handling* "do-catch" + custom "enum" 
- ✅ *MVVM pattern* (ViewModel + ObservableObject)  
- ✅ *SwiftUI property wrappers* → "@State", "@StateObject", "@Published" 
- ✅ *Reusable components* → "MessageBubbleView", "ChatInputBarView", "ChatBackgroundView"

🔮 Next Steps
- Offline message persistence (Core Data / Realm)
- Dark Mode refinements
- Voice-to-Text integration
- Rich message types (images, markdown)  

