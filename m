Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8C91001E6D
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 20:25:18 +0000 (UTC)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
	[209.85.221.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58111C049E21
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 20:25:18 +0000 (UTC)
Received: by mail-vk1-f199.google.com with SMTP id x200so1080170vkd.0
	for <linux-lvm@redhat.com>; Sat, 02 Mar 2019 12:25:18 -0800 (PST)
MIME-Version: 1.0
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
In-Reply-To: <30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 2 Mar 2019 22:25:04 +0200
Message-ID: <CAMRbyyuVek7CnYhD3S6JcYLTfxP73CScpErCX3D2eapbfJgd4g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004e9a0205832252c9"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ingo Franzki <ifranzki@linux.ibm.com>

--0000000000004e9a0205832252c9
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 2, 2019 at 3:38 AM Cesare Leonardi <celeonar@gmail.com> wrote:

> Hello Ingo, I've made several tests but I was unable to trigger any
> filesystem corruption. Maybe the trouble you encountered are specific to
> encrypted device?
>
> Yesterday and today I've used:
> Debian unstable
> kernel 4.19.20
> lvm2 2.03.02
> e2fsprogs 1.44.5
>
> On 01/03/19 09:05, Ingo Franzki wrote:
> > Hmm, maybe the size of the volume plays a role as Bernd has pointed out.
> ext4 may use -b 4K by default on larger devices.
> > Once the FS uses 4K block anyway you wont see the problem.
> >
> > Use  tune2fs -l <device> after you created the file system and check if
> it is using 4K blocks on your 512/512 device. If so, then you won't see the
> problem when moved to a 4K block size device.
>
> I confirm that tune2fs reports 4096 block size for the 1 GB ext4
> filesystem I've used.
> I've also verified what Bernd said: mkfs.ext4 still use 4096 block size
> for a +512M partition, but use 1024 for +500M.
>
> As suggested by Stuart, I also made a test using a 4k loop device and
> pvmoving the LV into it. As you expected, no data corruption.
> To do it I've recreated the same setup ad yesterday:
> /dev/mapper/vgtest-lvol0 on /dev/sdb4, a 512/512 disk, with some data on
> it. Then:
> # fallocate -l 10G testdisk.img
> # losetup -f -L -P -b 4096 testdisk.img
> # pvcreate /dev/loop0
> # vgextend vgtest /dev/loop0
> # pvmove /dev/sdb4 /dev/loop0
> # fsck.ext4 -f /dev/mapper/vgtest-lvol0
>
> While I was there, out of curiosity, I've created an ext4 filesystem on
> a <500MB LV (block size = 1024) and I've tried pvmoving data from the
> 512/512 disk to 512/4096, then to the 4096/4096 loop device.
> New partitions and a new VG was used for that.
>
> The setup:
> /dev/sdb5: 512/512
> /dev/sdc2: 512/4096
> /dev/loop0 4096/4096
>
> # blockdev -v --getss --getpbsz --getbsz /dev/sdb
> get logical block (sector) size: 512
> get physical block (sector) size: 512
> get blocksize: 4096
>
> # blockdev -v --getss --getpbsz --getbsz /dev/sdc
> get logical block (sector) size: 512
> get physical block (sector) size: 4096
> get blocksize: 4096
>
> # blockdev -v --getss --getpbsz --getbsz /dev/loop0
> get logical block (sector) size: 4096
> get physical block (sector) size: 4096
> get blocksize: 4096
>
> # pvcreate /dev/sdb5
> # vgcreate vgtest2 /dev/sdb5
> # lvcreate -L 400M vgtest2 /dev/sdb5
> # mkfs.ext4 /dev/mapper/vgtest2-lvol0
>
> # tune2fs -l /dev/mapper/vgtest2-lvol0
> [...]
> Block size:               1024
> [...]
>
> # mount /dev/mapper/vgtest2-lvol0 /media/test
> # cp -a SOMEDATA /media/test/
> # umount /media/test
> # fsck.ext4 -f /dev/mapper/vgtest2-lvol0
>
> Now I've moved data from the 512/512 to the 512/4096 disk:
> # pvcreate /dev/sdc2
> # vgextend vgtest2 /dev/sdc2
> # pvmove /dev/sdb5 /dev/sdc2
> # fsck.ext4 -f /dev/mapper/vgtest2-lvol0
>
> No error reported.
>

Did you try to mount the lv after the pvmove?


> Now I've moved data to the 4096/4096 loop device:
> # pvcreate /dev/loop0
> # vgextend vgtest2 /dev/loop0
> # pvmove /dev/sdc2 /dev/loop0
> # fsck.ext4 -f /dev/mapper/vgtest2-lvol0
>
> Still no data corruption.
>

I can reproduce this without moving data, just by extending vg with 4k
device,
and then extending lv to use both devices.

Here is what I tested:

# truncate -s 500m disk1
# truncate -s 500m disk2
# losetup -f disk1 --sector-size 512 --show
/dev/loop2
# losetup -f disk2 --sector-size 4096 --show
/dev/loop3

# pvcreate /dev/loop2
  Physical volume "/dev/loop2" successfully created.
# pvcreate /dev/loop3
  Physical volume "/dev/loop3" successfully created.
# vgcreate test /dev/loop2
  Volume group "test" successfully created
# lvcreate -L400m -n lv1 test
  Logical volume "lv1" created.

# mkfs.xfs /dev/test/lv1
meta-data=/dev/test/lv1          isize=512    agcount=4, agsize=25600 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=0, rmapbt=0,
reflink=0
data     =                       bsize=4096   blocks=102400, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=855, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0

# mkdir /tmp/mnt
# mount /dev/test/lv1 /tmp/mnt
# vgextend test /dev/loop3
  Volume group "test" successfully extended
# lvextend -L+400m test/lv1
  Size of logical volume test/lv1 changed from 400.00 MiB (100 extents) to
800.00 MiB (200 extents).
  Logical volume test/lv1 successfully resized.
# umount /tmp/mnt

# mount /dev/test/lv1 /tmp/mnt
mount: /tmp/mnt: mount(2) system call failed: Function not implemented.

From journalctl:
Mar 02 21:52:53 lean.local kernel: XFS (dm-7): Unmounting Filesystem
Mar 02 21:53:01 lean.local kernel: XFS (dm-7): device supports 4096 byte
sectors (not 512)


I also tried the same with ext4:

(same disks/vg/lv setup as above)

# mkfs.ext4 /dev/test/lv1
mke2fs 1.44.2 (14-May-2018)
Discarding device blocks: done
Creating filesystem with 409600 1k blocks and 102400 inodes
Filesystem UUID: 9283880e-ee89-4d79-9c29-41f4af98f894
Superblock backups stored on blocks:
8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

# vgextend test /dev/loop3
  Volume group "test" successfully extended
# lvextend -L+400 test/lv1
  Size of logical volume test/lv1 changed from 400.00 MiB (100 extents) to
800.00 MiB (200 extents).
  Logical volume test/lv1 successfully resized.

# mount /dev/test/lv1 /tmp/mnt
mount: /tmp/mnt: wrong fs type, bad option, bad superblock on
/dev/mapper/test-lv1, missing codepage or helper program, or other error.

From journalctl:
Mar 02 22:06:09 lean.local kernel: EXT4-fs (dm-7): bad block size 1024


Now same with pvmove:

(same setup as above, using xfs)

# mount /dev/test/lv1 /tmp/mnt
# dd if=/dev/urandom bs=8M count=1 of=/tmp/mnt/data
# vgextend test /dev/loop3
  Physical volume "/dev/loop3" successfully created.
  Volume group "test" successfully extended

# pvmove -v /dev/loop2 /dev/loop3
    Cluster mirror log daemon is not running.
    Wiping internal VG cache
    Wiping cache of LVM-capable devices
    Archiving volume group "test" metadata (seqno 3).
    Creating logical volume pvmove0
    Moving 100 extents of logical volume test/lv1.
    activation/volume_list configuration setting not defined: Checking only
host tags for test/lv1.
    Creating test-pvmove0
    Loading table for test-pvmove0 (253:8).
    Loading table for test-lv1 (253:7).
    Suspending test-lv1 (253:7) with device flush
    Resuming test-pvmove0 (253:8).
    Resuming test-lv1 (253:7).
    Creating volume group backup "/etc/lvm/backup/test" (seqno 4).
    activation/volume_list configuration setting not defined: Checking only
host tags for test/pvmove0.
    Checking progress before waiting every 15 seconds.
  /dev/loop2: Moved: 15.00%
  /dev/loop2: Moved: 100.00%
    Polling finished successfully.
# umount /tmp/mnt
# mount /dev/test/lv1 /tmp/mnt
mount: /tmp/mnt: mount(2) system call failed: Function not implemented.

From journalctl:
Mar 02 22:20:36 lean.local kernel: XFS (dm-7): device supports 4096 byte
sectors (not 512)


Tested on Fedora 28 with:
kernel-4.20.5-100.fc28.x86_64
lvm2-2.02.177-5.fc28.x86_64

Nir

--0000000000004e9a0205832252c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small;co=
lor:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34)">On Sat, Mar 2, 2019 at =
3:38 AM Cesare Leonardi &lt;<a href=3D"mailto:celeonar@gmail.com">celeonar@=
gmail.com</a>&gt; wrote:</span><br></div></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello Ingo, I&#39;ve made =
several tests but I was unable to trigger any <br>
filesystem corruption. Maybe the trouble you encountered are specific to <b=
r>
encrypted device?<br>
<br>
Yesterday and today I&#39;ve used:<br>
Debian unstable<br>
kernel 4.19.20<br>
lvm2 2.03.02<br>
e2fsprogs 1.44.5<br>
<br>
On 01/03/19 09:05, Ingo Franzki wrote:<br>
&gt; Hmm, maybe the size of the volume plays a role as Bernd has pointed ou=
t. ext4 may use -b 4K by default on larger devices.<br>
&gt; Once the FS uses 4K block anyway you wont see the problem.<br>
&gt; <br>
&gt; Use=C2=A0 tune2fs -l &lt;device&gt; after you created the file system =
and check if it is using 4K blocks on your 512/512 device. If so, then you =
won&#39;t see the problem when moved to a 4K block size device.<br>
<br>
I confirm that tune2fs reports 4096 block size for the 1 GB ext4 <br>
filesystem I&#39;ve used.<br>
I&#39;ve also verified what Bernd said: mkfs.ext4 still use 4096 block size=
 <br>
for a +512M partition, but use 1024 for +500M.<br>
<br>
As suggested by Stuart, I also made a test using a 4k loop device and <br>
pvmoving the LV into it. As you expected, no data corruption.<br>
To do it I&#39;ve recreated the same setup ad yesterday: <br>
/dev/mapper/vgtest-lvol0 on /dev/sdb4, a 512/512 disk, with some data on <b=
r>
it. Then:<br>
# fallocate -l 10G testdisk.img<br>
# losetup -f -L -P -b 4096 testdisk.img<br>
# pvcreate /dev/loop0<br>
# vgextend vgtest /dev/loop0<br>
# pvmove /dev/sdb4 /dev/loop0<br>
# fsck.ext4 -f /dev/mapper/vgtest-lvol0<br>
<br>
While I was there, out of curiosity, I&#39;ve created an ext4 filesystem on=
 <br>
a &lt;500MB LV (block size =3D 1024) and I&#39;ve tried pvmoving data from =
the <br>
512/512 disk to 512/4096, then to the 4096/4096 loop device.<br>
New partitions and a new VG was used for that.<br>
<br>
The setup:<br>
/dev/sdb5: 512/512<br>
/dev/sdc2: 512/4096<br>
/dev/loop0 4096/4096<br>
<br>
# blockdev -v --getss --getpbsz --getbsz /dev/sdb<br>
get logical block (sector) size: 512<br>
get physical block (sector) size: 512<br>
get blocksize: 4096<br>
<br>
# blockdev -v --getss --getpbsz --getbsz /dev/sdc<br>
get logical block (sector) size: 512<br>
get physical block (sector) size: 4096<br>
get blocksize: 4096<br>
<br>
# blockdev -v --getss --getpbsz --getbsz /dev/loop0<br>
get logical block (sector) size: 4096<br>
get physical block (sector) size: 4096<br>
get blocksize: 4096<br>
<br>
# pvcreate /dev/sdb5<br>
# vgcreate vgtest2 /dev/sdb5<br>
# lvcreate -L 400M vgtest2 /dev/sdb5<br>
# mkfs.ext4 /dev/mapper/vgtest2-lvol0<br>
<br>
# tune2fs -l /dev/mapper/vgtest2-lvol0<br>
[...]<br>
Block size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01024<br>
[...]<br>
<br>
# mount /dev/mapper/vgtest2-lvol0 /media/test<br>
# cp -a SOMEDATA /media/test/<br>
# umount /media/test<br>
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0<br>
<br>
Now I&#39;ve moved data from the 512/512 to the 512/4096 disk:<br>
# pvcreate /dev/sdc2<br>
# vgextend vgtest2 /dev/sdc2<br>
# pvmove /dev/sdb5 /dev/sdc2<br>
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0<br>
<br>
No error reported.<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small;color:rgb(0,0,0)">Did you try to mount th=
e lv after the pvmove?</div></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Now I&#39;ve moved data to the 4096/4096 loop device:<br>
# pvcreate /dev/loop0<br>
# vgextend vgtest2 /dev/loop0<br>
# pvmove /dev/sdc2 /dev/loop0<br>
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0<br>
<br>
Still no data corruption.<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">I can reproduce =
this without moving data, just by extending vg with 4k device,</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">and then e=
xtending lv to use both devices.</div><div class=3D"gmail_default" style=3D=
"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small;color:rgb(0,0,0)">Here is what I tested:</div><div =
class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">#=
 truncate -s 500m disk1</div><div class=3D"gmail_default" style=3D"color:rg=
b(0,0,0)"># truncate -s 500m disk2</div></div><div class=3D"gmail_default">=
<div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"># losetup -f disk1 =
--sector-size 512 --show</div><div class=3D"gmail_default" style=3D"color:r=
gb(0,0,0)">/dev/loop2</div><div class=3D"gmail_default" style=3D"color:rgb(=
0,0,0)"># losetup -f disk2 --sector-size 4096 --show</div><div class=3D"gma=
il_default" style=3D"color:rgb(0,0,0)">/dev/loop3</div><div><div><font colo=
r=3D"#000000"><br></font></div><div><font color=3D"#000000"># pvcreate /dev=
/loop2</font></div><div><font color=3D"#000000">=C2=A0 Physical volume &quo=
t;/dev/loop2&quot; successfully created.</font></div></div></div><div><div =
class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"># pvcrea=
te /dev/loop3</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=
=C2=A0 Physical volume &quot;/dev/loop3&quot; successfully created.</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(0,0,0)"># vgcreate test /dev/=
loop2</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 V=
olume group &quot;test&quot; successfully created</div><div class=3D"gmail_=
default" style=3D"color:rgb(0,0,0)"># lvcreate -L400m -n lv1 test</div><div=
 class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 Logical volume &=
quot;lv1&quot; created.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"c=
olor:rgb(0,0,0)"># mkfs.xfs /dev/test/lv1=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"color:rgb(0,0,0)">meta-data=3D/dev/test/lv1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 isize=3D512=C2=A0 =C2=A0 agcount=3D4, agsize=3D25600 b=
lks</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sectsz=3D512=C2=A0 =C2=A0attr=3D2, proji=
d32bit=3D1</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crc=3D1=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 finobt=3D1, sparse=3D0, rmapbt=3D0, reflink=3D0</div><div class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0)">data=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bs=
ize=3D4096=C2=A0 =C2=A0blocks=3D102400, imaxpct=3D25</div><div class=3D"gma=
il_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sunit=3D0=C2=A0 =C2=A0 =C2=A0 swidth=3D0 blks</div><div class=
=3D"gmail_default" style=3D"color:rgb(0,0,0)">naming=C2=A0 =C2=A0=3Dversion=
 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsize=3D4096=C2=A0 =C2=
=A0ascii-ci=3D0 ftype=3D1</div><div class=3D"gmail_default" style=3D"color:=
rgb(0,0,0)">log=C2=A0 =C2=A0 =C2=A0 =3Dinternal log=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bsize=3D4096=C2=A0 =C2=A0blocks=3D855, version=3D2</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sectsz=3D512=C2=A0 =C2=A0sunit=3D0 blks, lazy-count=
=3D1</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">realtime =
=3Dnone=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0extsz=3D4096=C2=A0 =C2=A0blocks=3D0, rtextents=3D0</div><div class=3D"gm=
ail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"># mkdir /tmp=
/mnt</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0=
,0,0)"># mount /dev/test/lv1 /tmp/mnt</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(0,0,0)"># vgextend test /dev/loop3</div><div class=3D"gmail=
_default" style=3D"color:rgb(0,0,0)">=C2=A0 Volume group &quot;test&quot; s=
uccessfully extended</div><div class=3D"gmail_default" style=3D"color:rgb(0=
,0,0)"># lvextend -L+400m test/lv1</div><div class=3D"gmail_default" style=
=3D"color:rgb(0,0,0)">=C2=A0 Size of logical volume test/lv1 changed from 4=
00.00 MiB (100 extents) to 800.00 MiB (200 extents).</div><div class=3D"gma=
il_default" style=3D"color:rgb(0,0,0)">=C2=A0 Logical volume test/lv1 succe=
ssfully resized.</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0=
)"># umount /tmp/mnt</div><div class=3D"gmail_default" style=3D"color:rgb(0=
,0,0)"><br></div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"># =
mount /dev/test/lv1 /tmp/mnt</div><div class=3D"gmail_default" style=3D"col=
or:rgb(0,0,0)">mount: /tmp/mnt: mount(2) system call failed: Function not i=
mplemented.</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><b=
r></div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">From journa=
lctl:</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">Mar 02 2=
1:52:53 lean.local kernel: XFS (dm-7): Unmounting Filesystem</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(0,0,0)">Mar 02 21:53:01 lean.local k=
ernel: XFS (dm-7): device supports 4096 byte sectors (not 512)</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></div><div class=3D"gm=
ail_default" style=3D"color:rgb(0,0,0)"><br></div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(0,0,0)">I also tried the same with ext4:</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></div><div class=3D"g=
mail_default" style=3D"color:rgb(0,0,0)">(same disks/vg/lv setup as above)<=
/div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></div><div=
 class=3D"gmail_default"><div class=3D"gmail_default" style=3D"color:rgb(0,=
0,0)"># mkfs.ext4 /dev/test/lv1=C2=A0</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(0,0,0)">mke2fs 1.44.2 (14-May-2018)</div><div class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0)">Discarding device blocks: done=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_default" style=3D"color:rg=
b(0,0,0)">Creating filesystem with 409600 1k blocks and 102400 inodes</div>=
<div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">Filesystem UUID: 92=
83880e-ee89-4d79-9c29-41f4af98f894</div><div class=3D"gmail_default" style=
=3D"color:rgb(0,0,0)">Superblock backups stored on blocks:=C2=A0</div><div =
class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><span style=3D"white-spa=
ce:pre">	</span>8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409</d=
iv><div style=3D"color:rgb(0,0,0)"><br></div><div><div><font color=3D"#0000=
00">Allocating group tables: done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</font></div><=
div><font color=3D"#000000">Writing inode tables: done=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0</font></div><div><font color=3D"#000000">Creating journal (8192 b=
locks): done</font></div><div><font color=3D"#000000">Writing superblocks a=
nd filesystem accounting information: done=C2=A0</font></div></div><div sty=
le=3D"color:rgb(0,0,0)"><br></div><div><div style=3D"color:rgb(0,0,0)"># vg=
extend test /dev/loop3</div><div style=3D"color:rgb(0,0,0)">=C2=A0 Volume g=
roup &quot;test&quot; successfully extended</div><div><div><font color=3D"#=
000000"># lvextend -L+400 test/lv1</font></div><div><font color=3D"#000000"=
>=C2=A0 Size of logical volume test/lv1 changed from 400.00 MiB (100 extent=
s) to 800.00 MiB (200 extents).</font></div><div><font color=3D"#000000">=
=C2=A0 Logical volume test/lv1 successfully resized.</font></div></div><div=
 style=3D"color:rgb(0,0,0)"><br></div></div><div style=3D"color:rgb(0,0,0)"=
><div># mount /dev/test/lv1 /tmp/mnt</div><div>mount: /tmp/mnt: wrong fs ty=
pe, bad option, bad superblock on /dev/mapper/test-lv1, missing codepage or=
 helper program, or other error.</div><div><br></div></div></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">From journalc=
tl:</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,=
0,0)">Mar 02 22:06:09 lean.local kernel: EXT4-fs (dm-7): bad block size 102=
4</div></div><div><br></div><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small;color:rgb(0,0,0)">Now same with pvmove:</div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb=
(0,0,0)">(same setup as above, using xfs)</div><div class=3D"gmail_default"=
 style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_d=
efault" style=3D"font-size:small;color:rgb(0,0,0)"># mount /dev/test/lv1 /t=
mp/mnt</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb=
(0,0,0)"># dd if=3D/dev/urandom bs=3D8M count=3D1 of=3D/tmp/mnt/data</div><=
div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"># vgextend test /dev=
/loop3</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =
Physical volume &quot;/dev/loop3&quot; successfully created.</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 Volume group &quot;te=
st&quot; successfully extended</div><div class=3D"gmail_default" style=3D"f=
ont-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" sty=
le=3D"color:rgb(0,0,0)"># pvmove -v /dev/loop2 /dev/loop3</div><div class=
=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Cluster mirror =
log daemon is not running.</div><div class=3D"gmail_default" style=3D"color=
:rgb(0,0,0)">=C2=A0 =C2=A0 Wiping internal VG cache</div><div class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Wiping cache of LVM-cap=
able devices</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=
=C2=A0 =C2=A0 Archiving volume group &quot;test&quot; metadata (seqno 3).</=
div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 C=
reating logical volume pvmove0</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(0,0,0)">=C2=A0 =C2=A0 Moving 100 extents of logical volume test/lv=
1.</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=
=A0 activation/volume_list configuration setting not defined: Checking only=
 host tags for test/lv1.</div><div class=3D"gmail_default" style=3D"color:r=
gb(0,0,0)">=C2=A0 =C2=A0 Creating test-pvmove0</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Loading table for test-pvmov=
e0 (253:8).</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=
=C2=A0 =C2=A0 Loading table for test-lv1 (253:7).</div><div class=3D"gmail_=
default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Suspending test-lv1 (253:=
7) with device flush</div><div class=3D"gmail_default" style=3D"color:rgb(0=
,0,0)">=C2=A0 =C2=A0 Resuming test-pvmove0 (253:8).</div><div class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Resuming test-lv1 (253:=
7).</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=
=A0 Creating volume group backup &quot;/etc/lvm/backup/test&quot; (seqno 4)=
.</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=
=A0 activation/volume_list configuration setting not defined: Checking only=
 host tags for test/pvmove0.</div><div class=3D"gmail_default" style=3D"col=
or:rgb(0,0,0)">=C2=A0 =C2=A0 Checking progress before waiting every 15 seco=
nds.</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 /d=
ev/loop2: Moved: 15.00%</div><div class=3D"gmail_default" style=3D"color:rg=
b(0,0,0)">=C2=A0 /dev/loop2: Moved: 100.00%</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 Polling finished successfully.<=
/div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)=
"></div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0=
,0)"># umount /tmp/mnt</div><div class=3D"gmail_default" style=3D"font-size=
:small;color:rgb(0,0,0)"># mount /dev/test/lv1 /tmp/mnt</div><div class=3D"=
gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">mount: /tmp/mnt: =
mount(2) system call failed: Function not implemented.</div></div><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(=
0,0,0)">From journalctl:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)">Mar 02 22:20:36 lean.local kernel: XFS (dm-7): d=
evice supports 4096 byte sectors (not 512)</div><br></div><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=
Tested on Fedora 28 with:</div><div>kernel-4.20.5-100.fc28.x86_64</div><div=
>lvm2-2.02.177-5.fc28.x86_64</div></div><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small;color:rgb(0,0,0)">Nir</div><br></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div></div></div></div></div>

--0000000000004e9a0205832252c9--
