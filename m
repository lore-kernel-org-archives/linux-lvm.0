Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7G7QCV11062
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 03:26:12 -0400
Received: from web52205.mail.yahoo.com (web52205.mail.yahoo.com
	[206.190.48.128])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j7G7Q5jA032564
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 03:26:06 -0400
Message-ID: <20050816072600.26570.qmail@web52205.mail.yahoo.com>
Date: Tue, 16 Aug 2005 00:26:00 -0700 (PDT)
From: <john_gore@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-18080213-1124177160=:25879"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vg works fine under FC3, but not FC4
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

--0-18080213-1124177160=:25879
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan). 
 
I can plug back in the old boot drive and run under fc3 and things work well.
 
The vg consists of 1 lv and 2 pv drives configured as:
 
my_vg:
  my_lv1:
     hdc2 (ext2)
     hdd (single partition as ext2) 
 
The old hda boot disk is ext3 running FC3 and the new hda boot disk is running the dafault lvm partitions under FC4. 
 
hdc is formatted with boot and swap on hdc1 and hdc5 - probably this was from an earlier install (although I did have these disks plugged in while installing FC4 - when the installer started asking about reformatting hdc and hdd, I powered down, unplugged these drives, and redid the install)
 
Any ideas to try?
 
- John



--0-18080213-1124177160=:25879
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan). </DIV>
<DIV>&nbsp;</DIV>
<DIV>I can plug back in the old boot drive and run under&nbsp;fc3 and things work well.</DIV>
<DIV>&nbsp;</DIV>
<DIV>The&nbsp;vg&nbsp;consists of 1 lv and 2 pv drives configured as:</DIV>
<DIV>&nbsp;</DIV>
<DIV>my_vg:</DIV>
<DIV>&nbsp; my_lv1:</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; hdc2&nbsp;(ext2)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hdd (single partition as ext2) </DIV>
<DIV>&nbsp;</DIV>
<DIV>The old hda boot disk&nbsp;is ext3 running FC3 and the new hda boot disk is running the dafault lvm partitions under FC4. </DIV>
<DIV>&nbsp;</DIV>
<DIV>hdc is formatted with boot and swap on hdc1 and hdc5 - probably this was from an earlier install (although I did have these disks plugged in while installing FC4 - when the installer started asking about reformatting hdc and hdd, I&nbsp;powered&nbsp;down,&nbsp;unplugged these drives, and redid the install)</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any ideas to try?</DIV>
<DIV>&nbsp;</DIV>
<DIV>- John</DIV><BR><BR>
--0-18080213-1124177160=:25879--
