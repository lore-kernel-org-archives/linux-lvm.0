Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KDtXem008984
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:55:33 -0400
Received: from incantation.Mines.EDU (incantation.Mines.EDU [138.67.130.6])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KDtWUn026714
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:55:33 -0400
Received: from merlin.Mines.EDU (merlin.Mines.EDU [138.67.4.11])
	(authenticated bits=0)
	by incantation.Mines.EDU (8.12.11.20060308/8.12.11) with ESMTP id
	k8KDtOep016282
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 07:55:27 -0600
Subject: Re: [linux-lvm] LVM on RAID
From: "Matthew B. Brookover" <mbrookov@mines.edu>
In-Reply-To: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
Content-Type: multipart/alternative; boundary="=-j2Dm+xfVZCRVknBRErKg"
Date: Wed, 20 Sep 2006 07:55:24 -0600
Message-Id: <1158760524.26653.4.camel@merlin.Mines.EDU>
Mime-Version: 1.0
Reply-To: mbrookov@mines.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-j2Dm+xfVZCRVknBRErKg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have used LVM on top of software raid and ISCSI.  It works well.  It
also helps keep track of what device is where.  ISCSI does not export
its targets in the same order, some times sdb shows up as sdc....   LVM
will keep track of what is what.

Matt

On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:

> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which 
> are currently single devices on our 64bit linux servers (RHEL-4, core5). 
> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I 
> don't doubt the reliability and robustness of LVM2 on single drives, but I 
> worry about it on top of RAID devices.
> 
> Does anyone have any experience with LVM on to of RAID volumes, positive 
> or negative?
> 
> Thanks,
> 
> Alex
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-j2Dm+xfVZCRVknBRErKg
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.6.2">
</HEAD>
<BODY>
I have used LVM on top of software raid and ISCSI.&nbsp; It works well.&nbsp; It also helps keep track of what device is where.&nbsp; ISCSI does not export its targets in the same order, some times sdb shows up as sdc....&nbsp;&nbsp; LVM will keep track of what is what.<BR>
<BR>
Matt<BR>
<BR>
On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000">We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which </FONT>
<FONT COLOR="#000000">are currently single devices on our 64bit linux servers (RHEL-4, core5). </FONT>
<FONT COLOR="#000000">We are considering LVM'ing 2 or more of the RAID's into a LVM group. I </FONT>
<FONT COLOR="#000000">don't doubt the reliability and robustness of LVM2 on single drives, but I </FONT>
<FONT COLOR="#000000">worry about it on top of RAID devices.</FONT>

<FONT COLOR="#000000">Does anyone have any experience with LVM on to of RAID volumes, positive </FONT>
<FONT COLOR="#000000">or negative?</FONT>

<FONT COLOR="#000000">Thanks,</FONT>

<FONT COLOR="#000000">Alex</FONT>

<FONT COLOR="#000000">_______________________________________________</FONT>
<FONT COLOR="#000000">linux-lvm mailing list</FONT>
<FONT COLOR="#000000"><A HREF="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></FONT>
<FONT COLOR="#000000"><A HREF="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</A></FONT>
<FONT COLOR="#000000">read the LVM HOW-TO at <A HREF="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT>
</PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-j2Dm+xfVZCRVknBRErKg--
