Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA57w7jF014864
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 02:58:07 -0500
Received: from mail-gx0-f216.google.com (mail-gx0-f216.google.com
	[209.85.217.216])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA57vu70013950
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 02:57:56 -0500
Received: by gxk8 with SMTP id 8so66828gxk.11
	for <linux-lvm@redhat.com>; Wed, 04 Nov 2009 23:57:55 -0800 (PST)
From: Adam Mooz <adam.mooz@gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--72200340
Date: Thu, 5 Nov 2009 02:57:53 -0500
Message-Id: <C613C4C4-17B6-48A0-A5CD-36A89F815198@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1076)
Subject: [linux-lvm] PFree is 0 on a drive with nothing on it
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


--Apple-Mail-4--72200340
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes

Hello List,

I have a fileserver that is driving me nuts at the moment.  Setup:
4x 1TB HDD's
1x 320GB HDD
They all have the same partition layout:
512MB Swap, rest is LVM data.
The LVM only contains ~400GB of data, but 2 of the TB drives report  
having 0 free PFree's:
   PV                   VG        Fmt  Attr PSize   PFree
   /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
   /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
   /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
   /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
   /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G

I've successfully managed to remove SDE from the LVM, but I need to  
move the data off SDD onto either SDA or SDB.  When the whole system  
is mounted it properly reports having 2.1TB of free space (931 * 2 +  
297). Is there an easy way to fix this issue?


--Apple-Mail-4--72200340
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">Hello =
List,<div><br></div><div>I have a fileserver that is driving me nuts at =
the moment. &nbsp;Setup:</div><div>4x 1TB HDD's</div><div>1x 320GB =
HDD</div><div>They all have the same partition layout:</div><div>512MB =
Swap, rest is LVM data.</div><div>The LVM only contains ~400GB of data, =
but 2 of the TB drives report having 0 free =
PFree's:</div><div><div>&nbsp;&nbsp;PV &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; VG &nbsp; &nbsp; &nbsp; &nbsp;Fmt =
&nbsp;Attr PSize &nbsp; PFree =
&nbsp;</div><div>&nbsp;&nbsp;/dev/mapper/cryptsda fileshare lvm2 a- =
&nbsp; 931.03G &nbsp; &nbsp; =
&nbsp;0&nbsp;</div><div>&nbsp;&nbsp;/dev/mapper/cryptsdb fileshare lvm2 =
a- &nbsp; 931.03G &nbsp; &nbsp; =
&nbsp;0&nbsp;</div><div>&nbsp;&nbsp;/dev/mapper/cryptsdc fileshare lvm2 =
a- &nbsp; 297.61G 297.61G</div><div>&nbsp;&nbsp;/dev/mapper/cryptsdd =
fileshare lvm2 a- &nbsp; 931.03G =
633.42G</div><div>&nbsp;&nbsp;/dev/mapper/cryptsde &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; lvm2 -- &nbsp; 931.04G =
931.04G</div><div><br></div><div>I've successfully managed to remove SDE =
from the LVM, but I need to move the data off SDD onto either SDA or =
SDB. &nbsp;When the whole system is mounted it properly reports having =
2.1TB of free space (931 * 2 + 297). Is there an easy way to fix this =
issue? &nbsp;</div><div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><font =
class=3D"Apple-style-span" color=3D"#929292"><font =
class=3D"Apple-style-span" =
color=3D"#000000"><br></font></font></div></div></div></body></html>=

--Apple-Mail-4--72200340--
