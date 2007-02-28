Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1SGAdYo009237
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 11:10:39 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.238])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1SGAbk0005134
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 11:10:37 -0500
Received: by nz-out-0506.google.com with SMTP id s18so199209nze
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 08:10:36 -0800 (PST)
Message-ID: <5d25729a0702280810s256fc262s75a2c9557a6b391b@mail.gmail.com>
Date: Wed, 28 Feb 2007 11:10:32 -0500
From: "Nick Gyma" <nickgyma@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_40481_11627471.1172679032154"
Subject: [linux-lvm] Help: Mount point does not report full size of LV.
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

------=_Part_40481_11627471.1172679032154
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey all, linux n00b here runing ubuntu:

I added a 3rd hdd to my system today and tried to extend the logical volume
i currently had with the new added space. it was previously a windows NTFS
disk (formatted clean before transfer). after going through the steps it all
displays properly under "vgdisplay -v" but when i actually go and check the
mount point folder size it is still the same as before and has not increased
along w/ the volume group and logical volume.

I've tried to remove the hdd from the VG to try and redo it but i get errors
when trying to use "vgreduce" to remove the PV, saying "physical volume
"dev/hdd1" still in use", even after running a "pvmove" command which
resulted in "no extents avail for allocation".

Here's what I did wrong in setting it up, even though it displays correct:

I first ran fdisk on /dev/hdd1, the partition, instead of the whole disk
/dev/hdd (first mistake). I created a partition, sized it to take the full
space, changed it to 8e, which gave me /dev/hdd1p1. which i really didn't
want, but it happened anyway.

I then did a pvcreate /dev/hdd1, not hdd1p1, then did "vgextend VGforMyth
/dev/hdd1" then did "lvextend --size +79.3G /dev/VGforMyth/video"

Somewhere along the way i realized what i was doing wrong and went back and
fdisk'ed /dev/hdd to remove the two partitions (hdd1, hdd1p1) and create a
new correct partition /dev/hdd1 set to 8e and extending the entire disk.
Now, /dev/hdd1 was still part of the VG while "fixing" the issue. I'm
guessing doing all that screwed it up somewhere along the way.

Is there a way to fix the LV as it is so that the mount point
/home/nick/video is correct? or should i wipe it all out and start over? if
so, how do i go about doing that? do i delete all data on the LV then do a
vgremove then fdisk everything, deleting all partitions and start over?

Thanks in advance for your help!
-Nick

------=_Part_40481_11627471.1172679032154
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hey all, linux n00b here runing ubuntu:</div>
<div><br>I added a 3rd hdd to my system today and tried to extend the logical volume i currently had with the new added space. it was previously a windows NTFS disk (formatted clean before transfer). after going through the steps it all displays properly under &quot;vgdisplay -v&quot; but when i actually go and check the mount point folder size it is still the same as before and has not increased along w/ the volume group and logical volume. 
<br><br>I&#39;ve tried to remove the hdd from the VG to try and redo it but i get errors when trying to use &quot;vgreduce&quot; to remove the PV, saying &quot;physical volume &quot;dev/hdd1&quot; still in use&quot;, even after running a &quot;pvmove&quot; command which resulted in &quot;no extents avail for allocation&quot;. 
<br><br>Here&#39;s what&nbsp;I did wrong in setting it up, even though it displays correct:</div>
<div><br>I&nbsp;first ran fdisk on /dev/hdd1, the partition, instead of the whole disk /dev/hdd (first mistake).&nbsp;I created a partition, sized it to take the full space, changed it to 8e, which gave me /dev/hdd1p1. which i really didn&#39;t want, but it happened anyway.
<br><br>I&nbsp;then did a pvcreate /dev/hdd1, not hdd1p1, then did &quot;vgextend VGforMyth /dev/hdd1&quot; then did &quot;lvextend --size +79.3G /dev/VGforMyth/video&quot; <br><br>Somewhere along the way i realized what i was doing wrong and went back and fdisk&#39;ed /dev/hdd to remove the two partitions (hdd1, hdd1p1)&nbsp;and create a new correct partition /dev/hdd1 set to 8e and extending the entire disk. Now, /dev/hdd1 was still part of the VG while &quot;fixing&quot; the issue. I&#39;m guessing&nbsp;doing all that&nbsp;screwed it up somewhere along the way.&nbsp; &nbsp;
<br><br>Is there a way to fix the LV as it is so that the mount point /home/nick/video is correct? or should i wipe it all out and start over? if so, how do i go about doing that? do i delete all data on the LV then do a vgremove then fdisk everything, deleting all partitions and start over?
</div>
<div>&nbsp;</div>
<div>Thanks in advance for your help!&nbsp;</div>
<div>-Nick</div>

------=_Part_40481_11627471.1172679032154--
