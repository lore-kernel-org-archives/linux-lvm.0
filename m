Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6JC1Ca28363
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 08:01:12 -0400
Received: from darrel.wageswebworks.hom (cols6946139190.cols.net
	[69.46.139.190])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6JC13Xn021542
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 08:01:05 -0400
Received: from darrel.wageswebworks.hom (localhost.localdomain [127.0.0.1])
	by darrel.wageswebworks.hom (8.12.11/8.12.11) with ESMTP id
	i6JC0xeN003994
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 07:01:01 -0500
Received: (from darrel@localhost)
	by darrel.wageswebworks.hom (8.12.11/8.12.11/Submit) id i6JC0vww003993
	for linux-lvm@redhat.com; Mon, 19 Jul 2004 07:00:57 -0500
Subject: Re: [linux-lvm] lvm2 problems adding a new physical volume
From: "Darrel Wages Jr." <dotcomdmc@centurytel.net>
In-Reply-To: <20040719034222.GB23079@agk.surrey.redhat.com>
References: <1090076983.4381.15.camel@darrel.wageswebworks.hom>
	<20040719034222.GB23079@agk.surrey.redhat.com>
Content-Type: multipart/alternative; boundary="=-oHAL27TV8lcI4VdZPHI6"
Message-Id: <1090238457.3967.3.camel@darrel.wageswebworks.hom>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 07:00:57 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-oHAL27TV8lcI4VdZPHI6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2004-07-19 at 04:42 +0100, Alasdair G Kergon wrote:

> On Sun, Jul 18, 2004 at 09:44:03AM -0500, Darrel Wages Jr. wrote:
> > I try to extend vg darrel with vgextend but it failed. So I ran
> 
> How does it fail?  What error?
> 
> Alasdair


It doesn't really give me an error It just won't let me add the new
drive to any volume groups and pvdisplay 
always say that the new drive is not allocatable even after a pvchange -
x y /dev/hdd.
 --- NEW Physical volume ---
  PV Name               /dev/hdd
  VG Name
  PV Size               115.04 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               k14iEH-C7W2-904v-DEh1-ANlT-rhD3-H3O0oP



> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Darrel Wages Jr. <dotcomdmc@centurytel.net>

--=-oHAL27TV8lcI4VdZPHI6
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.1.7">
</HEAD>
<BODY>
On Mon, 2004-07-19 at 04:42 +0100, Alasdair G Kergon wrote:</FONT>
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#000000">On Sun, Jul 18, 2004 at 09:44:03AM -0500, Darrel Wages Jr. wrote:</FONT></FONT>
<FONT COLOR="#000000">&gt; I try to extend vg darrel with vgextend but it failed. So I ran</FONT></FONT>

<FONT COLOR="#000000">How does it fail?  What error?</FONT></FONT>

<FONT COLOR="#000000">Alasdair</FONT></FONT></PRE>
</BLOCKQUOTE>
<BR>
It doesn't really give me an error It just won't let me add the new drive to any volume groups and pvdisplay <BR>
always say that the new drive is not allocatable even after a pvchange -x y /dev/hdd.<BR>
 --- NEW Physical volume ---<BR>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdd<BR>
&nbsp; VG Name<BR>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 115.04 GB<BR>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<BR>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k14iEH-C7W2-904v-DEh1-ANlT-rhD3-H3O0oP<BR>
<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000">_______________________________________________</FONT></FONT>
<FONT COLOR="#000000">linux-lvm mailing list</FONT></FONT>
<A HREF="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</FONT></A>
<A HREF="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</FONT></A>
<FONT COLOR="#000000">read the LVM HOW-TO at </FONT></FONT><U><FONT COLOR="#0000ff">http://tldp.org/HOWTO/LVM-HOWTO/</FONT></FONT></U></PRE>
</BLOCKQUOTE>
<PRE><TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
-- </FONT><BR>
Darrel Wages Jr. &lt;</FONT><A HREF="mailto:dotcomdmc@centurytel.net">dotcomdmc@centurytel.net</FONT></A>&gt;</FONT>
</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-oHAL27TV8lcI4VdZPHI6--
