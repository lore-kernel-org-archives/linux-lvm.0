Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8BJ5dcl000576
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2006 15:05:39 -0400
Received: from web30313.mail.mud.yahoo.com (web30313.mail.mud.yahoo.com
	[209.191.69.75])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k8BJ5VgA012725
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2006 15:05:32 -0400
Message-ID: <20060911190526.29856.qmail@web30313.mail.mud.yahoo.com>
Date: Mon, 11 Sep 2006 12:05:26 -0700 (PDT)
From: Tom+Dale <tdmyth@yahoo.com>
Subject: Re: [linux-lvm] Wrecked Logical Volume with vgreduce --removemissing
In-Reply-To: <4500547F.6050503@utsouthwestern.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1239899857-1158001526=:27730"
Content-Transfer-Encoding: 8bit
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

--0-1239899857-1158001526=:27730
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit



Peter Smith <peter.smith@utsouthwestern.edu> wrote:           Ok.  It sounds like the fix will have to involve finding a way to get back to your installed-configuration.  The one that defines your VG as containing *only* hda5 and hdb.  It sounds like you succeeded extending the LV to include sda, but forgot to expand the filesystem after that.  Which, ultimately, may save you.  I don't have enough experience with LVM (or just LVM2) to be able to tell you either how to edit your current mangled config to force your LV to forget about sda (which it sounds like you were successful accomplishing anyways) *or* to recover the before-sda configuration.  I've looked at the config on my own workstation and even though I'm using LVM2 I don't see any evidence of backed-up or historical LVM2 configuration data.  So I *really* don't know what to tell you there.  But I think it should be do-able.  There may be someone out there capable of helping with this, but I'm afraid it likely isn't
 me.  Although I might try and reproduce this on one of my Fedora machines to see if I get stuck in the same box which you are in.
 
 Peter
 
 Tom+Dale wrote: I had a bad drive in my volume group, so I tried "vgreduce --removemissing VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial VolGroup00" which also appeared to complete successfully.    It seems like I was partly successful but I cannot get the logical volume to be recognized.  I don't know what else to do?  Where can I learn more about LVM?  How does one utilize the LVM archive or backup files?  Can't seem to find an answer to this problem.  Is all of my data lost?
   
   [root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00 
 Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 
 O_DIRECT will be used 
 Setting global/locking_type to 1 
 Setting global/locking_dir to /var/lock/lvm 
 File-based locking enabled. 
 Using logical volume(s) on command line 
 Locking /var/lock/lvm/V_VolGroup00 WB 
 Opened /dev/sda RW 
 /dev/sda: block size is 4096 bytes 
 /dev/sda: No label detected 
 Opened /dev/hda1 RW 
 /dev/hda1: block size is 1024 bytes 
 /dev/hda1: No label detected 
 Opened /dev/hda2 RW 
 /dev/hda2: block size is 4096 bytes 
 /dev/hda2: No label detected 
 Opened /dev/hda3 RW 
 /dev/hda3: block size is 4096 bytes 
 /dev/hda3: No label detected 
 Opened /dev/hda5 RW 
 /dev/hda5: block size is 512 bytes 
 /dev/hda5: lvm2 label detected 
 lvmcache: /dev/hda5 now orphaned 
 lvmcache: /dev/hda5 now in VG VolGroup00 
 Opened /dev/hdb RW 
 /dev/hdb: block size is 4096 bytes 
 /dev/hdb: lvm2 label detected 
 lvmcache: /dev/hdb now orphaned 
 lvmcache: /dev/hdb now in VG VolGroup00 
 /dev/hda5: lvm2 label detected 
 /dev/hdb: lvm2 label detected 
 /dev/hda5: lvm2 label detected 
 /dev/hdb: lvm2 label detected 
 Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720 
 /dev/hda5: lvm2 label detected 
 /dev/hdb: lvm2 label detected 
 Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720 
 One or more specified logical volume(s) not found. 
 Unlocking /var/lock/lvm/V_VolGroup00 
 Closed /dev/sda 
 Closed /dev/hda1 
 Closed /dev/hda2 
 Closed /dev/hda3 
 Closed /dev/hda5 
 Closed /dev/hdb 
   
 Once again, thank you, Peter.  I appreciate your time and attention on this matter.  Even though you were not certain of how to approach this, you did help me to resolve the problem.  Of course, the most significant factor was the adjustment of my attitude when I decided that all the data was probably lost.  I became less cautious, then.  :-)

I was right all along...the data was there.  Your assessment that we were saved by not having extended the volume is likely correct, too.  Good thing we didn't know what we were doing!  So when I started experimenting with the archive files associated with LVM, I stumbled on success.  Nix recently suggested "vgcfgrestore" as others had suggested to me; however, I had to use trial & error with the -t (test) parameter in order to figure this out.  By that I mean reading the LVM HowTo and various man pages did not clarify much for me.  So here are the steps that I took:
--------------------------------------------------------
[root@mythserver lvm]# vgcfgrestore -tf /etc/lvm/archive/VolGroup00_00000.vg
  Test mode: Metadata will NOT be updated.
  Please specify a *single* volume group to restore.
[root@mythserver lvm]# vgcfgrestore -tf /etc/lvm/archive/VolGroup00_00000.vg Vol
Group00
  Test mode: Metadata will NOT be updated.
  Restored volume group VolGroup00
[root@mythserver lvm]# vgcfgrestore -tvf /etc/lvm/archive/VolGroup00_00000.vg Vo
lGroup00
  Test mode: Metadata will NOT be updated.
  Restored volume group VolGroup00
    Test mode: Wiping internal cache
    Wiping internal VG cache
[root@mythserver lvm]# vgcfgrestore -tvvf /etc/lvm/archive/VolGroup00_00000.vg V
olGroup00
  Test mode: Metadata will NOT be updated.
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      Locking /var/lock/lvm/V_VolGroup00 W 
      /dev/hda1: No label detected
      /dev/hda2: No label detected
      /dev/hda3: No label detected
      /dev/hda5: lvm2 label detected
      /dev/hdb: lvm2 label detected
      /dev/hda5: lvm2 label detected
      /dev/hdb: lvm2 label detected
  Restored volume group VolGroup00
      Unlocking /var/lock/lvm/V_VolGroup00
      Unlocking /var/lock/lvm/P_orphans
    Test mode: Wiping internal cache
    Wiping internal VG cache
[root@mythserver lvm]# vgcfgrestore -vvf /etc/lvm/archive/VolGroup00_00000.vg Vo
lGroup00
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      Locking /var/lock/lvm/V_VolGroup00 W 
      /dev/hda1: No label detected
      /dev/hda2: No label detected
      /dev/hda3: No label detected
      /dev/hda5: lvm2 label detected
      /dev/hdb: lvm2 label detected
      /dev/hda5: lvm2 label detected
      /dev/hdb: lvm2 label detected
  Restored volume group VolGroup00
      Unlocking /var/lock/lvm/V_VolGroup00
      Unlocking /var/lock/lvm/P_orphans
[root@mythserver lvm]# lvscan
  inactive          '/dev/VolGroup00/LogVol00' [364.21 GB] inherit
[root@mythserver lvm]# lvchange -tv -ay /dev/VolGroup00/LogVol00
  Test mode: Metadata will NOT be updated.
    Using logical volume(s) on command line
    Activating logical volume "LogVol00"
    Found volume group "VolGroup00"
    Test mode: Wiping internal cache
    Wiping internal VG cache
[root@mythserver lvm]# lvchange -v -ay /dev/VolGroup00/LogVol00
    Using logical volume(s) on command line
    Activating logical volume "LogVol00"
    Found volume group "VolGroup00"
    Loading VolGroup00-LogVol00
[root@mythserver lvm]# mount -a
------------------------------------------------------------------------
That did it!  We were able to copy our data off the volume and recover the whole system.  I hope this helps someone else down the road.

-Tom-


 		
---------------------------------
Get your email and more, right on the  new Yahoo.com 
--0-1239899857-1158001526=:27730
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<br><br><b><i>Peter Smith &lt;peter.smith@utsouthwestern.edu&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;">      <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type"><title></title>     Ok.&nbsp; It sounds like the fix will have to involve finding a way to get back to your installed-configuration.&nbsp; The one that defines your VG as containing *only* hda5 and hdb.&nbsp; It sounds like you succeeded extending the LV to include sda, but forgot to expand the filesystem after that.&nbsp; Which, ultimately, may save you.&nbsp; I don't have enough experience with LVM (or just LVM2) to be able to tell you either how to edit your current mangled config to force your LV to forget about sda (which it sounds like you were successful accomplishing anyways) *or* to recover the before-sda configuration.&nbsp; I've looked at the config on my own workstation and even though I'm using
 LVM2 I don't see any evidence of backed-up or historical LVM2 configuration data.&nbsp; So I *really* don't know what to tell you there.&nbsp; But I think it should be do-able.&nbsp; There may be someone out there capable of helping with this, but I'm afraid it likely isn't me.&nbsp; Although I might try and reproduce this on one of my Fedora machines to see if I get stuck in the same box which you are in.<br> <br> Peter<br> <br> Tom+Dale wrote: <blockquote cite="mid20060904040917.25836.qmail@web30308.mail.mud.yahoo.com" type="cite"><span style="color: black; font-family: Verdana;">I had a bad drive in my volume group, so I tried "vgreduce --removemissing VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial VolGroup00" which also appeared to complete successfully.<span style="">&nbsp;   </span>It seems like I was partly successful but I cannot get the logical volume to be recognized.<span style="">&nbsp; </span>I don't know what else to do?&nbsp; Where
 can I learn more about LVM?&nbsp; How does one utilize the LVM archive or backup files?&nbsp; Can't seem to find an answer to this problem.&nbsp; Is all of my data lost?<br>   <br>   </span><span style="color: black; font-family: Verdana;">[root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00 <br> Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 <br> O_DIRECT will be used <br> Setting global/locking_type to 1 <br> Setting global/locking_dir to /var/lock/lvm <br> File-based locking enabled. <br> Using logical volume(s) on command line <br> Locking /var/lock/lvm/V_VolGroup00 WB <br> Opened /dev/sda RW <br> /dev/sda: block size is 4096 bytes <br> /dev/sda: No label detected <br> Opened /dev/hda1 RW <br> /dev/hda1: block size is 1024 bytes <br> /dev/hda1: No label detected <br> Opened /dev/hda2 RW <br> /dev/hda2: block size is 4096 bytes <br> /dev/hda2: No label detected <br> Opened /dev/hda3 RW <br> /dev/hda3: block size is 4096 bytes <br> /dev/hda3: No label
 detected <br> Opened /dev/hda5 RW <br> /dev/hda5: block size is 512 bytes <br> /dev/hda5: lvm2 label detected <br> lvmcache: /dev/hda5 now orphaned <br> lvmcache: /dev/hda5 now in VG VolGroup00 <br> Opened /dev/hdb RW <br> /dev/hdb: block size is 4096 bytes <br> /dev/hdb: lvm2 label detected <br> lvmcache: /dev/hdb now orphaned <br> lvmcache: /dev/hdb now in VG VolGroup00 <br> /dev/hda5: lvm2 label detected <br> /dev/hdb: lvm2 label detected <br> /dev/hda5: lvm2 label detected <br> /dev/hdb: lvm2 label detected <br> Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720 <br> /dev/hda5: lvm2 label detected <br> /dev/hdb: lvm2 label detected <br> Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720 <br> One or more specified logical volume(s) not found. <br> Unlocking /var/lock/lvm/V_VolGroup00 <br> Closed /dev/sda <br> Closed /dev/hda1 <br> Closed /dev/hda2 <br> Closed /dev/hda3 <br> Closed /dev/hda5 <br> Closed /dev/hdb <br>   </span><br>
 </blockquote></blockquote>Once again, thank you, Peter.&nbsp; I appreciate your time and attention on this matter.&nbsp; Even though you were not certain of how to approach this, you did help me to resolve the problem.&nbsp; Of course, the most significant factor was the adjustment of my attitude when I decided that all the data was probably lost.&nbsp; I became less cautious, then.&nbsp; :-)<br><br>I was right all along...the data was there.&nbsp; Your assessment that we were saved by not having extended the volume is likely correct, too.&nbsp; Good thing we didn't know what we were doing!&nbsp; So when I started experimenting with the archive files associated with LVM, I stumbled on success.&nbsp; Nix recently suggested "vgcfgrestore" as others had suggested to me; however, I had to use trial &amp; error with the -t (test) parameter in order to figure this out.&nbsp; By that I mean reading the LVM HowTo and various man pages did not clarify much for me.&nbsp; So here are
 the steps that I took:<br>--------------------------------------------------------<br>[root@mythserver lvm]# vgcfgrestore -tf /etc/lvm/archive/VolGroup00_00000.vg<br>&nbsp; Test mode: Metadata will NOT be updated.<br>&nbsp; Please specify a *single* volume group to restore.<br>[root@mythserver lvm]# vgcfgrestore -tf /etc/lvm/archive/VolGroup00_00000.vg Vol<br>Group00<br>&nbsp; Test mode: Metadata will NOT be updated.<br>&nbsp; Restored volume group VolGroup00<br>[root@mythserver lvm]# vgcfgrestore -tvf /etc/lvm/archive/VolGroup00_00000.vg Vo<br>lGroup00<br>&nbsp; Test mode: Metadata will NOT be updated.<br>&nbsp; Restored volume group VolGroup00<br>&nbsp;&nbsp;&nbsp; Test mode: Wiping internal cache<br>&nbsp;&nbsp;&nbsp; Wiping internal VG cache<br>[root@mythserver lvm]# vgcfgrestore -tvvf /etc/lvm/archive/VolGroup00_00000.vg V<br>olGroup00<br>&nbsp; Test mode: Metadata will NOT be updated.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_type to
 1<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_dir to /var/lock/lvm<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File-based locking enabled.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/P_orphans WB<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/V_VolGroup00 W <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda1: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda2: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda3: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda5: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda5: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb: lvm2 label detected<br>&nbsp; Restored volume group VolGroup00<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking /var/lock/lvm/V_VolGroup00<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking /var/lock/lvm/P_orphans<br>&nbsp;&nbsp;&nbsp; Test mode: Wiping internal
 cache<br>&nbsp;&nbsp;&nbsp; Wiping internal VG cache<br>[root@mythserver lvm]# vgcfgrestore -vvf /etc/lvm/archive/VolGroup00_00000.vg Vo<br>lGroup00<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_type to 1<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_dir to /var/lock/lvm<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File-based locking enabled.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/P_orphans WB<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/V_VolGroup00 W <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda1: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda2: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda3: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda5: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda5: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb: lvm2 label detected<br>&nbsp; Restored volume group
 VolGroup00<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking /var/lock/lvm/V_VolGroup00<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking /var/lock/lvm/P_orphans<br>[root@mythserver lvm]# lvscan<br>&nbsp; inactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/VolGroup00/LogVol00' [364.21 GB] inherit<br>[root@mythserver lvm]# lvchange -tv -ay /dev/VolGroup00/LogVol00<br>&nbsp; Test mode: Metadata will NOT be updated.<br>&nbsp;&nbsp;&nbsp; Using logical volume(s) on command line<br>&nbsp;&nbsp;&nbsp; Activating logical volume "LogVol00"<br>&nbsp;&nbsp;&nbsp; Found volume group "VolGroup00"<br>&nbsp;&nbsp;&nbsp; Test mode: Wiping internal cache<br>&nbsp;&nbsp;&nbsp; Wiping internal VG cache<br>[root@mythserver lvm]# lvchange -v -ay /dev/VolGroup00/LogVol00<br>&nbsp;&nbsp;&nbsp; Using logical volume(s) on command line<br>&nbsp;&nbsp;&nbsp; Activating logical volume "LogVol00"<br>&nbsp;&nbsp;&nbsp; Found volume group "VolGroup00"<br>&nbsp;&nbsp;&nbsp; Loading
 VolGroup00-LogVol00<br>[root@mythserver lvm]# mount -a<br>------------------------------------------------------------------------<br>That did it!&nbsp; We were able to copy our data off the volume and recover the whole system.&nbsp; I hope this helps someone else down the road.<br><br>-Tom-<br><br><p>&#32;
		<hr size=1>Get your email and more, right on the <a href="http://us.rd.yahoo.com/evt=42973/*http://www.yahoo.com/preview"> new Yahoo.com</a> 

--0-1239899857-1158001526=:27730--
