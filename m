Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3BJXsn8031050
	for <linux-lvm@redhat.com>; Sun, 11 Apr 2010 15:33:56 -0400
Received: from mail45.e.nsc.no (mail45.e.nsc.no [193.213.115.45])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3BJXhdR026980
	for <linux-lvm@redhat.com>; Sun, 11 Apr 2010 15:33:44 -0400
Received: from [10.0.0.171] (127.81.202.84.customer.cdi.no [84.202.81.127])
	by mail45.nsc.no (8.14.3/8.14.3) with ESMTP id o3BJXdvx015854
	for <linux-lvm@redhat.com>; Sun, 11 Apr 2010 21:33:40 +0200 (MEST)
Message-Id: <EE38C061-1B9E-4CA3-AF89-FFA7F3F4E148@bjorgeengen.net>
From: =?ISO-8859-1?Q?Jarle_Bj=F8rgeengen?= <jarle@bjorgeengen.net>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 11 Apr 2010 21:33:39 +0200
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM performance anomalies
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: linux-lvm@redhat.com

Hello,

I have some rather odd performance anomalies when using direct i/o =20
towards lvm logical volumes.

I have a setup with 10 external scsi disks attached to the external =20
scsi port of a DELL PERC 4DC RAID controller. Each disk is configured =20
as its own logical disk, hence not using raid functionality in the =20
adapter .

* The disks is pvcreated with "pvcreate /dev/sd[d-m]" .
* The vg is created with vgcreate vg_perc /dev/sd[d-m] .
* Logical volumes is created using  for i in b2 b3 b4 b5 ; do lvcreate =20
-L 50g -n lv_${i} -I 64 -i 10 vg_perc ; done

I use fio [1] to generate workload, with this configuration:

[global]
rw=3Dread
size=3D1280m
blocksize=3D64k
ioengine=3Dsync
write_lat_log
write_bw_log
direct=3D1
[job1]
filename=3D/dev/mapper/vg_perc-lv_b2
[job2]
filename=3D/dev/mapper/vg_perc-lv_b3
[job3]
filename=3D/dev/mapper/vg_perc-lv_b4
[job4]
filename=3D/dev/mapper/vg_perc-lv_b5

Normal, and expected aggregated throughput is 35-40 MB/s . ( Approx =20
8.5 MB/s each of the LVs sharing the aggragated bandwidth)

I can run this job many times after each other (I ran it continously =20
for 12 Hour once) and get the expected results.

completion latency and bandwidth log plots (from fio) of a job with =20
normal throughput (some anomalies in the start though) is seen here:

http://folk.uio.no/jb/strange-lvm/good-clat.png
http://folk.uio.no/jb/strange-lvm/good-bw.png

Suddenly, in the middle of one the runs, the throughput drops to =20
128-256kB/s pr LV. If I stop the job and start a job reading directly =20
from the underlying disks I get 39MB/s aggregated . If I  start the =20
job against LVs I still get maximum 512kB/s .

completion latency and bandwidth log plots (from fio) of a job with =20
poor throughput is seen here:

http://folk.uio.no/jb/strange-lvm/bad-clat.png
http://folk.uio.no/jb/strange-lvm/bad-bw.png

Summary output from fio after the bad condition is here:
http://folk.uio.no/jb/strange-lvm/bad-fio.out

Summary output from fio after the good condition is here:
http://folk.uio.no/jb/strange-lvm/good-fio.out

Complete blktraces of the lvm devices for bad condition is here:
http://folk.uio.no/jb/strange-lvm/bad-blktraces.tgz

Complete blktraces of the lvm devices for good condition is here:
http://folk.uio.no/jb/strange-lvm/good-blktraces.tgz

I have not been able to find out what i triggering the problem. It =20
happens at random times. If I leave to run in poor condition. =20
Sometimes it recovers again after some time.

If anyone would help me shed some light on what is going on, or =20
suggest how to proceed, it would be much appreciated .

I have tried doing read through an ext3 filesystem instead of directly =20
to the device, and it is the same problem.

[1] http://freshmeat.net/projects/fio/

Best rgds
Jarle Bj=EF=BF=BDrgeengen
