#tag Class
Protected Class Results
	#tag Method, Flags = &h0
		Shared Sub Display()
		  Var percentHundreds As Double= PercentPassed * 100.00
		  
		  System.DebugLog("===XojoEZUnit Results======")
		  System.DebugLog(" ")
		  System.DebugLog("=== Tests Passed: " + passCount.ToString)
		  System.DebugLog("=== Tests Failed: " + failCount.ToString)
		  System.DebugLog("=== Passed Percent: " + percentHundreds.ToString + "%")
		  System.DebugLog(" ")
		  System.DebugLog("========================")
		  
		  If(testResultsFile<>Nil) Then
		    Var resultsOut As String="Tests Passed: " + passCount.ToString _
		    + EndOfLine + "Tests Failed: " + failCount.ToString _
		    + EndOfLine + "Passed Percent: " + percentHundreds.ToString + "%"
		    WriteToFile(testResultsFile,resultsOut,True)
		    System.DebugLog("results written to: " + testResultsFile.NativePath)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Display(testsRecords() as String)
		  Var percentHundreds As Double= PercentPassed * 100.00
		  
		  System.DebugLog("===XojoEZUnit Results======")
		  System.DebugLog(" ")
		  System.DebugLog("=== Tests Passed: " + passCount.ToString)
		  System.DebugLog("=== Tests Failed: " + failCount.ToString)
		  System.DebugLog("=== Passed Percent: " + percentHundreds.ToString + "%")
		  System.DebugLog(" ")
		  System.DebugLog("=== Tests That Ran: ")
		  For Each record As String In testsRecords
		    System.DebugLog("======" + record)
		  Next
		  System.DebugLog(" ")
		  System.DebugLog("========================")
		  
		  If(testResultsFile<>Nil) Then
		    Var resultsOut As String="Tests Passed: " + passCount.ToString _
		    + EndOfLine + "Tests Failed: " + failCount.ToString _
		    + EndOfLine + "Passed Percent: " + percentHundreds.ToString + "%"_
		    + EndOfLine + "Tests That Ran: "
		    For Each record As String In testsRecords
		      resultsOut= resultsOut + EndOfLine + "=" + record
		    Next
		    WriteToFile(testResultsFile,resultsOut,True)
		    System.DebugLog("results written to: " + testResultsFile.NativePath)
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Fail()
		  failCount= failCount+1
		  ResultsLog.add(False)
		  
		  If(Not failOver) Then
		    Raise New XojoUnitTestFailedException(failedMessage,failedCode)
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Pass()
		  passCount= passCount+1
		  ResultsLog.add(True)
		  
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
		Shared Function SearchLogs(logNum as integer) As Boolean
		  Return ResultsLog(logNum)
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

	#tag Method, Flags = &h0
		Shared Sub SetResultsMode(continueOnFail as boolean, writeResultsToFile as FolderItem)
		  failOver=continueOnFail
		  testResultsFile=writeResultsToFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub WriteToFile(folder as folderitem, data as string, overwrite as boolean)
		  Var fullFilePath As FolderItem= folder
		  Var output As TextOutputStream
		  
		  Try
		    If(overwrite) Then // Write or Overwrite
		      output= TextOutputStream.Create(fullFilePath)
		      output.Encoding = Encodings.SystemDefault
		      output.WriteLine(data)
		      output.Close
		    Else // Write New
		      If(fullFilePath= Nil) Then
		        output= TextOutputStream.Create(fullFilePath)
		        output.Encoding = Encodings.SystemDefault
		        output.WriteLine(data)
		        output.Close
		      Else // Append
		        output= TextOutputStream.Open(fullFilePath)
		        output.Encoding = Encodings.SystemDefault
		        output.Write(data)
		        output.Close
		      End If
		    End
		  Catch e As IOException
		    System.DebugLog(e.Message)
		  End Try
		  
		  
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

	#tag Property, Flags = &h21
		Private Shared failOver As boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared passCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared ResultsLog() As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared testPercentage As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared testResultsFile As FolderItem
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
