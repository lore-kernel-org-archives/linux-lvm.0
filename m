Date: Wed, 30 Aug 2000 20:19:38 -0500 (EST)
From: John Marquart <jomarqua@indiana.edu>
Subject: [linux-lvm] ERROR -241 getting size of physical volume "/dev/hdd2"
Message-ID: <Pine.A41.4.21.0008302002520.33560-100000@gigue.dlib.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Evening LVMers!

I have been having a wonderful time with LVM - many thanks.  

However, I was attempting to add an extra physical device to my machine,
and add it to an existing VG.  When I ran "pvcreate /dev/hdd2" it gave me
the following error:

pvcreate -- ERROR -241 getting size of physical volume "/dev/hdd2"  

and when I run lvmscandisk it does only pics up 1 disk (not /dev/hdd).

I was trying to figure out why, and I took a brief look at the strace for
the command.  I noted that it read hdd info from
/proc/partitions.  However, when it stat() s the various HDDs, it examines
the /dev/hda ones by name.  However, when it tries to stat() the /dev/hdd
ones - it instead uses /dev/64 /dev/66 (the minor # of the drive/partition
respectively).

(note - the partition ID is set to 8e.)

Here is the section of the "strace pvcreate /dev/hdd2":

ioctl(3, 0xff00, 0xbffff43c)  = 0 stat("/dev/hdd2", {st_mode=S_IFBLK|0660,
st_rdev=makedev(22, 66), ...}) = 0 stat("/dev/hdd2",
{st_mode=S_IFBLK|0660, st_rdev=makedev(22, 66), ...}) = 0
stat("/dev/hdd2", {st_mode=S_IFBLK|0660, st_rdev=makedev(22, 66), ...}) =
0 stat("/dev/hdd2", {st_mode=S_IFBLK|0660, st_rdev=makedev(22, 66), ...})
= 0 open("/proc/partitions", O_RDONLY)  = 4 fstat(4,
{st_mode=S_IFREG|0444, st_size=0, ...}) = 0 mmap(NULL, 4096,
PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4011f000
read(4, "major minor #blocks name\n\n 3"..., 1024) = 287 stat("/dev/hda",
{st_mode=S_IFBLK|0660, st_rdev=makedev(3, 0), ...}) = 0 stat("/dev/hda1",
{st_mode=S_IFBLK|0660, st_rdev=makedev(3, 1), ...}) = 0 stat("/dev/hda2",
{st_mode=S_IFBLK|0660, st_rdev=makedev(3, 2), ...}) = 0 stat("/dev/hda3",
{st_mode=S_IFBLK|0660, st_rdev=makedev(3, 3), ...}) = 0 stat("/dev/hda4",
{st_mode=S_IFBLK|0660, st_rdev=makedev(3, 4), ...}) = 0 stat("/dev/0",
0xbffff0fc)  = -1 ENOENT (No such file or directory) stat("/dev/64",
0xbffff0fc)  = -1 ENOENT (No such file or directory) stat("/dev/66",
0xbffff0fc)  = -1 ENOENT (No such file or directory) read(4, "", 1024)  =
0 stat("/dev/66", 0xbffff0fc)  = -1 ENOENT (No such file or directory)
close(4)  = 0 munmap(0x4011f000, 4096)  = 0 write(2, "pvcreate -- ERROR
-241 getting s"..., 67pvcreate -- ERROR -241 getting size of physical
volume "/dev/hdd2" ) = 67 close(3)  = 0
_exit(7)                                = ?                 



many thanks,
-jamie
