Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n98IgvbB008991
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 14:42:57 -0400
Received: from mail-pz0-f187.google.com (mail-pz0-f187.google.com
	[209.85.222.187])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n98IgiZI029846
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 14:42:44 -0400
Received: by pzk17 with SMTP id 17so144938pzk.6
	for <linux-lvm@redhat.com>; Thu, 08 Oct 2009 11:42:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 8 Oct 2009 11:42:43 -0700
Message-ID: <99f624940910081142q8e3388br8fb2fdd61e0874fe@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=00504502b18f368600047570d41b
Subject: [linux-lvm] Corrupted LV after resize2fs crashed when adding new
	disk to LV
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

--00504502b18f368600047570d41b
Content-Type: text/plain; charset=ISO-8859-1

I've written several extensive posts about this problem to the fedora forum
(software) with no real results -and FWIW, I am getting very desparate. I
was referred here, or possibly post bug report.

The thread at Fedora Forums is >>click
here<<<http://forums.fedoraforum.org/showthread.php?t=231481>
.

Basically, this is the problem:

I have an ext4 filesystem in VolGroup3W-LogVol3W. Originally, it was 331G,
and was working fine. e2fsck ran through without finding any problems.

Then I tried to add another disk (111G) to the LV. I created the PV
(pvcreate), added it to the VG (vgextend). All this was okay. I then added
this to the LV (lvextend) and then tried to resize the filesystem
(resize2fs).

The last command - resize2fs - crashed before completing.

After that:

- vgdisplay showed a total 442G for VolGroup3W (the original size plus the
new PV) - that's okay
- lvs showed a total of 331G for LogVol3W (the original size, without the
new PV)
- mount failed, with "EXT4-fs: bad geometry: block count 102432768 exceeds
size of device (86773760 blocks)" in dmesg
- e2fsck for the LV reports basically the same thing.

I removed the new diisk from the VG. I couldn't do lvreduce, since the LV
didn't see the new PV space.

When I run e2fsck and answer 'n' to abort, I get 2648 Group checksum errors,
and after answering 'y' to fix them, I get this:

"/dev/VolGroup3W/LogVol3W contains a file system with errors, check forced.
Pass 1: Checking inodes, blocks, and sizes
Error reading block 86802432 (Invalid argument) while getting next inode
from scan.  Ignore error? no

Error while scanning inodes (21700608): Can't read next
inode
e2fsck: aborted"

FWIW, I did try running e2fsck with other superblocks, with this result:

"[root@Elmer ~]# e2fsck -b 32768 /dev/VolGroup3W/LogVol3W
e2fsck 1.41.4 (27-Jan-2009)
/dev/VolGroup3W/LogVol3W: recovering journal
e2fsck: unable to set superblock flags on /dev/VolGroup3W/LogVol3W"


So it seems to me, IMHO, that the LVM is looking at one set of data, while
the other utilities (eg, mount, e2fsck) are looking at another. I am
assuming that the original LV data is still intact, just somewhere the file
size/block count is wrong.(one place says the original size, the other sees
the size with the new disk (attempted to be) added.

Is there ANY way possible to rectify this? PLEASE!!!

As I said, I am rather desparate to recover the data on the original LV
(yes, I do know the value of backing up data :-( ). So any ideas will be
greatly appreciated.

ken

--00504502b18f368600047570d41b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;ve written several extensive posts about this problem to the fedora f=
orum (software) with no real results -and FWIW, I am getting very desparate=
. I was referred here, or possibly post bug report.<br><br>The thread at Fe=
dora Forums is <a href=3D"http://forums.fedoraforum.org/showthread.php?t=3D=
231481">&gt;&gt;click here&lt;&lt;</a>.<br>
<br>Basically, this is the problem:<br><br>I have an ext4 filesystem in Vol=
Group3W-LogVol3W. Originally, it was 331G, and was working fine. e2fsck ran=
 through without finding any problems.<br><br>Then I tried to add another d=
isk (111G) to the LV. I created the PV (pvcreate), added it to the VG (vgex=
tend). All this was okay. I then added this to the LV (lvextend) and then t=
ried to resize the filesystem (resize2fs).<br>
<br>The last command - resize2fs - crashed before completing.<br><br>After =
that:<br><br>- vgdisplay showed a total 442G for VolGroup3W (the original s=
ize plus the new PV) - that&#39;s okay<br>- lvs showed a total of 331G for =
LogVol3W (the original size, without the new PV) <br>
- mount failed, with &quot;EXT4-fs: bad geometry: block count 102432768 exc=
eeds size of device (86773760 blocks)&quot; in dmesg<br>- e2fsck for the LV=
 reports basically the same thing.<br><br>I removed the new diisk from the =
VG. I couldn&#39;t do lvreduce, since the LV didn&#39;t see the new PV spac=
e.<br>
<br>When I run e2fsck and answer &#39;n&#39; to abort, I get 2648 Group che=
cksum errors, and after answering &#39;y&#39; to fix them, I get this:<br><=
br>&quot;/dev/VolGroup3W/LogVol3W contains a file system with errors, check=
 forced.<br>
Pass 1: Checking inodes, blocks, and sizes<br>Error reading block 86802432 =
(Invalid argument) while getting next inode from scan.=A0 Ignore error? no<=
br><br>Error while scanning inodes (21700608): Can&#39;t read next inode=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <br>
e2fsck: aborted&quot;<br><br>FWIW, I did try running e2fsck with other supe=
rblocks, with this result:<br><br>&quot;[root@Elmer ~]# e2fsck -b 32768 /de=
v/VolGroup3W/LogVol3W <br>e2fsck 1.41.4 (27-Jan-2009)<br>/dev/VolGroup3W/Lo=
gVol3W: recovering journal<br>
e2fsck: unable to set superblock flags on /dev/VolGroup3W/LogVol3W&quot;<br=
><br><br>So it seems to me, IMHO, that the LVM is looking at one set of dat=
a, while the other utilities (eg, mount, e2fsck) are looking at another. I =
am assuming that the original LV data is still intact, just somewhere the f=
ile size/block count is wrong.(one place says the original size, the other =
sees the size with the new disk (attempted to be) added.<br>
<br>Is there ANY way possible to rectify this? PLEASE!!!<br><br>As I said, =
I am rather desparate to recover the data on the original LV (yes, I do kno=
w the value of backing up data :-( ). So any ideas will be greatly apprecia=
ted.<br>
<br>ken<br><br><br><br><br>
<br>

--00504502b18f368600047570d41b--
