Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BM7fO17229
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 17:07:41 -0500
Received: from zrtps0kp.nortelnetworks.com (zrtps0kp.nortelnetworks.com
	[47.140.192.56])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1BM7eEK030512
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 17:07:41 -0500
Received: from zrtpd0j7.us.nortel.com (zrtpd0j7.us.nortel.com [47.140.203.25])
	by zrtps0kp.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with
	ESMTP id j1BM7YO02279
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 17:07:34 -0500 (EST)
Message-ID: <420D2B34.1040207@nortel.com>
From: Joe Harvell <harvell@nortel.com>
Date: Fri, 11 Feb 2005 17:01:24 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C51086.147AB2F7"
Subject: [linux-lvm] Feature Request (revert a logical volume to its
	snapshot)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C51086.147AB2F7
Content-Type: text/plain;
	charset="iso-8859-1"

I really love the snapshot logical volume feature, and I use it for 
making consistent backups of my system while it is running.

Recently, though I found myself wanting to use a snapshot logical volume 
to preserve the state of a filesystem while I experimented with 
changes.  When I needed to revert, I had to copy the contents from the 
snashot logical volume, destroy the snapshot and snapshot source, and 
then replace the snapshot source with the copy I made of the snapshot.

It seems like it would make sense for LVM to support a feature to revert 
the source logical volume to the state it was in when the snapshot was 
taken.  I read through all the man pages but I didn't see anything like 
this.  I realize it might not be possible to do this atomically while 
the source logical volume is active, but that's fine.  I would still 
like to be able to do it when the source is inactive.

------_=_NextPart_001_01C51086.147AB2F7
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2658.2">
<TITLE>Feature Request (revert a logical volume to its snapshot)</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>I really love the snapshot logical volume feature, and I use it for </FONT>
<BR><FONT SIZE=2>making consistent backups of my system while it is running.</FONT>
</P>

<P><FONT SIZE=2>Recently, though I found myself wanting to use a snapshot logical volume </FONT>
<BR><FONT SIZE=2>to preserve the state of a filesystem while I experimented with </FONT>
<BR><FONT SIZE=2>changes.&nbsp; When I needed to revert, I had to copy the contents from the </FONT>
<BR><FONT SIZE=2>snashot logical volume, destroy the snapshot and snapshot source, and </FONT>
<BR><FONT SIZE=2>then replace the snapshot source with the copy I made of the snapshot.</FONT>
</P>

<P><FONT SIZE=2>It seems like it would make sense for LVM to support a feature to revert </FONT>
<BR><FONT SIZE=2>the source logical volume to the state it was in when the snapshot was </FONT>
<BR><FONT SIZE=2>taken.&nbsp; I read through all the man pages but I didn't see anything like </FONT>
<BR><FONT SIZE=2>this.&nbsp; I realize it might not be possible to do this atomically while </FONT>
<BR><FONT SIZE=2>the source logical volume is active, but that's fine.&nbsp; I would still </FONT>
<BR><FONT SIZE=2>like to be able to do it when the source is inactive.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C51086.147AB2F7--
