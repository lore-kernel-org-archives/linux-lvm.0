Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HK3Gj18563
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 15:03:16 -0500
Received: from p15124399.pureserver.info (p15124399.pureserver.info
	[217.160.182.169])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HK3D4b030484
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 15:03:14 -0500
Received: from rockley.barbados (81-5-142-175.dsl.eclipse.net.uk
	[81.5.142.175]) (authenticated (0 bits))
	by p15124399.pureserver.info (8.11.6/8.11.6) with ESMTP id i2HK38V30309
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 20:03:08 GMT
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
From: Nick Gushlow <nick@gushlow.com>
In-Reply-To: <20040317143106.GA14348@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
	<20040315123445.GA17078@redhat.com>
	<1079478248.28877.6.camel@rockley.barbados>
	<20040317143106.GA14348@redhat.com>
Content-Type: multipart/alternative; boundary="=-lX6HBUglGH4dPSlSEHjV"
Message-Id: <1079553784.28897.49.camel@rockley.barbados>
Mime-Version: 1.0
Date: Wed, 17 Mar 2004 20:03:04 +0000
Reply-To: nick@gushlow.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-lX6HBUglGH4dPSlSEHjV
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-03-17 at 14:31, Heinz Mauelshagen wrote:

> 
> Deactivate the VG and rerun pvcreate/vgcfgrestore on the pvremoved disk,
> vgscan and "vgchange -ay vg2" afterwards.
> 

Excellent that did the trick. :-) 

The only way I found to get rid of the "VGDA in kernel and lvmtab are
NOT consistent: please run vgscan" error when running 'vgchange -an vg2"
was to reboot.

For future reference, is there a better/proper method to get rid of that
error?

Nick.

--=-lX6HBUglGH4dPSlSEHjV
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.9">
</HEAD>
<BODY>
On Wed, 2004-03-17 at 14:31, Heinz Mauelshagen wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>
Deactivate the VG and rerun pvcreate/vgcfgrestore on the pvremoved disk,
vgscan and &quot;vgchange -ay vg2&quot; afterwards.
</I></FONT></PRE>
</BLOCKQUOTE>
Excellent that did the trick. :-) <BR>
<BR>
The only way I found to get rid of the &quot;VGDA in kernel and lvmtab are NOT consistent: please run vgscan&quot; error when running 'vgchange -an vg2&quot; was to reboot.<BR>
<BR>
For future reference, is there a better/proper method to get rid of that error?<BR>
<BR>
Nick.
</BODY>
</HTML>

--=-lX6HBUglGH4dPSlSEHjV--
