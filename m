Date: Wed, 12 Jul 2000 13:22:34 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
Subject: [linux-lvm] New LVM user, couple of problems
Message-ID: <Pine.SOL.4.10.10007121311030.5718-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello all,

Playing with LVM on a spare machine to evaluate it for production usage.

Setup is a P2 300, 2 Seagate 4.3G SCSI HDs, 128M RAM, BusLogic controller,
2.4.0-test3 kernel, and 0.8final LVM tools.

I have created the logical volumes + volume groups without a problem, I
can make the filesystems, mount them and use them. All is well with basic
usage so far.

The first issue I hit upon is with lv[extend,reduce]. Essentially I will
change the size of the lv (eg lvreduce /dev/vg00/lvol1 -L 200m) however
when I mount lvol1 the size shown is the same as it was before, according
to df. lvdisplay shows the correct size of 200m, but the system seems to
disagree saying the lv is still 6.7g which was the original size. Curious
I decided to test what would happen if I attempted to write more than 200m
of data to the mounted lv, so I did dd if=/dev/zero of=/lvol1/bigfile
bs=1024k count=500 which resulted in a looping scroll of lvm_map errors (I
don't have them at the moment, but I can get them if it is needed|desired)
after it passed the 200m mark. This obviously is a bad thing, if diskspace
is exceeded it should just say no more diskspace, or similar, not go into
a loop that I can't get out of except by reboot ;). Not sure if I missed
some essential step to 'sync' between what lvdisplay thinks is there and
what df, etc do? What I did appears very similar to the LVM-HOWTO.

Secondly, I made another large lv (7.5G) after deleting the previous and
once again mounted this at /lvol1. Curious about the speed and just
feeling malicious in general, I started a *very* large dd (eg dd
if=/dev/zero of=/lvol1/really-big-friggin-file bs=1024k count=7000). This
proceeded along fine for a while, during which I realized that it should
stop at 2G due to FS (ie ext2) limits. At 2G the ls output became rather
unusual, but the dd continued and df continued to mark the fs as fuller
and fuller. The dd finished succesfully (7000 records in + out) and df
says 6.8G of the 7.5G is being used on the lv.
This seems strange to me, is LVM bypassing ext2's filesize limit or has
the limit been changed since I last checked? And what is with the weird ls
output (reproduced below).. bad ls code, or problem with the LVM? It is
interesting that it varies between an immense number and a just relatively
absurd number tho (1,3 + 2 ;). du reports correct filesize as well, ls is
the only thing I've hit weird things with which does make me lean towards 
the problem being with ls.

anywho, all advice would be appreciated, sorry if I missed some essential
docs that explained all this but I didn't see anything ;)


-b


Note: Formatting may be off a bit, this is hand reproduced (mumbles
something about stupid machines without mice).

at one point:
bloodhound:/lvol1# ls -la
total 3225401
drwxr-xr-x   3 root	root		4096 Jul 12 10:14 ./
drwxr-xr-x  18 root	root		1024 Jul 12 09:51 ../
drwxr-xr-x   2 root	root	       16384 Jul 12 10:13 lost+found/
-rw-r--r--   1 root	root	18446744072714145792 Jul 12 10:21
really-big-friggin-file

little later:
total 4443409
drwxr-xr-x   3 root     root            4096 Jul 12 10:14 ./
drwxr-xr-x  18 root     root            1024 Jul 12 09:51 ../
drwxr-xr-x   2 root     root           16384 Jul 12 10:13 lost+found/
-rw-r--r--   1 root     root       250609664 Jul 12 10:24
really-big-friggin-file

at the end:
total 7175033
drwxr-xr-x   3 root     root            4096 Jul 12 10:14 ./
drwxr-xr-x  18 root     root            1024 Jul 12 09:51 ../
drwxr-xr-x   2 root     root           16384 Jul 12 10:13 lost+found/
-rw-r--r--   1 root     root    18446744072459649024 Jul 12 10:30
really-big-friggin-file
