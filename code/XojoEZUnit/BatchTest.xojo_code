#tag Class
Protected Class BatchTest
	#tag Method, Flags = &h0
		Shared Sub Run(testsIdentifier as String = "test_", postfix as boolean = False)
		  if(testsIdentifier.Lowercase<>"run") then
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
		    
		    For Each method As Introspection.MethodInfo In Introspection.GetType(batch).GetMethods
		      for Each testName as String in tests
		        if(method.Name= testName) then
		          method.Invoke(batch)
		        end
		      next
		    Next
		  else
		    Raise New InvalidArgumentException("Tests cannot be identified with the word 'run'",-1)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_MyBatch()
		  XojoEZUnit.Assert.IsFalse(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_MyBatch2()
		  XojoEZUnit.Assert.IsFalse(True)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
