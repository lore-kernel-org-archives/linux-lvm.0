Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87HJAp7017615
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 13:19:10 -0400
Received: from swlx167.swmed.edu (swlx167.swmed.edu [199.165.152.167])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87HJ7Eb022599
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 13:19:07 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx167.swmed.edu with esmtp (Exim 4.44) id 1GLNWh-0004cL-EH
	for linux-lvm@redhat.com; Thu, 07 Sep 2006 12:18:56 -0500
Message-ID: <4500547F.6050503@utsouthwestern.edu>
Date: Thu, 07 Sep 2006 12:18:55 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
In-Reply-To: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
Content-Type: multipart/alternative;
	boundary="------------030900030200060308000400"
Subject: Re: [linux-lvm] Wrecked Logical Volume with vgreduce --removemissing
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

This is a multi-part message in MIME format.
--------------030900030200060308000400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok.  It sounds like the fix will have to involve finding a way to get 
back to your installed-configuration.  The one that defines your VG as 
containing *only* hda5 and hdb.  It sounds like you succeeded extending 
the LV to include sda, but forgot to expand the filesystem after that.  
Which, ultimately, may save you.  I don't have enough experience with 
LVM (or just LVM2) to be able to tell you either how to edit your 
current mangled config to force your LV to forget about sda (which it 
sounds like you were successful accomplishing anyways) *or* to recover 
the before-sda configuration.  I've looked at the config on my own 
workstation and even though I'm using LVM2 I don't see any evidence of 
backed-up or historical LVM2 configuration data.  So I *really* don't 
know what to tell you there.  But I think it should be do-able.  There 
may be someone out there capable of helping with this, but I'm afraid it 
likely isn't me.  Although I might try and reproduce this on one of my 
Fedora machines to see if I get stuck in the same box which you are in.

Peter

Tom+Dale wrote:

> I had a bad drive in my volume group, so I tried "vgreduce 
> --removemissing VolGroup00" which seemed to work. Then, I tried 
> "vgchange -ay --partial VolGroup00" which also appeared to complete 
> successfully.  It seems like I was partly successful but I cannot get 
> the logical volume to be recognized.  I don't know what else to do?  
> Where can I learn more about LVM?  How does one utilize the LVM 
> archive or backup files?  Can't seem to find an answer to this 
> problem.  Is all of my data lost?
>
> [root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00
> Processing: lvchange -vvvay /dev/VolGroup00/LogVol00
> O_DIRECT will be used
> Setting global/locking_type to 1
> Setting global/locking_dir to /var/lock/lvm
> File-based locking enabled.
> Using logical volume(s) on command line
> Locking /var/lock/lvm/V_VolGroup00 WB
> Opened /dev/sda RW
> /dev/sda: block size is 4096 bytes
> /dev/sda: No label detected
> Opened /dev/hda1 RW
> /dev/hda1: block size is 1024 bytes
> /dev/hda1: No label detected
> Opened /dev/hda2 RW
> /dev/hda2: block size is 4096 bytes
> /dev/hda2: No label detected
> Opened /dev/hda3 RW
> /dev/hda3: block size is 4096 bytes
> /dev/hda3: No label detected
> Opened /dev/hda5 RW
> /dev/hda5: block size is 512 bytes
> /dev/hda5: lvm2 label detected
> lvmcache: /dev/hda5 now orphaned
> lvmcache: /dev/hda5 now in VG VolGroup00
> Opened /dev/hdb RW
> /dev/hdb: block size is 4096 bytes
> /dev/hdb: lvm2 label detected
> lvmcache: /dev/hdb now orphaned
> lvmcache: /dev/hdb now in VG VolGroup00
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720
> One or more specified logical volume(s) not found.
> Unlocking /var/lock/lvm/V_VolGroup00
> Closed /dev/sda
> Closed /dev/hda1
> Closed /dev/hda2
> Closed /dev/hda3
> Closed /dev/hda5
> Closed /dev/hdb
>

--------------030900030200060308000400
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Ok.&nbsp; It sounds like the fix will have to involve finding a way to get
back to your installed-configuration.&nbsp; The one that defines your VG as
containing *only* hda5 and hdb.&nbsp; It sounds like you succeeded extending
the LV to include sda, but forgot to expand the filesystem after that.&nbsp;
Which, ultimately, may save you.&nbsp; I don't have enough experience with
LVM (or just LVM2) to be able to tell you either how to edit your
current mangled config to force your LV to forget about sda (which it
sounds like you were successful accomplishing anyways) *or* to recover
the before-sda configuration.&nbsp; I've looked at the config on my own
workstation and even though I'm using LVM2 I don't see any evidence of
backed-up or historical LVM2 configuration data.&nbsp; So I *really* don't
know what to tell you there.&nbsp; But I think it should be do-able.&nbsp; There
may be someone out there capable of helping with this, but I'm afraid
it likely isn't me.&nbsp; Although I might try and reproduce this on one of
my Fedora machines to see if I get stuck in the same box which you are
in.<br>
<br>
Peter<br>
<br>
Tom+Dale wrote:
<blockquote
 cite="mid20060904040917.25836.qmail@web30308.mail.mud.yahoo.com"
 type="cite"><span style="color: black; font-family: Verdana;">I had a
bad drive in my volume group, so I tried "vgreduce --removemissing
VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial
VolGroup00" which also appeared to complete successfully.<span style="">&nbsp;
  </span>It seems like I was partly successful but I cannot get the
logical volume to be recognized.<span style="">&nbsp; </span>I don't know
what else to do?&nbsp; Where can I learn more about LVM?&nbsp; How does one
utilize the LVM archive or backup files?&nbsp; Can't seem to find an answer
to this problem.&nbsp; Is all of my data lost?<br>
  <br>
  </span><span style="color: black; font-family: Verdana;">[root[at]server
~]# lvchange -vvvay /dev/VolGroup00/LogVol00 <br>
Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 <br>
O_DIRECT will be used <br>
Setting global/locking_type to 1 <br>
Setting global/locking_dir to /var/lock/lvm <br>
File-based locking enabled. <br>
Using logical volume(s) on command line <br>
Locking /var/lock/lvm/V_VolGroup00 WB <br>
Opened /dev/sda RW <br>
/dev/sda: block size is 4096 bytes <br>
/dev/sda: No label detected <br>
Opened /dev/hda1 RW <br>
/dev/hda1: block size is 1024 bytes <br>
/dev/hda1: No label detected <br>
Opened /dev/hda2 RW <br>
/dev/hda2: block size is 4096 bytes <br>
/dev/hda2: No label detected <br>
Opened /dev/hda3 RW <br>
/dev/hda3: block size is 4096 bytes <br>
/dev/hda3: No label detected <br>
Opened /dev/hda5 RW <br>
/dev/hda5: block size is 512 bytes <br>
/dev/hda5: lvm2 label detected <br>
lvmcache: /dev/hda5 now orphaned <br>
lvmcache: /dev/hda5 now in VG VolGroup00 <br>
Opened /dev/hdb RW <br>
/dev/hdb: block size is 4096 bytes <br>
/dev/hdb: lvm2 label detected <br>
lvmcache: /dev/hdb now orphaned <br>
lvmcache: /dev/hdb now in VG VolGroup00 <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720 <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720 <br>
One or more specified logical volume(s) not found. <br>
Unlocking /var/lock/lvm/V_VolGroup00 <br>
Closed /dev/sda <br>
Closed /dev/hda1 <br>
Closed /dev/hda2 <br>
Closed /dev/hda3 <br>
Closed /dev/hda5 <br>
Closed /dev/hdb <br>
  </span><br>
</blockquote>
</body>
</html>

--------------030900030200060308000400--
