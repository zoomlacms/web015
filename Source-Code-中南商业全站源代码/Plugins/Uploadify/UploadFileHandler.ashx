<%@ WebHandler Language="C#" Class="UploadFileHandler" %>

using System;
using System.Web;
using System.IO;
using ZoomLa.BLL;
using ZoomLa.Model;
   
/*
 * 用于文件工厂.
 */ 

public class UploadFileHandler : IHttpHandler {

    B_DocModel bll = new B_DocModel();
    M_DocModel model = new M_DocModel();
    B_Admin badmin = new B_Admin();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        HttpPostedFile file=context.Request.Files["Filedata"];
        //string uploadPath = HttpContext.Current.Server.MapPath(@context.Request["folder"])+"\\UploadFile\\";
        string uploadPath = HttpContext.Current.Server.MapPath("~/UploadFiles/DocTemp/");//+ HttpContext.Current.Request.Params["userName"]+"/"
        if (file != null)
        {
            if (!Directory.Exists(uploadPath))
            { Directory.CreateDirectory(uploadPath); }
            file.SaveAs(uploadPath + file.FileName);
            //------------- Isert To DataBase ZL_DocModel
            model.AddTime = DateTime.Now;
            model.AddUser = "";
            model.AllowGroup = "1";
            model.DocName = file.FileName;
            model.Status = 2;
            model.ParentID = HttpContext.Current.Request.Params["passwd"];
            model.TemUrl = "~/UploadFiles/DocTemp/" + HttpContext.Current.Request.Params["userName"] + file.FileName;

            bll.insert(model);
            //不返回,则前台不会自动将其显示消去.
            context.Response.Write("1");
        }
        else 
        {
            context.Response.Write("0");

        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}