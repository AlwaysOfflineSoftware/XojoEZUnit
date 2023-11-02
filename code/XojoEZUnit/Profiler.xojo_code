#tag Class
Protected Class Profiler
	#tag Method, Flags = &h0
		Shared Function GetTime() As Integer
		  return timeToComplete //returns nanoseconds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Start()
		  startSeconds = DateTime.Now.Nanosecond
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Stop()
		  endSeconds = DateTime.Now.Nanosecond
		  timeToComplete= endSeconds-startSeconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Stop() As Integer
		  endSeconds = DateTime.Now.SecondsFrom1970
		  timeToComplete= endSeconds-startSeconds
		  
		  Return timeToComplete  //returns nanoseconds
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared endSeconds As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared startSeconds As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared timeToComplete As Integer
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
