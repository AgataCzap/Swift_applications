//
//  NotesView.swift
//  Notes
//
//  Created by John Royal on 7/10/21.
//

import SwiftUI

struct NotesView: View {
  @StateObject var viewModel = NotesViewModel()
    
    // First, add a private computed variable of type URL called documentDirectory. Then, in the getter for the property, use the default singleton instance of the FileManager to retrieve the document directory URL using the url(for:in:appropriateFor:create:) method. For simplicity, we’ll use a force try to call this method.
    private var documentDirectory: URL {
        try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    //Now that we have our directory URL, we can use it to construct a file URL. The URL object in Swift includes several methods that can modify URLs with different file names and extensions. In our case, we’ll use appendingPathComponent(_:) to add the file name and appendingPathExtension(for:) to add an extension.
    
    //In the NotesViewModel, add another private computed variable of type URL called notesFile. This will append the file name and extension to the documentDirectory URL. Our app will store notes in a JSON file called notes,
    
    private var notesFile: URL {
        documentDirectory
            .appendingPathComponent("notes")
            .appendingPathExtension(for: .json)
    }
  
    
    //In the NotesViewModel, add a method called save(). The function should take no parameters and have no return type. Our method will perform two tasks: encoding the notes as data and writing the data to a file. Both of these tasks are failable operations, so remember to mark the save function as throws and use the try keyword for both steps.
    
    //Encoding prepares our notes to be saved by converting them to a format that can be written to a file. Here, we’ll do that by creating a JSONEncoder instance, using it to encode our notes, and assigning the result to a constant called data.
    
//let data = try JSONEncoder().encode(notes)

    //Next, all we need to do is write our encoded data to a file. We can do this by passing the notesFile URL to the write(to:) method, which is part of the Data type returned from the encoder:
    
    //try data.write(to: notesFile)
    
    //finished save method:
    
    func save() throws {
        let data = try JSONEncoder().encode(notes)
        try data.write(to: notesFile)
    }

    //In the NotesViewModel, add a method called load() with the throws keyword and no parameters. To load notes, we simply need to reverse the process of saving them. In other words, we need to read data from the file and decode it to produce Note types that we can work within our app.
    
        //We can initialize a Data object with the contents of our notes file by passing the file’s URL to the Data(contentsOf:) initializer:
    //let data = try Data(contentsOf: notesFile)
    
    //Then, we’ll use a JSONDecoder instance to decode our JSON file data into an array of Note objects. We’ll assign the result to the notes property of the NotesViewModel:
    
//notes = try JSONDecoder().decode([Note].self, from: data)
    
    //full load method
    
    func load() throws {
        let data = try Data(contentsOf: notesFile)
        notes = try JSONDecoder().decode([Note].self, from: data)
    }
    
    //try the model and the app now
    
        .onAppear {
            try! viewModel.load()
        }
    
    //This is the onAppear view modifier, which performs an action when the modified view appears. The action is specified using the provided closure—in this case, we’re calling the load() method on the view model.
    
    //Try to build and run the app. When it opens, it should crash, and the Xcode console should display an error message like this: notes.json file does not exist
    
    //The app crashes because the load() method attempts to read from a file that doesn’t exist. As a solution, the FileManager has an isReadableFile(atPath:) method that we can use to verify that the file exists before we try to read it.
    
    //At the beginning of the load() method in the NotesViewModel, add a guard statement. For the condition, call the isReadableFile(atPath:) method on the default FileManager instance, passing notesFile.path as the path to the file we’re checking (the method does not take a URL). The statement should return if the condition is false
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: notesFile.path) else
        { return }
        let data = try Data(contentsOf: notesFile)
        notes = try JSONDecoder().decode([Note].self, from: data)
    }
    //If you build and run the app now, it should start without a hitch. However, since the save() method isn’t being used, we still don’t have any notes to load yet. We’ll fix that in the next section.
        //Finally, let’s add a way to run the save method on our NotesViewModel whenever the notes property of the view model is changed. We’ll use a view modifier for this as well. In the NotesView, beneath the onAppear modifier we added
    
        .onChange(of: viewModel.notes) { _ in
            try! viewModel.save()
        }
    //This is the onChange(of:perform:) view modifier, which monitors a variable and runs the provided closure whenever its value is changed. Here, we’re using the onChange modifier to run viewModel.save() whenever viewModel.notes is updated. Since the closure receives the new value of the variable as a parameter, the _ in following the opening curly brace is required by the Swift compiler to show that we’re intentionally not using that value.
    

    
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.notes) { note in
          // Each note gets a NavigationLink that points to the EditNoteView for that note. We can open the EditNoteView programatically by setting the `editingNote` property of the view model to this note’s ID.
          NavigationLink(
            note.title,
            destination: EditNoteView(note: binding(for: note)),
            tag: note.id,
            selection: $viewModel.editingNote
          )
        }
        // The onDelete(perform:) modifier in SwiftUI enables the ability to delete a note from the list by swiping left on it and tapping “Delete”. The actual deletion is carried out by the handleDelete(_:) method from the NotesViewModel.
        .onDelete(perform: viewModel.handleDelete(_:))
      }
      .navigationBarItems(trailing: Button(action: viewModel.createNote) {
        Label("New Note", systemImage: "plus.circle.fill")
      })
      .navigationTitle("My Notes")
    }
    // MARK: - Persistence
    // Add your code here
    
    
    
    
    
  }
  
  /// Returns the given note as a binding. This is required because the `EditNoteView` requires a binding so that the note can be edited, and the SwiftUI `ForEach` element doesn’t provide a binding.
  private func binding(for note: Note) -> Binding<Note> {
    guard let index = viewModel.notes.firstIndex(of: note) else {
      fatalError("Cannot find note: \(note)")
    }
    return $viewModel.notes[index]
  }
}

struct NotesView_Previews: PreviewProvider {
  static var previews: some View {
    NotesView()
  }
}
