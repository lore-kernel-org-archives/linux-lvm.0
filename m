From: Jason Smith <jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EmPR+BjKIwzDrXD"
Message-Id: <200302081935.18450.jhs@openenterprise.biz>
Subject: [linux-lvm] LVM2 lvextend lockup
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
Date: Mon Feb 10 06:22:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-00=_EmPR+BjKIwzDrXD
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi.

I was just testing LVM2 on kernel 2.4.20 + 2.4.20-dm-7.  I was trying to gr=
ow
a filesystem online.  I wanted to lvextend then resize_reiserfs to make more
room for a potentially full FS; but it looks like LVM2 (or dm) isn't working
under load, or with a big full disk cache or such.

But LVM hangs after it prints "Extending Logical volume ..." and I can no
longer use the block device for any purpose, although the rest of the system
is fine.

I've included a log to demonstrate everything that I think might be importa=
nt.
I'd be happy to help if somebody has more questions.  Hopefully I just forg=
ot
a kernel patch or something.

BTW, I just tried this on a single disk (no raid) and I got the same result.
Likewise with a the kernel + VFS lock patch.

Thanks much for any input.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+RPmEm5qEoSbpT3kRAqL7AKCEg5uX23lGPd9cDbGRwHkeNcTu9wCdFDyM
IgFxgAzZXb3u2OfUrroUDRg=3D
=3DH0fW
=2D----END PGP SIGNATURE-----

--Boundary-00=_EmPR+BjKIwzDrXD
Content-Type: text/plain;
  charset="us-ascii";
  name="lvm-log.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="lvm-log.txt"

root@tester:~# lvmdiskscan --version # BTW lvm --version doesn't work
  LVM version:     1.95.10 (2002-05-31)
  Library version: 0.96.07-ioctl-cvs (2002-11-21)
  Driver version:  1.0.6

root@tester:~# cat /proc/mdstat 
Personalities : [raid0] [raid1] [raid5] 
read_ahead 1024 sectors
md1 : active raid0 ide/host4/bus1/target0/lun0/part1[3] ide/host4/bus0/target0/lun0/part1[2] ide/host2/bus1/target0/lun0/part1[1] ide/host2/bus0/target0/lun0/part1[0]
      240205824 blocks 4k chunks
      
unused devices: <none>

root@tester:~# pvcreate -ff /dev/md/1
  Physical volume "/dev/md/1" successfully created

root@tester:~# vgcreate group /dev/md/1
  Warning: Setting maxlogicalvolumes to 255
  Warning: Setting maxphysicalvolumes to 255
  Volume group "group" successfully created

root@tester:~# lvcreate -L 200m -n volume group
  Logical volume "volume" created

root@tester:~# mkreiserfs -f /dev/group/volume 

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.x.1b

mkreiserfs: Guessing about desired format.. 
mkreiserfs: Kernel 2.4.20 is running.
Format 3.6 with standard journal
Count of blocks on the device: 51200
Number of blocks consumed by mkreiserfs formatting process: 8213
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 1ba4910a-a3e0-411f-a086-e53a79e9e4df
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

[ snip mkreiserfs message ]

Have fun.

root@tester:~# mount /dev/group/volume /test

root@tester:~# cd /test

root@tester:/test# # On my system, /dev/urandom moves about 4 megs per second ( ~= medium network load)

root@tester:/test# dd if=/dev/urandom of=file bs=1024k count=300 & # Write a 300MB file
[1] 262

root@tester:/test# # ... time passes

root@tester:/test# df -h .
Filesystem            Size  Used Avail Use% Mounted on
/dev/group/volume     200M  134M   66M  67% /test

root@tester:/test# lvextend -d -L 350m group/volume
  Rounding up size to full physical extent 352.00 MB
  Extending logical volume volume to 352.00 MB

--Boundary-00=_EmPR+BjKIwzDrXD--
