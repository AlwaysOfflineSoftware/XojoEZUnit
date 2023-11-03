#tag Class
Protected Class Assert
	#tag Method, Flags = &h0
		Shared Sub AreDifferent(expected As Object, actual As Object)
		  If(expected Is actual) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreDifferent(expected() As String, actual() As String)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Pass()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(Not AreSameBytes(expected(i), actual(i))) Then
		      Results.Pass()
		      Return
		    ElseIf(expected(i).Encoding <> actual(i).Encoding) Then
		      Results.Pass()
		      Return
		    End If
		  Next
		  
		  Results.Fail()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreDifferent(expected As String, actual As String)
		  If(AreSameBytes(expected, actual)) Then
		    Results.Fail()
		  ElseIf(Not expected.IsEmpty And expected.Encoding= actual.Encoding) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As Color, actual As Color)
		  Var expectedColor  As String= "RGB(" + expected.Red.ToString + ", " + expected.Green.ToString + ", " + expected.Blue.ToString + "," + expected.Alpha.ToString + ")"
		  Var actualColor  As String= "RGB(" + actual.Red.ToString + ", " + actual.Green.ToString + ", " + actual.Blue.ToString + "," + actual.Alpha.ToString + ")"
		  
		  If(expectedColor = actualColor) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As Currency, actual As Currency)
		  If expected = actual Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As DateTime, actual As DateTime)
		  If(expected Is Nil Xor actual Is Nil) Then
		    Results.Fail()
		  ElseIf(expected Is actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected() As Double, actual() As Double)
		  Var expectedSize, actualSize As Double
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Fail()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Fail()
		      Return
		    End If
		  Next
		  
		  Results.Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As Double, actual As Double, tolerance As Double)
		  Var diff As Double= Abs(expected - actual)
		  
		  If(diff <= (Abs(tolerance) + 0.00000001)) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected() As Integer, actual() As Integer)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Fail()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Fail()
		      Return
		    End If
		  Next
		  
		  Results.Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As Integer, actual As Integer)
		  If(expected = actual) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As MemoryBlock, actual As MemoryBlock)
		  If(expected = actual) Then
		    Results.Pass()
		    Return
		  End If
		  
		  If(expected Is Nil Xor actual Is Nil) Then
		    Results.Fail()
		    Return
		  End If
		  
		  Var expectedSize As Integer = expected.Size
		  Var actualSize As Integer = actual.Size
		  
		  If(expectedSize <> actualSize) Then
		    Results.Fail()
		    Return
		  End If
		  
		  Var sExpected As String = expected.StringValue(0, expectedSize)
		  Var sActual As String = actual.StringValue(0, actualSize)
		  
		  If(sExpected.Compare(sActual, ComparisonOptions.CaseSensitive) = 0) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected() As String, actual() As String)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Fail()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Fail()
		      Return
		    End If
		  Next
		  
		  Results.Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreEqual(expected As String, actual As String)
		  
		  var expectedArray() as String= expected.ToArray
		  var actualArray() as String= actual.ToArray
		  var passingTest as Boolean= True
		  
		  if(expectedArray.Count=actualArray.Count) then
		    for i as Integer=0 to expectedArray.count-1
		      if(expectedArray(i).Asc=actualArray(i).Asc) then
		        Continue
		      else
		        Results.Fail()
		      end
		    next
		  else
		    Results.Fail()
		  end
		  
		  If(expected = actual) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As Color, actual As Color)
		  Var expectedColor  As String= "RGB(" + expected.Red.ToString + ", " + expected.Green.ToString + ", " + expected.Blue.ToString + "," + expected.Alpha.ToString")"
		  Var actualColor  As String= "RGB(" + actual.Red.ToString + ", " + actual.Green.ToString + ", " + actual.Blue.ToString + "," + actual.Alpha.ToString")"
		  
		  If(expectedColor = actualColor) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As Currency, actual As Currency)
		  If expected = actual Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As DateTime, actual As DateTime)
		  If(expected Is Nil Xor actual Is Nil) Then
		    Results.Pass()
		  ElseIf(expected Is actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected() As Double, actual() As Double)
		  Var expectedSize, actualSize As Double
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Pass()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Pass()
		      Return
		    End If
		  Next
		  
		  Results.Fail()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As Double, actual As Double, tolerance As Double)
		  Var diff As Double= Abs(expected - actual)
		  
		  If(diff <= (Abs(tolerance) + 0.00000001)) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected() As Integer, actual() As Integer)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Pass( )
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Pass()
		      Return
		    End If
		  Next
		  
		  Results.Fail()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As Integer, actual As Integer)
		  If(expected = actual) then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As MemoryBlock, actual As MemoryBlock)
		  If(expected = actual) Then
		    Results.Fail()
		    Return
		  End If
		  
		  If(expected Is Nil Xor actual Is Nil) Then
		    Results.Pass()
		    Return
		  End If
		  
		  Var expectedSize As Integer = expected.Size
		  Var actualSize As Integer = actual.Size
		  
		  If(expectedSize <> actualSize) Then
		    Results.Pass()
		    Return
		  End If
		  
		  Var sExpected As String = expected.StringValue(0, expectedSize)
		  Var sActual As String = actual.StringValue(0, actualSize)
		  
		  If(sExpected.Compare(sActual, ComparisonOptions.CaseSensitive) = 0) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected() As String, actual() As String)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Pass()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(expected(i) <> actual(i)) Then
		      Results.Pass()
		      Return
		    End If
		  Next
		  
		  Results.fail()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreNotEqual(expected As String, actual As String)
		  
		  var expectedArray() as String= expected.ToArray
		  var actualArray() as String= actual.ToArray
		  var passingTest as Boolean= True
		  
		  if(expectedArray.Count=actualArray.Count) then
		    for i as Integer=0 to expectedArray.count-1
		      if(expectedArray(i).Asc=actualArray(i).Asc) then
		        Continue
		      else
		        Results.Pass()
		      end
		    next
		  else
		    Results.Pass()
		  end
		  
		  If(expected = actual) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreSame(expected As Object, actual As Object)
		  If(expected Is actual) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreSame(expected() As String, actual() As String)
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If(expectedSize <> actualSize) Then
		    Results.Fail()
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If(Not AreSameBytes(expected(i), actual(i))) Then
		      Results.Fail()
		      Return
		    ElseIf(expected(i).Encoding <> actual(i).Encoding) Then
		      Results.Fail()
		      Return
		    End If
		  Next
		  
		  Results.Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub AreSame(expected As String, actual As String)
		  If(AreSameBytes(expected, actual)) Then
		    Results.Pass()
		  ElseIf(Not expected.IsEmpty And expected.Encoding= actual.Encoding) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function AreSameBytes(s1 As String, s2 As String) As Boolean
		  If(s1.IsEmpty And s2.IsEmpty) Then
		    Return True
		  ElseIf(s1.Bytes <> s2.Bytes) Then
		    Return False
		  Else
		    Var mb1 As MemoryBlock = s1
		    Var mb2 As MemoryBlock = s2
		    Return mb1 = mb2
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub IsFalse(condition as boolean)
		  If(condition) Then
		    Results.Fail()
		  Else
		    Results.Pass()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub IsNil(item as Variant)
		  If(item = Nil) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub IsNotNil(item as Variant)
		  If(item <> Nil) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub IsTrue(condition as boolean)
		  If(condition) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Matches(regExPattern As String, actual As String)
		  If(regExPattern = "") Then
		    Var err As New RegExException
		    err.Message = "No pattern was specified"
		    Raise err
		  End If
		  
		  Var rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If(rx.Search(actual) Is Nil) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub NoMatches(regExPattern As String, actual As String)
		  If(regExPattern = "") Then
		    Var err As New RegExException
		    err.Message = "No pattern was specified"
		    Raise err
		  End If
		  
		  Var rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If(rx.Search(actual) Is Nil) Then
		    Results.Pass()
		  Else
		    Results.Fail()
		  End If
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
