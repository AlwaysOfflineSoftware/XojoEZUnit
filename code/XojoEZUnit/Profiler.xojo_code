#tag Class
Protected Class Profiler
	#tag Method, Flags = &h0
		Shared Function GetTime() As Integer
		  return timeToComplete //returns nanoseconds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub MemoryLogger()
		  While(profilerRunning)
		    memoryLog.Add(Runtime.MemoryUsed.ToString)
		    worker.Sleep(interval*1000)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Start()
		  profilerRunning= True
		  worker= New memLogTemplate
		  startSeconds = DateTime.Now.Nanosecond
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Start(enableMemLog as Boolean)
		  profilerRunning= True
		  worker= new memLogTemplate
		  If(enableMemLog) Then
		    worker.Start
		  End
		  startSeconds = DateTime.Now.Nanosecond
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Start(enableMemLog as Boolean, intervalSeconds as integer)
		  profilerRunning= True
		  worker= new memLogTemplate
		  If(enableMemLog) Then
		    interval=intervalSeconds
		    worker.Start
		  End
		  startSeconds = DateTime.Now.Nanosecond
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Stop()
		  endSeconds = DateTime.Now.Nanosecond
		  timeToComplete= endSeconds-startSeconds
		  profilerRunning= False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Stop() As Integer
		  endSeconds = DateTime.Now.Nanosecond
		  timeToComplete= endSeconds-startSeconds
		  profilerRunning= False
		  
		  Return timeToComplete  //returns nanoseconds
		End Function
	#tag EndMethod


	#tag Note, Name = To Do
		Get this Threaded
		Add things to enable for profiling coverage (Memory Logging, usages, ect)
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shared endSeconds As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared interval As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared memoryLog() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared profilerRunning As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared startSeconds As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared timeToComplete As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared worker As Thread
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
