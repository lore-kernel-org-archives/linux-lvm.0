Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3CGExpE000375
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 12:14:59 -0400
Received: from loninmrp8.uk.db.com (loninmrp8.uk.db.com [160.83.58.66])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3CGEi4S001633
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 12:14:44 -0400
Received: from sdbo1007.sg.db.com (sininmailp1007.sg.db.com [10.171.194.115])
	by loninmrp8.uk.db.com (8.14.4/8.14.4) with ESMTP id o3CGEgUK007527
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 17:14:43 +0100
MIME-Version: 1.0
From: Alan Pek <alan.pek@db.com>
Message-ID: <OF75144135.FA049A9C-ON48257703.00588F0C-48257703.00593B92@db.com>
Date: Tue, 13 Apr 2010 00:14:34 +0800
Content-Type: multipart/alternative;
	boundary="=_alternative 00593B8F48257703_="
Subject: [linux-lvm] How do I properly backup and restore / on LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 00593B8F48257703_=
Content-Type: text/plain; charset="US-ASCII"

Hi Folks,

How do I properly backup and restore / on LVM2 , e.g.

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/rootvg-rootlv
                       2621356   1902288    719068  73% /
tmpfs                 25165824         4  25165820   1% /dev/shm
/dev/cciss/c0d0p1       106040     45992     60048  44% /boot

Am running SLES9 , should be similar in Redhat and my pvdisplay looks 
like, HW RAID 1.

 pvdisplay
  --- Physical volume ---
  PV Name               /dev/cciss/c0d1p1
  VG Name               idrwebvg
  PV Size               136.70 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              34994
  Free PE               20914
  Allocated PE          14080
  PV UUID               SFsdRA-ENGD-63KU-MV7x-OvuE-Rx5T-9fFYpb

  --- Physical volume ---
  PV Name               /dev/cciss/c0d0p2
  VG Name               rootvg
  PV Size               68.23 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              17467
  Free PE               16571
  Allocated PE          896
  PV UUID               wq9uRc-Gn9y-BbZI-PMLg-iWaC-PjlE-BsldqC

Regards
Alan

---

This e-mail may contain confidential and/or privileged information. If you 
are not the intended recipient (or have received this e-mail in error) 
please notify the sender immediately and destroy this e-mail. Any 
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.
--=_alternative 00593B8F48257703_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi Folks,</font>
<br>
<br><font size=2 face="sans-serif">How do I properly backup and restore
/ on LVM2 , e.g.</font>
<br>
<br><font size=3 face="Fixed Miriam Transparent">Filesystem &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; 1K-blocks &nbsp; &nbsp; &nbsp;Used Available Use%
Mounted on</font>
<br><font size=3 face="Fixed Miriam Transparent">/dev/mapper/rootvg-rootlv</font>
<br><font size=3 face="Fixed Miriam Transparent">&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2621356 &nbsp; 1902288
&nbsp; &nbsp;719068 &nbsp;73% /</font>
<br><font size=3 face="Fixed Miriam Transparent">tmpfs &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 25165824 &nbsp; &nbsp; &nbsp; &nbsp;
4 &nbsp;25165820 &nbsp; 1% /dev/shm</font>
<br><font size=3 face="Fixed Miriam Transparent">/dev/cciss/c0d0p1 &nbsp;
&nbsp; &nbsp; 106040 &nbsp; &nbsp; 45992 &nbsp; &nbsp; 60048 &nbsp;44%
/boot</font>
<br>
<br><font size=2 face="sans-serif">Am running SLES9 , should be similar
in Redhat and my pvdisplay looks like, HW RAID 1.</font>
<br>
<br><font size=2 face="sans-serif">&nbsp;pvdisplay</font>
<br><font size=2 face="sans-serif">&nbsp; --- Physical volume ---</font>
<br><font size=2 face="sans-serif">&nbsp; PV Name &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; /dev/cciss/c0d1p1</font>
<br><font size=2 face="sans-serif">&nbsp; VG Name &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; idrwebvg</font>
<br><font size=2 face="sans-serif">&nbsp; PV Size &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 136.70 GB / not usable 0</font>
<br><font size=2 face="sans-serif">&nbsp; Allocatable &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; yes</font>
<br><font size=2 face="sans-serif">&nbsp; PE Size (KByte) &nbsp; &nbsp;
&nbsp; 4096</font>
<br><font size=2 face="sans-serif">&nbsp; Total PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;34994</font>
<br><font size=2 face="sans-serif">&nbsp; Free PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 20914</font>
<br><font size=2 face="sans-serif">&nbsp; Allocated PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;14080</font>
<br><font size=2 face="sans-serif">&nbsp; PV UUID &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; SFsdRA-ENGD-63KU-MV7x-OvuE-Rx5T-9fFYpb</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; --- Physical volume ---</font>
<br><font size=2 face="sans-serif">&nbsp; PV Name &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; /dev/cciss/c0d0p2</font>
<br><font size=2 face="sans-serif">&nbsp; VG Name &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; rootvg</font>
<br><font size=2 face="sans-serif">&nbsp; PV Size &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 68.23 GB / not usable 0</font>
<br><font size=2 face="sans-serif">&nbsp; Allocatable &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; yes</font>
<br><font size=2 face="sans-serif">&nbsp; PE Size (KByte) &nbsp; &nbsp;
&nbsp; 4096</font>
<br><font size=2 face="sans-serif">&nbsp; Total PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;17467</font>
<br><font size=2 face="sans-serif">&nbsp; Free PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 16571</font>
<br><font size=2 face="sans-serif">&nbsp; Allocated PE &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;896</font>
<br><font size=2 face="sans-serif">&nbsp; PV UUID &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; wq9uRc-Gn9y-BbZI-PMLg-iWaC-PjlE-BsldqC</font>
<br>
<br><font size=2 face="sans-serif">Regards</font>
<br><font size=2 face="sans-serif">Alan</font>
<br>
<span style="font-family:'Arial',sans-serif; font-size:8pt; color:#000000">---<br>
<br>
This e-mail may contain confidential and/or privileged information. If you <br>
are not the intended recipient (or have received this e-mail in error) <br>
please notify the sender immediately and destroy this e-mail. Any <br>
unauthorized copying, disclosure or distribution of the material in this <br>
e-mail is strictly forbidden.</span>
--=_alternative 00593B8F48257703_=--
