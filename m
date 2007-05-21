Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4LEIDqZ032428
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 10:18:13 -0400
Received: from web38214.mail.mud.yahoo.com (web38214.mail.mud.yahoo.com
	[209.191.124.157])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id l4LEICVC009766
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 10:18:12 -0400
Date: Mon, 21 May 2007 07:18:00 -0700 (PDT)
From: Sean McGlynn <sean_mcglynn@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1778335099-1179757080=:80102"
Message-ID: <247618.80102.qm@web38214.mail.mud.yahoo.com>
Subject: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table
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

--0-1778335099-1179757080=:80102
Content-Type: text/plain; charset=ascii

Hello,

I did an fdisk -l to review my partition table (see results below), and found four entries that end with "Disk /dev/dm-X doesn't contain a valid partition table."  I don't recall seeing this in the past, so I believe it is something new.

I recently began using kernel 2.6.21.1, up from 2.6.9-42.  I don't know if perhaps this had some effect, or if the entries are normal and I just never noticed them.

What led me here is that sar -d output includes four entries for hard drives (dev253 entries) when there are only three on my system.  Fdisk is reporting four DM devices, so I'm thinking there is some correlation, but I don't know what.

Any constructrive feedback would be appreciated.

Thank you.

Disk /dev/sda: 1900.1 GB, 1900120375296 bytes
255 heads, 63 sectors/track, 231009 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1      231009  1855579761   8e  Linux LVM

Disk /dev/sdb: 146.1 GB, 146163105792 bytes
255 heads, 63 sectors/track, 17769 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1          38      305203+  83  Linux
/dev/sdb2              39       17769   142424257+  8e  Linux LVM

Disk /dev/sdc: 146.1 GB, 146163105792 bytes
255 heads, 63 sectors/track, 17769 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1       17769   142729461   8e  Linux LVM

Disk /dev/dm-0: 137.4 GB, 137405399040 bytes
255 heads, 63 sectors/track, 16705 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk /dev/dm-0 doesn't contain a valid partition table

Disk /dev/dm-1: 8388 MB, 8388608000 bytes
255 heads, 63 sectors/track, 1019 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk /dev/dm-1 doesn't contain a valid partition table

Disk /dev/dm-2: 146.1 GB, 146150522880 bytes
255 heads, 63 sectors/track, 17768 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk /dev/dm-2 doesn't contain a valid partition table

Disk /dev/dm-3: 1900.1 GB, 1900111986688 bytes
255 heads, 63 sectors/track, 231008 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk /dev/dm-3 doesn't contain a valid partition table


      ____________________________________________________________________________________Shape Yahoo! in your own image.  Join our Network Research Panel today!   http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 


--0-1778335099-1179757080=:80102
Content-Type: text/html; charset=ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><P>Hello,</P>
<P>&nbsp;</P>
<P>I did an fdisk -l to&nbsp;review my partition table (see results below), and found four entries that end&nbsp;with "Disk /dev/dm-X doesn't contain a valid partition table."&nbsp; I don't recall seeing this in the past, so I believe it is something new.</P>
<P>&nbsp;</P>
<P>I recently began using kernel 2.6.21.1, up from 2.6.9-42.&nbsp; I don't know if perhaps this had some effect, or if the entries are normal and I just never noticed them.</P>
<P>&nbsp;</P>
<P>What led me here is that sar -d output includes four entries for hard drives (dev253 entries) when there are only three on my system.&nbsp; Fdisk is reporting four DM devices, so I'm thinking there is some correlation, but I don't know what.</P>
<P>&nbsp;</P>
<P>Any constructrive feedback would be appreciated.</P>
<P>&nbsp;</P>
<P>Thank you.</P>
<P><BR>Disk /dev/sda: 1900.1 GB, 1900120375296 bytes<BR>255 heads, 63 sectors/track, 231009 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<BR>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 231009&nbsp; 1855579761&nbsp;&nbsp; 8e&nbsp; Linux LVM</P>
<P>&nbsp;</P>
<P>Disk /dev/sdb: 146.1 GB, 146163105792 bytes<BR>255 heads, 63 sectors/track, 17769 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<BR>/dev/sdb1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 305203+&nbsp; 83&nbsp; Linux<BR>/dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 39&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17769&nbsp;&nbsp; 142424257+&nbsp; 8e&nbsp; Linux LVM</P>
<P>&nbsp;</P>
<P>Disk /dev/sdc: 146.1 GB, 146163105792 bytes<BR>255 heads, 63 sectors/track, 17769 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<BR>/dev/sdc1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17769&nbsp;&nbsp; 142729461&nbsp;&nbsp; 8e&nbsp; Linux LVM</P>
<P>&nbsp;</P>
<P>Disk /dev/dm-0: 137.4 GB, 137405399040 bytes<BR>255 heads, 63 sectors/track, 16705 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>Disk /dev/dm-0 doesn't contain a valid partition table</P>
<P>&nbsp;</P>
<P>Disk /dev/dm-1: 8388 MB, 8388608000 bytes<BR>255 heads, 63 sectors/track, 1019 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>Disk /dev/dm-1 doesn't contain a valid partition table</P>
<P>&nbsp;</P>
<P>Disk /dev/dm-2: 146.1 GB, 146150522880 bytes<BR>255 heads, 63 sectors/track, 17768 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>Disk /dev/dm-2 doesn't contain a valid partition table</P>
<P>&nbsp;</P>
<P>Disk /dev/dm-3: 1900.1 GB, 1900111986688 bytes<BR>255 heads, 63 sectors/track, 231008 cylinders<BR>Units = cylinders of 16065 * 512 = 8225280 bytes</P>
<P>Disk /dev/dm-3 doesn't contain a valid partition table</P></div><br>
      <hr size=1><a href="http://us.rd.yahoo.com/evt=48250/*http://searchmarketing.yahoo.com/arp/sponsoredsearch_v9.php?o=US2226&cmp=Yahoo&ctv=AprNI&s=Y&s2=EM&b=50">Pinpoint customers </a>who are looking for what you sell. 

</body></html>
--0-1778335099-1179757080=:80102--
