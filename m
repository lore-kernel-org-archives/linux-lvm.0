Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB18HqhG006742
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 03:17:52 -0500
Received: from smtpout2.cf.ac.uk (smtpout2.cf.ac.uk [131.251.137.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB18Hg5g005182
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 03:17:43 -0500
Received: from mdomsmp01.cf.ac.uk ([10.255.228.22])
	by smtpout2.cf.ac.uk with esmtp (Exim 4.69)
	(envelope-from <Rees@cardiff.ac.uk>) id 1NFNvZ-0007xJ-Cx
	for linux-lvm@redhat.com; Tue, 01 Dec 2009 08:17:41 +0000
In-Reply-To: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
References: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] show free space _inside_ logical volume
From: Lyn Rees <Rees@cardiff.ac.uk>
Message-ID: <OFF61168D1.48755A2C-ON8025767F.002D5800-8025767F.002D8A50@cardiff.ac.uk>
Date: Tue, 1 Dec 2009 08:17:23 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 002D899E8025767F_="
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multipart message in MIME format.
--=_alternative 002D899E8025767F_=
Content-Type: text/plain; charset="US-ASCII"

If you mount the filesystem, 'df' will tell you how big it is, you can 
compare that to the output of lvdisplay.
--------------------------------------------------
Mr Lyn Rees
Senior Engineer, UIG
Information Services Computing Centre
Cardiff University, 40-41 Park Place,
Cardiff. CF10 3BB.
--------------------------------------------------
Contact numbers:
 (029) 2087 9188 (direct)
 (029) 2087 4875 (reception)
 (029) 2087 4285 (fax)
--------------------------------------------------
Email: rees@cardiff.ac.uk
Web: www.cardiff.ac.uk



From:
Gabriel <jarod125@gmail.com>
To:
linux-lvm@redhat.com
Date:
01/12/2009 00:46
Subject:
[linux-lvm] show free space _inside_ logical volume



Hi all,

I'm interested to know if it is possible to check the amount of free
space _inside_ a LV. I know that usually a LV is fully "occupied" by a
partition, but there is a (short) period when there is a gap between
the size of the partition and the size of the LV it resides on. That
happens _after_ doing a lvextend and _before_ doing the resize
(expand) of the filesystem.

First thing I thought of was lvdisplay. While I can see how many LEs
the LV has, I cannot see how many of them are in use by the filesystem
and how many are free (the way pvdisplay shows total/free/allocated
PEs).

It was suggested to me that I try some filesystem tools (resize2fs,
dumpe2fs, tune2fs etc.) that might show me the free space. resize2fs
does not have a 'dry-run' option that would have shown the new size
(in blocks) of the filesystem and I didn't find anything useful in
tune2fs' manual either.

dumpe2fs shows various information such as block count, free blocks
and block size, but I see no modifications when running this before
and after the lvextend command.

I also tried parted -l, but to no avail.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=_alternative 002D899E8025767F_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">If you mount the filesystem, 'df' will
tell you how big it is, you can compare that to the output of lvdisplay.</font>
<br><font size=2 face="sans-serif">
--------------------------------------------------<br>
Mr Lyn Rees<br>
Senior Engineer, UIG<br>
Information Services Computing Centre<br>
Cardiff University, 40-41 Park Place,<br>
Cardiff. CF10 3BB.<br>
--------------------------------------------------<br>
Contact numbers:<br>
 (029) 2087 9188 (direct)<br>
 (029) 2087 4875 (reception)<br>
 (029) 2087 4285 (fax)<br>
--------------------------------------------------<br>
Email: rees@cardiff.ac.uk<br>
Web: </font><a href=www.cardiff.ac.uk><font size=2 face="sans-serif">www.cardiff.ac.uk</font></a>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">From:</font>
<td><font size=1 face="sans-serif">Gabriel &lt;jarod125@gmail.com&gt;</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">To:</font>
<td><font size=1 face="sans-serif">linux-lvm@redhat.com</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">Date:</font>
<td><font size=1 face="sans-serif">01/12/2009 00:46</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">Subject:</font>
<td><font size=1 face="sans-serif">[linux-lvm] show free space _inside_
logical volume</font></table>
<br>
<hr noshade>
<br>
<br>
<br><tt><font size=2>Hi all,<br>
<br>
I'm interested to know if it is possible to check the amount of free<br>
space _inside_ a LV. I know that usually a LV is fully &quot;occupied&quot;
by a<br>
partition, but there is a (short) period when there is a gap between<br>
the size of the partition and the size of the LV it resides on. That<br>
happens _after_ doing a lvextend and _before_ doing the resize<br>
(expand) of the filesystem.<br>
<br>
First thing I thought of was lvdisplay. While I can see how many LEs<br>
the LV has, I cannot see how many of them are in use by the filesystem<br>
and how many are free (the way pvdisplay shows total/free/allocated<br>
PEs).<br>
<br>
It was suggested to me that I try some filesystem tools (resize2fs,<br>
dumpe2fs, tune2fs etc.) that might show me the free space. resize2fs<br>
does not have a 'dry-run' option that would have shown the new size<br>
(in blocks) of the filesystem and I didn't find anything useful in<br>
tune2fs' manual either.<br>
<br>
dumpe2fs shows various information such as block count, free blocks<br>
and block size, but I see no modifications when running this before<br>
and after the lvextend command.<br>
<br>
I also tried parted -l, but to no avail.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
</font></tt>
<br>
<br>
--=_alternative 002D899E8025767F_=--
