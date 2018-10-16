Imports System.Web
Imports System.Web.Services

Public Class ImageHandler
    Implements IHttpHandler, System.Web.SessionState.IRequiresSessionState

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest

        'context.Response.ContentType = "text/plain"
        'context.Response.Write("Hello World!")
        If (context.Session("ImageBytes")) IsNot Nothing Then
            Dim image As Byte() = CType((context.Session("ImageBytes")), Byte())
            context.Response.ContentType = "image/JPEG"
            context.Response.BinaryWrite(image)
        End If
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class