Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DBmO6E020405
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 07:48:24 -0400
Received: from loninmrp8.uk.db.com (loninmrp8.uk.db.com [160.83.58.66])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DBm8Lf022418
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 07:48:09 -0400
Received: from sdbo1007.sg.db.com (sininmailp1007.sg.db.com [10.171.194.115])
	by loninmrp8.uk.db.com (8.14.4/8.14.4) with ESMTP id o3DBlkDO009492
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 12:48:07 +0100
In-Reply-To: <m2hbf00f8301004130330k798bf501j468ede0e76a00807@mail.gmail.com>
MIME-Version: 1.0
From: Alan Pek <alan.pek@db.com>
Message-ID: <OFCBF086A9.E900B788-ON48257704.003F8AB0-48257704.0040D2A4@db.com>
Date: Tue, 13 Apr 2010 19:47:57 +0800
Content-Type: multipart/alternative;
	boundary="=_alternative 0040D2A148257704_="
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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
--=_alternative 0040D2A148257704_=
Content-Type: text/plain; charset="US-ASCII"

Hi Folks,

Thanks.

singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap /dev/rootvg/rootlv

  Logical volume "rsnap" created

But why the above work ?

And

singmrecfp1001:~ # mount /dev/mapper/rootvg-rsnap /mnt/rootlv/snap
singmrecfp1001:~ # df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/rootvg-rootlv
                       2621356   1637876    983480  63% /
tmpfs                  4000100         4   4000096   1% /dev/shm
/dev/md0                102712     40056     62656  39% /boot
/dev/mapper/rootvg-rsnap
                       2621356   1636964    984392  63% /mnt/rootlv/snap


However I don't see any lv with lvs

singmrecfp1001:~ # lvs
  LV     VG     Attr   LSize Origin Snap%  Move Log Copy%
  rootlv rootvg owi-ao 2.50G
  swaplv rootvg -wi-ao 1.00G

I will now mount a NFS filesystem and do a tar of this snapshot.

Is there anything I have to take care if now, my rootdisk is gone.

How do I restore from this snapshot , any specific settings like creating 
bootable block ?

The root filesystem is reiserfs and it has software mirrored.

Regards
Alan

---

This e-mail may contain confidential and/or privileged information. If you 
are not the intended recipient (or have received this e-mail in error) 
please notify the sender immediately and destroy this e-mail. Any 
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.
--=_alternative 0040D2A148257704_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi Folks,</font>
<br>
<br><font size=2 face="sans-serif">Thanks.</font>
<br>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # lvcreate -L 2.5g
-s -n rsnap /dev/rootvg/rootlv</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; Logical volume &quot;rsnap&quot;
created</font>
<br>
<br><font size=2 face="sans-serif">But why the above work ?</font>
<br>
<br><font size=2 face="sans-serif">And</font>
<br>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # mount /dev/mapper/rootvg-rsnap
/mnt/rootlv/snap</font>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # df -k</font>
<br><font size=2 face="sans-serif">Filesystem &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; 1K-blocks &nbsp; &nbsp; &nbsp;Used Available Use% Mounted on</font>
<br><font size=2 face="sans-serif">/dev/mapper/rootvg-rootlv</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2621356 &nbsp; 1637876 &nbsp;
&nbsp;983480 &nbsp;63% /</font>
<br><font size=2 face="sans-serif">tmpfs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;4000100 &nbsp; &nbsp; &nbsp; &nbsp; 4 &nbsp;
4000096 &nbsp; 1% /dev/shm</font>
<br><font size=2 face="sans-serif">/dev/md0 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;102712 &nbsp; &nbsp; 40056 &nbsp; &nbsp; 62656
&nbsp;39% /boot</font>
<br><font size=2 face="sans-serif">/dev/mapper/rootvg-rsnap</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2621356 &nbsp; 1636964 &nbsp;
&nbsp;984392 &nbsp;63% /mnt/rootlv/snap</font>
<br>
<br>
<br><font size=2 face="sans-serif">However I don't see any lv with lvs</font>
<br>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # lvs</font>
<br><font size=2 face="sans-serif">&nbsp; LV &nbsp; &nbsp; VG &nbsp; &nbsp;
Attr &nbsp; LSize Origin Snap% &nbsp;Move Log Copy%</font>
<br><font size=2 face="sans-serif">&nbsp; rootlv rootvg owi-ao 2.50G</font>
<br><font size=2 face="sans-serif">&nbsp; swaplv rootvg -wi-ao 1.00G</font>
<br>
<br><font size=2 face="sans-serif">I will now mount a NFS filesystem and
do a tar of this snapshot.</font>
<br>
<br><font size=2 face="sans-serif">Is there anything I have to take care
if now, my rootdisk is gone.</font>
<br>
<br><font size=2 face="sans-serif">How do I restore from this snapshot
, any specific settings like creating bootable block ?</font>
<br>
<br><font size=2 face="sans-serif">The root filesystem is reiserfs and
it has software mirrored.</font>
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
--=_alternative 0040D2A148257704_=--
