Message-ID: <2D4B6CD74137D4119A1100104BC6BCBF0BC585C6@dubntex006.qwest.net>
From: "Montgomery, Kendal L" <kendal.montgomery@qwest.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C381FE.6C1BBFA0"
Subject: [linux-lvm] lvm on loopback mount problems
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Sep 23 17:10:02 2003
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C381FE.6C1BBFA0
Content-Type: text/plain

I've seen a few things about using lvm on a loopback filesystem, but nothing
concrete, so I tried it myself.  Most everything works okay until I get to
acutally mounting the filesystem.  Here are the steps I did:

[root@klmontg tmp]# dd if=/dev/zero of=fake_disk.img bs=1M count=500
500+0 records in
500+0 records out
[root@klmontg tmp]# losetup /dev/loop0 fake_disk.img
[root@klmontg tmp]# pvcreate /dev/loop0
pvcreate -- physical volume "/dev/loop0" successfully created

[root@klmontg tmp]# vgcreate /dev/vgtest /dev/loop0
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vgtest"
vgcreate -- volume group "vgtest" successfully created and activated
 
[root@klmontg tmp]# lvcreate --name lv_one --size 200M /dev/vgtest
lvcreate -- doing automatic backup of "vgtest"
lvcreate -- logical volume "/dev/vgtest/lv_one" successfully created
 
[root@klmontg tmp]# mke2fs /dev/vgtest/lv_one
mke2fs 1.32 (09-Nov-2002)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
51200 inodes, 204800 blocks
10240 blocks (5.00%) reserved for the super user
First data block=1
25 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729
 
Writing inode tables: done
Writing superblocks and filesystem accounting information: done
 
This filesystem will be automatically checked every 26 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
[root@klmontg tmp]# e2fsck /dev/vgtest/lv_one
e2fsck 1.32 (09-Nov-2002)
Couldn't find ext2 superblock, trying backup blocks...
e2fsck: Bad magic number in super-block while trying to open
/dev/vgtest/lv_one
 
The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 
[root@klmontg tmp]# e2fsck -b 8193 /dev/vgtest/lv_one
e2fsck 1.32 (09-Nov-2002)
e2fsck: Bad magic number in super-block while trying to open
/dev/vgtest/lv_one
 
The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 
[root@klmontg tmp]# mount /dev/vgtest/lv_one /mnt
mount: you must specify the filesystem type
[root@klmontg tmp]# mount -t ext2 /dev/vgtest/lv_one /mnt
mount: wrong fs type, bad option, bad superblock on /dev/vgtest/lv_one,
       or too many mounted file systems

As you can see, one the filesystem was made, nothing else works. I can't
fsck the filesystem on the new logical volume, or mount it.  This is
obviously a problem since, well, it's useless unless I can mount it.

I'm using RedHat 9 with the  2.4.20-20.9 kernel.  I've also tried this on
RedHat 8 on another box.  I got the latest version of util-linux which is
2.11z and compiled that (in case it was a possible bug in mount 2.11y which
comes with redhat).  I'm using lvm 1.0.3-12 that comes with redhat 9.  I
have not tried getting the latest lvm tools.  That's my next step...

Anyone else had this problem, or tried doing this?  The reason I wanted to
do this in the first place is so I can test snapshots.  I want to be able to
have a filesystem which is static, that I will then take a snapshot of, then
change things on it, and then use the snapshot to bring it back to it's
original form.  I know there is some work on union filesystems or
translucent filesystems, and such things, but none of it seems mature
enough, so this solution seemed like it might work until I hit this snag.

Is anyone else doing this (lvm on loopback)?  Does anyone have it working
correctly?  Am I doing something wrong?  Do I need a different version of
something?

Thanks in advance for any help.

Kendal.

------_=_NextPart_001_01C381FE.6C1BBFA0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>lvm on loopback mount problems</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">I've seen a few things about using lvm =
on a loopback filesystem, but nothing concrete, so I tried it =
myself.&nbsp; Most everything works okay until I get to acutally =
mounting the filesystem.&nbsp; Here are the steps I did:</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# dd =
if=3D/dev/zero of=3Dfake_disk.img bs=3D1M count=3D500</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">500+0 records in</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">500+0 records out</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# losetup =
/dev/loop0 fake_disk.img</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# pvcreate =
/dev/loop0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">pvcreate -- physical volume =
&quot;/dev/loop0&quot; successfully created</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# vgcreate =
/dev/vgtest /dev/loop0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgcreate -- INFO: using default =
physical extent size 4 MB</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgcreate -- INFO: maximum =
logical volume size is 255.99 Gigabyte</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgcreate -- doing automatic =
backup of volume group &quot;vgtest&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgcreate -- volume group =
&quot;vgtest&quot; successfully created and activated</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# lvcreate =
--name lv_one --size 200M /dev/vgtest</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">lvcreate -- doing automatic =
backup of &quot;vgtest&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">lvcreate -- logical volume =
&quot;/dev/vgtest/lv_one&quot; successfully created</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# mke2fs =
/dev/vgtest/lv_one</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">mke2fs 1.32 =
(09-Nov-2002)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Filesystem label=3D</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">OS type: Linux</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Block size=3D1024 =
(log=3D0)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Fragment size=3D1024 =
(log=3D0)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">51200 inodes, 204800 =
blocks</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">10240 blocks (5.00%) reserved =
for the super user</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">First data block=3D1</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">25 block groups</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">8192 blocks per group, 8192 =
fragments per group</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">2048 inodes per group</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Superblock backups stored on =
blocks:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8193, 24577, 40961, =
57345, 73729</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Writing inode tables: =
done</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Writing superblocks and =
filesystem accounting information: done</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">This filesystem will be =
automatically checked every 26 mounts or</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">180 days, whichever comes =
first.&nbsp; Use tune2fs -c or -i to override.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# e2fsck =
/dev/vgtest/lv_one</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">e2fsck 1.32 =
(09-Nov-2002)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Couldn't find ext2 superblock, =
trying backup blocks...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">e2fsck: Bad magic number in =
super-block while trying to open /dev/vgtest/lv_one</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">The superblock could not be =
read or does not describe a correct ext2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">filesystem.&nbsp; If the device =
is valid and it really contains an ext2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">filesystem (and not swap or ufs =
or something else), then the superblock</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">is corrupt, and you might try =
running e2fsck with an alternate superblock:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;&nbsp;&nbsp; e2fsck -b =
8193 &lt;device&gt;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# e2fsck -b =
8193 /dev/vgtest/lv_one</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">e2fsck 1.32 =
(09-Nov-2002)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">e2fsck: Bad magic number in =
super-block while trying to open /dev/vgtest/lv_one</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">The superblock could not be =
read or does not describe a correct ext2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">filesystem.&nbsp; If the device =
is valid and it really contains an ext2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">filesystem (and not swap or ufs =
or something else), then the superblock</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">is corrupt, and you might try =
running e2fsck with an alternate superblock:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;&nbsp;&nbsp; e2fsck -b =
8193 &lt;device&gt;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# mount =
/dev/vgtest/lv_one /mnt</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">mount: you must specify the =
filesystem type</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">[root@klmontg tmp]# mount -t =
ext2 /dev/vgtest/lv_one /mnt</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">mount: wrong fs type, bad =
option, bad superblock on /dev/vgtest/lv_one,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or too many mounted file =
systems</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">As you can see, one the filesystem was =
made, nothing else works. I can't fsck the filesystem on the new =
logical volume, or mount it.&nbsp; This is obviously a problem since, =
well, it's useless unless I can mount it.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I'm using RedHat 9 with the&nbsp; =
2.4.20-20.9 kernel.&nbsp; I've also tried this on RedHat 8 on another =
box.&nbsp; I got the latest version of util-linux which is 2.11z and =
compiled that (in case it was a possible bug in mount 2.11y which comes =
with redhat).&nbsp; I'm using lvm 1.0.3-12 that comes with redhat =
9.&nbsp; I have not tried getting the latest lvm tools.&nbsp; That's my =
next step...</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Anyone else had this problem, or tried =
doing this?&nbsp; The reason I wanted to do this in the first place is =
so I can test snapshots.&nbsp; I want to be able to have a filesystem =
which is static, that I will then take a snapshot of, then change =
things on it, and then use the snapshot to bring it back to it's =
original form.&nbsp; I know there is some work on union filesystems or =
translucent filesystems, and such things, but none of it seems mature =
enough, so this solution seemed like it might work until I hit this =
snag.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is anyone else doing this (lvm on =
loopback)?&nbsp; Does anyone have it working correctly?&nbsp; Am I =
doing something wrong?&nbsp; Do I need a different version of =
something?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in advance for any help.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Kendal.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C381FE.6C1BBFA0--
