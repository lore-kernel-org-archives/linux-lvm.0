MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3B9A2.7E1FCBCF"
Message-ID: <5EDC40261519564AB9A8760651C77A1D58581F@btiburmail01.bustech.com>
content-class: urn:content-classes:message
From: "George Campbell" <george.campbell@bustech.com>
Subject: [linux-lvm] LVM backup server
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Dec  3 07:42:09 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: Charlie Pasquariello <charlie.pasquariello@bustech.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3B9A2.7E1FCBCF
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I followed the LVM HOW-TO to install and configure LVM on a Linux =
server. I defined a single volume group, a single logical volume, and =
about 14 separate physical extents on a SAN. It works fine.=20
My question is, what steps need to be done beyond the initial rpm =
install and activation to configure LVM on a second server that will =
only be used for backup if the first server goes down. I don't want to =
do anything that would wipe out any data on the logical volume, but I =
want the volume group and logical volume to be defined exactly as the =
original server has them defined.=20
It seems I should NOT do any pvcreates. Can I just do the vgcreate, =
followed by the lvcreate, skip doing the mk2fs, and do the mount of the =
logical volume?=20
=20
Thanks,
George Campbell
Bus-Tech, Inc.
=20
=20

------_=_NextPart_001_01C3B9A2.7E1FCBCF
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3B978.94AAC720">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:DrawingGridHorizontalSpacing>3.9 =
pt</w:DrawingGridHorizontalSpacing>
  <w:DrawingGridVerticalSpacing>5.3 pt</w:DrawingGridVerticalSpacing>
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEve=
ry>
  =
<w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:PrintColBlack/>
   <w:ShowBreaksInFrames/>
   <w:SuppressSpBfAfterPgBrk/>
   <w:SwapBordersFacingPages/>
   <w:ConvMailMergeEsc/>
   <w:UsePrinterMetrics/>
   <w:WW6BorderRules/>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:AutoSpaceLikeWord95/>
   <w:NoSpaceRaiseLower/>
   <w:DoNotUseHTMLParagraphAutoSpacing/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
  </w:Compatibility>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle16
	{mso-style-type:personal-compose;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:black;}
@page Section1
	{size:8.5in 11.0in;
	margin:.4in 0in 0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
</head>

<body lang=3DEN-US style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>I followed the LVM HOW-TO to install and configure LVM on a Linux
server. I defined a single volume group, a single logical volume, and =
about 14
separate physical extents on a SAN. It works fine. =
<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>My question is, what steps need to be done beyond the initial rpm
install and activation to configure LVM on a second server that will =
only be
used for backup if the first server goes down. I don&#8217;t want to do =
anything that
would wipe out any data on the logical volume, but I want the volume =
group and
logical volume to be defined exactly as the original server has them =
defined. <o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>It seems I should NOT do any pvcreates. Can I just do the =
vgcreate,
followed by the lvcreate, skip doing the mk2fs, and do the mount of the =
logical
volume? <o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Thanks,<o:p></o:p></span></font></span></p>

<p class=3DMsoAutoSig><!--[if supportFields]><font color=3Dblack><span=20
style=3D'color:black'><span =
style=3D'mso-element:field-begin'></span><span=20
style=3D"mso-spacerun: yes">&nbsp;</span>AUTOTEXTLIST \s &quot;E-mail=20
Signature&quot; <span =
style=3D'mso-element:field-separator'></span></span></font><![endif]--><f=
ont
color=3Dblack><span style=3D'color:black'>George =
Campbell</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoAutoSig><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>Bus-Tech, Inc.</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
8.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;mso-bidi-font-family:"T=
imes New Roman";
color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:8.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;mso-bidi-font-family:"Times New =
Roman";color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><!--[if supportFields]><font color=3Dblack><span=20
style=3D'color:black'><span =
style=3D'mso-element:field-end'></span></span></font><![endif]--><font
color=3Dblack><span style=3D'color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

</div>

</body>

</html>

------_=_NextPart_001_01C3B9A2.7E1FCBCF--
