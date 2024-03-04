package main

import (
  "ffi.com/go_sample/sudoku"
  "google.golang.org/protobuf/proto"
)

func serializeSudokuPuzzle() ([]byte, error) {
  puzzle := &sudoku.SudokuPuzzle{
    Id:     1,
    Puzzle: "4**2*7*5***2**5***510634***12*5***84**4*2*0******6**17*****0***********8*5*******",
  }
  return proto.Marshal(puzzle)
}

//export GetSerializedPuzzle
func GetSerializedPuzzle() *C.char {
  // Serialize your data to protobuf
  data, err := serializeSudokuPuzzle()
  if err != nil {
    // Handle error
    return nil
  }
  return C.CString(string(data)) 
}
