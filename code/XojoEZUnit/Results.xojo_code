#tag Class
Protected Class Results
	#tag Method, Flags = &h0
		Shared Sub Display()
		  var percentHundreds as double= PercentPassed * 100.00
		  
		  System.DebugLog("")
		  System.DebugLog("===XojoEZUnit Results======")
		  System.DebugLog("=== Tests Passed: " + passCount.ToString)
		  System.DebugLog("=== Tests Failed: " + failCount.ToString)
		  System.DebugLog("=== Passed Percent: " + percentHundreds.ToString + "%")
		  System.DebugLog("========================")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Display(testFailed as String)
		  var percentHundreds as double= PercentPassed * 100.00
		  
		  System.DebugLog("==============XojoEZUnit Results===================")
		  System.DebugLog("=== Tests Passed: " + passCount.ToString)
		  System.DebugLog("=== Tests Failed: " + failCount.ToString)
		  System.DebugLog("=== Passed Percent: " + percentHundreds.ToString + "%")
		  System.DebugLog("=== Failed on test: " + testFailed)
		  System.DebugLog("================================================")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Fail()
		  failCount= failCount+1
		  
		  if(Results.failedTestName<>"") then
		    XojoEZUnit.Results.Display(Results.failedTestName)
		  else
		    XojoEZUnit.Results.Display()
		  end
		  
		  Raise New XojoUnitTestFailedException(failedMessage,failedCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Pass()
		  passCount= passCount+1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PercentFailed() As Double
		  var total as Integer= failCount + passCount
		  testPercentage= failCount/total
		  
		  return testPercentage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PercentPassed() As Double
		  var total as Integer= failCount + passCount
		  testPercentage= passCount/total
		  
		  return testPercentage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetFailMessage(msg as String, code as integer = -1)
		  if(msg<>"") then
		    failedMessage= msg
		  else
		    failedMessage= failedMessage
		  end
		  
		  if(code<>0) then
		    failedCode= code
		  else
		    failedCode= -1
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared failCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared failedCode As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared failedMessage As String = "A unit test exception has occurred"
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared failedTestName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared passCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared testPercentage As Double = 0.0
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
