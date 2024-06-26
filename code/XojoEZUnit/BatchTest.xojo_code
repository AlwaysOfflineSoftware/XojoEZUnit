#tag Class
Protected Class BatchTest
	#tag Method, Flags = &h21
		Private Shared Sub Finished()
		  XojoEZUnit.Results.Display(testsThatRan)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Run(testsIdentifier as String = "test_", postfix as boolean = False)
		  If(testsIdentifier.Lowercase<>"run") Then
		    Var batch as New BatchTest
		    Var tests() as String
		    Var identifierLength as Integer= testsIdentifier.Length
		    
		    // Create methods in this class to make a test suite, different suites can 
		    // Identified with different pre or post fixes and all run by this method.
		    // By default tests are identified by the pre-fix "test_"
		    if(postFix) then 
		      For Each method As Introspection.MethodInfo In Introspection.GetType(batch).GetMethods
		        if(method.Name.Right(identifierLength)=testsIdentifier) then
		          tests.Add(method.Name)
		        end
		      Next
		    else
		      For Each method As Introspection.MethodInfo In Introspection.GetType(batch).GetMethods
		        if(method.Name.Left(identifierLength)=testsIdentifier) then
		          tests.Add(method.Name)
		        end
		      Next
		    end
		    
		    Var runCount As Integer= 0
		    For Each method As Introspection.MethodInfo In Introspection.GetType(batch).GetMethods
		      for Each testName as String in tests
		        If(method.Name= testName) Then
		          method.Invoke(batch)
		          If(Results.SearchLogs(runCount)) then
		            testsThatRan.Add(method.Name + " | PASS")
		          Else
		            testsThatRan.Add(method.Name + " | FAIL")
		          End
		          runCount= runCount+1
		        End
		      next
		    Next
		    
		  Else
		    Raise New InvalidArgumentException("Tests cannot be identified with the word 'run'",-1)
		  end
		  Finished()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_MyBatch()
		  Results.SetFailMessage("TEST 1 FAIL")
		  XojoEZUnit.Assert.IsFalse(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_MyBatch2()
		  Results.SetFailMessage("TEST 2 FAIL")
		  XojoEZUnit.Assert.IsTrue(True)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared testsThatRan() As String
	#tag EndProperty


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
