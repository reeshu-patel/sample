<%@page import="java.util.HashSet"%>
<%@page import="com.liferay.portlet.asset.service.AssetTagLocalServiceUtil"%>
<%@page import="com.liferay.portlet.asset.model.AssetTag"%>
<%@page import="org.skali.document.utill.PPTFormat"%>
<%@page import="com.liferay.portlet.journal.service.JournalContentSearchLocalServiceUtil"%>
<%@page import="com.liferay.portlet.journal.model.JournalContentSearch"%>
<%@page import="org.skali.document.utill.AdioFormat"%>
<%@page import="org.skali.document.utill.VideoFormat"%>
<%@page import="com.liferay.portal.util.PortletKeys"%>
<%@page import="com.ibm.wsdl.Constants"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="org.skali.document.utill.XLSFormat"%>
<%@page import="org.skali.document.utill.DocFormat"%>
<%@page import="org.skali.document.utill.PDFFormat"%>
<%@page import="org.skali.document.utill.ImageFormat"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portlet.PortletURLUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="com.liferay.portlet.journal.service.JournalArticleResourceLocalServiceUtil"%>
<%@page import="com.liferay.portlet.journal.model.JournalArticleResource"%>
<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="com.liferay.portlet.journal.service.JournalArticleLocalServiceUtil"%>
<%@page import="com.liferay.portlet.journal.model.JournalArticle"%>
<%@page import="com.product.gallery.service.GalleryProductsDetailsLocalServiceUtil"%>
<%@page import="com.product.gallery.model.GalleryProductsDetails"%>
<%@page import="com.liferay.portlet.documentlibrary.util.DLUtil"%>
<%@page import="com.liferay.portal.kernel.repository.model.FileEntry"%>
<%@page import="com.liferay.portlet.documentlibrary.service.DLAppLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@page import="com.liferay.portal.service.LayoutLocalServiceUtil"%>
<%@page import="javax.portlet.PortletRequest"%>
<%@page import="com.liferay.portlet.PortletURLFactoryUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.liferay.portal.kernel.util.StringBundler"%>
<%@page import="com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil"%>
<%@page import="com.liferay.portlet.documentlibrary.model.DLFileEntry"%>
<%@page import="java.util.Collections"%>
<%@page import="org.apache.commons.beanutils.BeanComparator"%>
<%@page import="com.liferay.portlet.asset.service.AssetEntryLocalServiceUtil"%>
<%@page import="com.liferay.portlet.asset.model.AssetEntry"%>
<%@page import="com.liferay.portlet.asset.model.AssetEntryWrapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%> 
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%> 
<%@taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %> 
<%@page import="javax.swing.text.JTextComponent.KeyBinding"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<script type=text/javascript">jQuery.noConflict();</script>
<portlet:defineObjects />
<theme:defineObjects/>

<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects/>


<div class="row-fluid">
<div class="portlet-column portlet-column-first assetentr span12">
<div class="kblu1123">


<%
List<AssetEntry> tagasset= new ArrayList<AssetEntry>();
List<AssetEntry> assetfilter= new ArrayList<AssetEntry>();
List<AssetEntry> NewAsset = new ArrayList<AssetEntry>();

List<AssetEntry> assetEntries = AssetEntryLocalServiceUtil.getAssetEntries(0, AssetEntryLocalServiceUtil.getAssetEntriesCount());
for(AssetEntry assetcount:assetEntries){
	if(assetcount.getViewCount() !=0 ){
		long FileentryId1 = assetcount.getClassPK();
		List<GalleryProductsDetails> gallaryproduct = GalleryProductsDetailsLocalServiceUtil.getGalleryProductsDetailses(0, GalleryProductsDetailsLocalServiceUtil.getGalleryProductsDetailsesCount());
		for(GalleryProductsDetails gallfile:gallaryproduct){
			long gallfilss= gallfile.getPrimaryFileEntryId();
			if(FileentryId1 == gallfilss ){
				List<DLFileEntry> dlFile = DLFileEntryLocalServiceUtil.getDLFileEntries(0, DLFileEntryLocalServiceUtil.getDLFileEntriesCount());
				for(DLFileEntry dleentry:dlFile){
					if(gallfilss == dleentry.getFileEntryId()  && !(dleentry.isInTrash()) ){
						
						if(dleentry.getExtension().equals(VideoFormat.AVI.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.OGG.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.FLV.toString().toLowerCase()) ||dleentry.getExtension().equals(VideoFormat.M4V.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.MP4.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.MPEG.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.OGG.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.QUICKTIME.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.WMV.toString().toLowerCase()) || dleentry.getExtension().equals(VideoFormat.XMS.toString().toLowerCase()))
						{
							NewAsset.add(assetcount);
						}
						if(dleentry.getExtension().equals(ImageFormat.JPEG.toString().toLowerCase()) ||dleentry.getExtension().equals(ImageFormat.PNG.toString().toLowerCase()) ||dleentry.getExtension().equals(ImageFormat.JPG.toString().toLowerCase()))
						{
							NewAsset.add(assetcount);
						}
						if(dleentry.getExtension().equals(AdioFormat.MP3.toString().toLowerCase()) )
						 {
							 NewAsset.add(assetcount);
						 }
						if(dleentry.getExtension().equals(PDFFormat.PDF.toString().toLowerCase())  )
						{
							 NewAsset.add(assetcount);
						}
						if(dleentry.getExtension().equals(DocFormat.DOC.toString().toLowerCase()) || dleentry.getExtension().equals(DocFormat.DOCX.toString().toLowerCase()) || dleentry.getExtension().equals(DocFormat.ODT.toString().toLowerCase()))	
						 {
							 NewAsset.add(assetcount);
						 }
						 if(dleentry.getExtension().equals(XLSFormat.XLS.toString().toLowerCase()) || dleentry.getExtension().equals(XLSFormat.XLT.toString().toLowerCase()) || dleentry.getExtension().equals(XLSFormat.XLSX.toString().toLowerCase()))
						 {
							 NewAsset.add(assetcount);
						 }
						 if(dleentry.getExtension().equals(PPTFormat.PPTX.toString().toLowerCase()) || dleentry.getExtension().equals(PPTFormat.PPT.toString().toLowerCase()))
						 {
						 	NewAsset.add(assetcount);
							 
						 }
					}
					
				}	
			}
		}
		
		List<JournalArticleResource> journamA = JournalArticleResourceLocalServiceUtil.getJournalArticleResources(0, JournalArticleResourceLocalServiceUtil.getJournalArticleResourcesCount());
		for(JournalArticleResource  resource:journamA){
			String articalid = resource.getArticleId();
			long resourcesprimaryId = resource.getResourcePrimKey();
			if(resourcesprimaryId == FileentryId1 )
			{
		
			List<JournalContentSearch> ContentSearch = JournalContentSearchLocalServiceUtil.getJournalContentSearchs(0, JournalContentSearchLocalServiceUtil.getJournalContentSearchsCount());
			for(JournalContentSearch contentArtical:ContentSearch){
				String Articalidj =contentArtical.getArticleId();
				if(Articalidj.equals(articalid)){
					
					NewAsset.add(assetcount);
					
				}
				
			  }
			 
			}
			
		}
		
	}
	
  } 
for(AssetEntry assetentry:NewAsset){
	long entryid =  assetentry.getEntryId();
	List<AssetTag> aseAssetTags = AssetTagLocalServiceUtil.getAssetEntryAssetTags(entryid);
	long tagid =0L;
	for(AssetTag assettag:aseAssetTags){
		String tagName = assettag.getName();
		if(tagName.equals("product") || tagName.equals("modem") || (tagName.equals("product") || tagName.equals("modem"))){
		tagid  = assettag.getTagId();
		List<AssetEntry> assetEntry2 = AssetEntryLocalServiceUtil.getAssetTagAssetEntries(tagid);
		for(AssetEntry assetent:assetEntry2){
			long entryId = assetent.getEntryId();
			if(entryid == entryId){
			assetfilter.add(assetentry);
				
			}
			
		 }
	  } 
	}
	
}

HashSet<AssetEntry> set = new HashSet<AssetEntry>(assetfilter);
ArrayList<AssetEntry> result = new ArrayList<AssetEntry>(set);
for(AssetEntry sit :result){
	tagasset.add(sit);
}

  BeanComparator comparator = new BeanComparator("viewCount");
  Collections.sort(tagasset, comparator);
  Collections.reverse(tagasset);
  
  long rlTargetPlId3 = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), "/Modems").getPlid();
  PortletURL actionURL = PortletURLFactoryUtil.create(request, "gallery_WAR_galleryportlet", rlTargetPlId3, PortletRequest.RENDER_PHASE);
  actionURL.setWindowState(LiferayWindowState.NORMAL);
  actionURL.setParameter("action", "common");
  %>
 <liferay-ui:search-container delta="3" iteratorURL="<%=actionURL%>"  emptyResultsMessage="there-are-no-content" >
	<liferay-ui:search-container-results>
        <%
        results=ListUtil.subList(tagasset, searchContainer.getStart(), searchContainer.getEnd());
    	total = tagasset.size();
    	pageContext.setAttribute("results",results);
    	pageContext.setAttribute("total", total);
        %>
        </liferay-ui:search-container-results>
       <div classs="displayiten">
       <liferay-ui:search-container-row className="com.liferay.portlet.asset.model.AssetEntry"
		keyProperty="entryId" modelVar="asetype" rowVar="thisrow">

	  <%long FileentryIdC = asetype.getClassPK();%>
      <liferay-ui:search-container-column-text  cssClass="loadingMore1">
     
 <div class="boxId">
	    <%
	    long rlTargetPlId = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), "/Modems").getPlid();
		PortletURL backURL = PortletURLFactoryUtil.create(request, "gallery_WAR_galleryportlet", rlTargetPlId, PortletRequest.RENDER_PHASE);
		backURL.setParameter("p_l_id", rlTargetPlId+"");
		backURL.setParameter("action", "galleryProductDescription");
		backURL.setWindowState(LiferayWindowState.NORMAL);
	    String thumbnailSrc="";
	    String title="";
	    FileEntry fileEntryObject=null;
	    try{
		  fileEntryObject = DLAppLocalServiceUtil.getFileEntry(FileentryIdC);
	    }catch(Exception e){}
	    
		 if(fileEntryObject != null){
		 backURL.setParameter("primaryFileEntryId", fileEntryObject.getFileEntryId()+"");

		 thumbnailSrc = DLUtil.getThumbnailSrc(fileEntryObject, null, themeDisplay);
		 
		 List<GalleryProductsDetails> galleryfile = GalleryProductsDetailsLocalServiceUtil.getByPrimayId(fileEntryObject.getFileEntryId());
		    if(galleryfile.size() !=0){
		    	for(GalleryProductsDetails gall:galleryfile){
		    		String coustomTitle= gall.getCustomTitle();
		    		if(!coustomTitle.equals("")){
		    			title= gall.getCustomTitle();
		    			
		    		}else{
		    			title = fileEntryObject.getTitle();
		    			String extention = fileEntryObject.getExtension();
		    			title= title.replace(extention, "");
		    			title=title.substring(0, title.length()-1);
		    		}
		    	}
		    }
		
		
	 if(fileEntryObject.getExtension().equals(ImageFormat.JPEG.toString().toLowerCase()) || fileEntryObject.getExtension().equals(ImageFormat.PNG.toString().toLowerCase()) || fileEntryObject.getExtension().equals(ImageFormat.JPG.toString().toLowerCase()))
	  {
	 %>
	 <a href="<%=backURL.toString()%>">
		<div class="imagesc productImage" align="middle">
	    <img src="<%=thumbnailSrc%>"/>
		</div>
		<div class="doctitle">
		<%=title%>
		</div>
	 </a>
	<%}
	if(fileEntryObject.getExtension().equals(PDFFormat.PDF.toString().toLowerCase())){
		DLFileEntry dl=DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntryObject.getFileEntryId());
		String filePathpdf ="/documents/"+fileEntryObject.getGroupId()+"/"+dl.getFolderId()+"/"+dl.getTitle()+"/"+dl.getUuid();
		%>
		<a href="<%=filePathpdf%>" target="">
			<div  align="center" class="imagesc pdfImage">
	    	 <img src="<%=thumbnailSrc%>"/>
			</div>
			<div class="doctitle">
			<%=title%>
			</div>
		</a>
		
	<%}	
	
	if(fileEntryObject.getExtension().equals(DocFormat.DOC.toString().toLowerCase()) || fileEntryObject.getExtension().equals(DocFormat.DOCX.toString().toLowerCase()) || fileEntryObject.getExtension().equals(DocFormat.ODT.toString().toLowerCase()) || fileEntryObject.getExtension().equals(XLSFormat.XLS.toString().toLowerCase()) || fileEntryObject.getExtension().equals(XLSFormat.XLT.toString().toLowerCase()) || fileEntryObject.getExtension().equals(XLSFormat.XLSX.toString().toLowerCase()) )		
	 {
		String fileentryidd= String.valueOf(fileEntryObject.getFileEntryId());
		DLFileEntry dl=DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntryObject.getFileEntryId());
		String filePathdoc ="/documents/"+fileEntryObject.getGroupId()+"/"+dl.getFolderId()+"/"+dl.getTitle()+"/"+dl.getUuid();
	%>
	<a href="<%=filePathdoc%>" target="">
	 	 <div class="imagesc">
	   		<img src="<%=thumbnailSrc%>"/>
		</div>
		
		<div class="doctitle">
			<%=title%>
		</div>
	</a>
	<%}
	if(fileEntryObject.getExtension().equals(AdioFormat.MP3.toString().toLowerCase()))
	  {
		DLFileEntry dl=DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntryObject.getFileEntryId());
		String filePathAudio ="/documents/"+fileEntryObject.getGroupId()+"/"+dl.getFolderId()+"/"+dl.getTitle()+"/"+dl.getUuid();
		
		long rppid = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), "/letestUpload").getPlid();
		PortletURL backURLmp3 = PortletURLFactoryUtil.create(request, "letestupload_WAR_galleryportlet", rppid, PortletRequest.RENDER_PHASE);
		backURLmp3.setParameter("p_l_id", rlTargetPlId+"");
		backURLmp3.setParameter("action", "audioplay");
		backURLmp3.setParameter("filepath5", filePathAudio);
	 %>
	  <a href="<%=backURLmp3.toString()%>">
		<div class="imagesc">
	   		<img src="<%=thumbnailSrc%>"/>
			</div>
			<div class="doctitle">
			<%=title%>
			</div>
		</a>
	<%}
	if(fileEntryObject.getExtension().equals(VideoFormat.AVI.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.OGG.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.FLV.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.M4V.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.MP4.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.MPEG.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.OGG.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.QUICKTIME.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.WMV.toString().toLowerCase()) || fileEntryObject.getExtension().equals(VideoFormat.XMS.toString().toLowerCase()))
	  {
		
		DLFileEntry dl=DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntryObject.getFileEntryId());
		String filePathvedio ="/documents/"+fileEntryObject.getGroupId()+"/"+dl.getFolderId()+"/"+dl.getTitle()+"/"+dl.getUuid();
		
		long rppidvedio = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), "/letestUpload").getPlid();
		PortletURL backURLVedio = PortletURLFactoryUtil.create(request, "letestupload_WAR_galleryportlet", rppidvedio, PortletRequest.RENDER_PHASE);
		backURLVedio.setParameter("p_l_id", rlTargetPlId+"");
		backURLVedio.setParameter("action", "videoplay");
		backURLVedio.setParameter("filepath", filePathvedio);
	 %>
	  <a href="<%=backURLVedio.toString()%>">
			<div class="imagesc">
	   
			<img src="<%=thumbnailSrc%>"/>
			</div>
			<div class="doctitle">
			<%=title%>
			</div>
		</a>
	<%}
	
	if(fileEntryObject.getExtension().equals(PPTFormat.PPTX.toString().toLowerCase()) || fileEntryObject.getExtension().equals(PPTFormat.PPT.toString().toLowerCase()))
	{	
		DLFileEntry dl=DLFileEntryLocalServiceUtil.getDLFileEntry(fileEntryObject.getFileEntryId());
		String filePathppt ="/documents/"+fileEntryObject.getGroupId()+"/"+dl.getFolderId()+"/"+dl.getTitle()+"/"+dl.getUuid();
		%>
			 <a href="<%=filePathppt%>" target="">
				<div class="imagesc">
	  				<img src="<%=thumbnailSrc%>"/>
				</div>
				<div class="doctitle">
					<%=title%>
				</div>
			</a>
			<%}
	
			}else {
		%>
		<div class="imageTitweb">
		<%
		String tillePage = asetype.getTitle(locale);
		
		long resourcePrimary = asetype.getClassPK();
		List<JournalArticle> articl = new ArrayList<JournalArticle>();
		String Articaltitle="";
		String Articald ="";
		long layoutid =0L;
		String portletid="";
		List<JournalArticle> jounArticles = JournalArticleLocalServiceUtil.getArticlesByResourcePrimKey(resourcePrimary);
		for(JournalArticle  resource:jounArticles){
			String articalid = resource.getArticleId();
		    List<JournalContentSearch> ContentSearch = JournalContentSearchLocalServiceUtil.getJournalContentSearchs(0, JournalContentSearchLocalServiceUtil.getJournalContentSearchsCount());
			for(JournalContentSearch contentArtical:ContentSearch){
				String Articalidj =contentArtical.getArticleId();
				if(articalid.equals(Articalidj)){
					
				 portletid = contentArtical.getPortletId();
				 layoutid = contentArtical.getLayoutId();
				
				 articl.add(resource);
					
				}
				
			}
		}
		 if(!portletid.equals("")){
		   long rlTargetPlId112 = PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(), portletid);
		   // long rlTargetPlId112 = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), PageName).getPlid();
			PortletURL webcontent = PortletURLFactoryUtil.create(request, portletid, rlTargetPlId112, PortletRequest.RENDER_PHASE);
			webcontent.setWindowState(LiferayWindowState.NORMAL);
		    %>
			<a href="<%=webcontent.toString()%>">
			  <%=asetype.getTitle(locale)%>
			</a>
			<%
		    }else{
		    String PageName = "/TOOLS";
			long rlTargetPlId112 = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), PageName).getPlid();
			PortletURL webcontent = PortletURLFactoryUtil.create(request, "", rlTargetPlId112, PortletRequest.RENDER_PHASE);
			webcontent.setWindowState(LiferayWindowState.NORMAL);
		    %>
			<a href="<%=webcontent.toString()%>">
			 <%=asetype.getTitle(locale)%>
			 </a>
		<%} 
		    
	    }
		%>
			
	</div>
	</div>

       </liferay-ui:search-container-column-text>
       </liferay-ui:search-container-row>   
       </div>   
       
	<liferay-ui:search-iterator searchContainer="<%= searchContainer %>" paginate="<%= false %>" />
	</liferay-ui:search-container> 
 	 <div class="AllAssetView" align="right">
        <% 
        long rlTargetPlId1 = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), layout.isPrivateLayout(), "/Gallery").getPlid();
		PortletURL backURL1 = PortletURLFactoryUtil.create(request, "gallery_WAR_galleryportlet", rlTargetPlId1, PortletRequest.RENDER_PHASE);
		backURL1.setWindowState(LiferayWindowState.NORMAL);
		backURL1.setParameter("action", "common");
		%>
			<a href="<%=backURL1.toString()%>">
				<div id="" class="AllAsset1">VIEW ALL</div>
			</a>
			</div> 
	
		</div>
		
	</div>
	
</div>