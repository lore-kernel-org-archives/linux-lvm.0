Date: Fri, 30 May 2014 14:54:07 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530135407.GM1302@redhat.com>
References: <20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com> <53888ABF.8070104@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline
In-Reply-To: <53888ABF.8070104@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: Heinz Mauelshagen <heinzm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, Mike Snitzer <snitzer@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>


--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm attaching 3 tests that I have run so (hopefully) you can see
what I'm observing, or point out if I'm making a mistake.

- virt-ham0-raid1.txt

  Test with an ext4 filesystem located in an LV on the RAID 1 (md)
  array of 2 x WD NAS hard disks.

- virt-ham0-ssd.txt

  Test with an ext4 filesystem located in an LV on the Samsung EVO SSD.

- virt-ham0-lvmcache.txt

  Test with LVM-cache.

For all tests, the same virt.job file is used:

[virt]
ioengine=libaio
iodepth=4
rw=randrw
bs=64k
direct=1
size=1g
numjobs=4

All tests are run on the same hardware.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-raid1.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)

virt: (groupid=0, jobs=1): err= 0: pid=2195: Wed May 28 22:12:50 2014
  read : io=523520KB, bw=2600.4KB/s, iops=40, runt=201329msec
    slat (usec): min=23, max=24586, avg=65.89, stdev=306.38
    clat (usec): min=305, max=1765.7K, avg=84912.67, stdev=124153.30
     lat (usec): min=367, max=1765.8K, avg=84979.16, stdev=124150.29
    clat percentiles (usec):
     |  1.00th=[  780],  5.00th=[ 6944], 10.00th=[ 9536], 20.00th=[14144],
     | 30.00th=[19840], 40.00th=[28032], 50.00th=[40704], 60.00th=[57600],
     | 70.00th=[82432], 80.00th=[125440], 90.00th=[209920], 95.00th=[309248],
     | 99.00th=[593920], 99.50th=[790528], 99.90th=[1204224], 99.95th=[1286144],
     | 99.99th=[1761280]
    bw (KB  /s): min=   82, max=12416, per=25.85%, avg=2688.32, stdev=1545.40
  write: io=525056KB, bw=2607.1KB/s, iops=40, runt=201329msec
    slat (usec): min=31, max=140675, avg=132.77, stdev=1945.34
    clat (usec): min=346, max=1355.5K, avg=13280.27, stdev=57149.27
     lat (usec): min=404, max=1355.6K, avg=13413.69, stdev=57202.63
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  374], 10.00th=[  434], 20.00th=[  446],
     | 30.00th=[  644], 40.00th=[  852], 50.00th=[ 1272], 60.00th=[ 1320],
     | 70.00th=[ 1496], 80.00th=[ 5728], 90.00th=[18048], 95.00th=[63232],
     | 99.00th=[257024], 99.50th=[382976], 99.90th=[831488], 99.95th=[946176],
     | 99.99th=[1351680]
    bw (KB  /s): min=  121, max=10709, per=25.96%, avg=2708.14, stdev=1769.64
    lat (usec) : 500=12.91%, 750=6.04%, 1000=3.25%
    lat (msec) : 2=16.32%, 4=1.65%, 10=7.59%, 20=12.91%, 50=14.75%
    lat (msec) : 100=9.90%, 250=10.51%, 500=3.19%, 750=0.66%, 1000=0.20%
    lat (msec) : 2000=0.13%
  cpu          : usr=0.11%, sys=0.54%, ctx=16504, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2196: Wed May 28 22:12:50 2014
  read : io=523520KB, bw=2947.6KB/s, iops=46, runt=177615msec
    slat (usec): min=24, max=59936, avg=81.73, stdev=987.31
    clat (usec): min=149, max=1054.1K, avg=74995.11, stdev=93418.23
     lat (usec): min=369, max=1054.2K, avg=75077.47, stdev=93411.06
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    8], 10.00th=[   10], 20.00th=[   16],
     | 30.00th=[   22], 40.00th=[   31], 50.00th=[   42], 60.00th=[   57],
     | 70.00th=[   80], 80.00th=[  116], 90.00th=[  180], 95.00th=[  260],
     | 99.00th=[  437], 99.50th=[  529], 99.90th=[  840], 99.95th=[  979],
     | 99.99th=[ 1057]
    bw (KB  /s): min=  113, max= 6898, per=29.26%, avg=3043.36, stdev=1217.82
  write: io=525056KB, bw=2956.2KB/s, iops=46, runt=177615msec
    slat (usec): min=33, max=140655, avg=128.77, stdev=2069.57
    clat (usec): min=258, max=1000.6K, avg=11590.37, stdev=57029.08
     lat (usec): min=403, max=1000.7K, avg=11719.76, stdev=57077.03
    clat percentiles (usec):
     |  1.00th=[  362],  5.00th=[  378], 10.00th=[  434], 20.00th=[  446],
     | 30.00th=[  612], 40.00th=[  748], 50.00th=[ 1224], 60.00th=[ 1304],
     | 70.00th=[ 1352], 80.00th=[ 1528], 90.00th=[ 7776], 95.00th=[55040],
     | 99.00th=[244736], 99.50th=[362496], 99.90th=[913408], 99.95th=[929792],
     | 99.99th=[1003520]
    bw (KB  /s): min=  140, max= 7409, per=29.16%, avg=3042.19, stdev=1466.35
    lat (usec) : 250=0.01%, 500=13.49%, 750=6.57%, 1000=3.19%
    lat (msec) : 2=19.84%, 4=1.70%, 10=5.92%, 20=9.95%, 50=14.89%
    lat (msec) : 100=10.81%, 250=10.45%, 500=2.73%, 750=0.31%, 1000=0.13%
    lat (msec) : 2000=0.02%
  cpu          : usr=0.14%, sys=0.59%, ctx=16858, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2197: Wed May 28 22:12:50 2014
  read : io=523520KB, bw=2923.2KB/s, iops=45, runt=179092msec
    slat (usec): min=20, max=99838, avg=91.84, stdev=1411.97
    clat (usec): min=160, max=1512.4K, avg=75755.06, stdev=105522.71
     lat (usec): min=382, max=1512.9K, avg=75847.54, stdev=105514.14
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    8], 10.00th=[   10], 20.00th=[   15],
     | 30.00th=[   21], 40.00th=[   29], 50.00th=[   40], 60.00th=[   56],
     | 70.00th=[   76], 80.00th=[  112], 90.00th=[  186], 95.00th=[  269],
     | 99.00th=[  469], 99.50th=[  586], 99.90th=[ 1156], 99.95th=[ 1287],
     | 99.99th=[ 1516]
    bw (KB  /s): min=  124, max= 6144, per=29.37%, avg=3055.29, stdev=1223.87
  write: io=525056KB, bw=2931.8KB/s, iops=45, runt=179092msec
    slat (usec): min=35, max=140660, avg=114.41, stdev=1768.12
    clat (usec): min=345, max=1441.6K, avg=11547.93, stdev=62451.29
     lat (usec): min=415, max=1441.7K, avg=11663.01, stdev=62476.14
    clat percentiles (usec):
     |  1.00th=[  362],  5.00th=[  378], 10.00th=[  434], 20.00th=[  446],
     | 30.00th=[  596], 40.00th=[  756], 50.00th=[ 1224], 60.00th=[ 1304],
     | 70.00th=[ 1352], 80.00th=[ 1544], 90.00th=[ 8896], 95.00th=[37632],
     | 99.00th=[232448], 99.50th=[350208], 99.90th=[995328], 99.95th=[1044480],
     | 99.99th=[1433600]
    bw (KB  /s): min=   80, max= 9325, per=29.37%, avg=3063.24, stdev=1532.25
    lat (usec) : 250=0.01%, 500=13.56%, 750=6.50%, 1000=3.08%
    lat (msec) : 2=19.73%, 4=1.62%, 10=6.32%, 20=10.52%, 50=14.89%
    lat (msec) : 100=10.77%, 250=9.75%, 500=2.72%, 750=0.27%, 1000=0.13%
    lat (msec) : 2000=0.14%
  cpu          : usr=0.14%, sys=0.59%, ctx=16985, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2198: Wed May 28 22:12:50 2014
  read : io=523520KB, bw=2629.9KB/s, iops=41, runt=199069msec
    slat (usec): min=25, max=99063, avg=89.77, stdev=1365.24
    clat (usec): min=112, max=1392.1K, avg=83373.43, stdev=118987.34
     lat (usec): min=369, max=1392.1K, avg=83463.84, stdev=118977.09
    clat percentiles (msec):
     |  1.00th=[    3],  5.00th=[    7], 10.00th=[   10], 20.00th=[   15],
     | 30.00th=[   21], 40.00th=[   28], 50.00th=[   40], 60.00th=[   57],
     | 70.00th=[   81], 80.00th=[  122], 90.00th=[  206], 95.00th=[  310],
     | 99.00th=[  603], 99.50th=[  734], 99.90th=[  979], 99.95th=[ 1156],
     | 99.99th=[ 1401]
    bw (KB  /s): min=   64, max= 9708, per=26.35%, avg=2740.70, stdev=1540.11
  write: io=525056KB, bw=2637.6KB/s, iops=41, runt=199069msec
    slat (usec): min=38, max=140657, avg=121.47, stdev=1860.80
    clat (usec): min=349, max=1002.9K, avg=13698.39, stdev=66153.66
     lat (usec): min=405, max=1002.9K, avg=13820.49, stdev=66192.16
    clat percentiles (usec):
     |  1.00th=[  362],  5.00th=[  378], 10.00th=[  434], 20.00th=[  446],
     | 30.00th=[  652], 40.00th=[  876], 50.00th=[ 1272], 60.00th=[ 1320],
     | 70.00th=[ 1448], 80.00th=[ 2992], 90.00th=[15552], 95.00th=[36096],
     | 99.00th=[321536], 99.50th=[489472], 99.90th=[962560], 99.95th=[995328],
     | 99.99th=[1003520]
    bw (KB  /s): min=   71, max= 9836, per=26.41%, avg=2755.14, stdev=1757.17
    lat (usec) : 250=0.02%, 500=12.84%, 750=5.83%, 1000=3.12%
    lat (msec) : 2=17.58%, 4=1.73%, 10=7.50%, 20=12.41%, 50=14.97%
    lat (msec) : 100=9.86%, 250=9.86%, 500=3.19%, 750=0.78%, 1000=0.25%
    lat (msec) : 2000=0.06%
  cpu          : usr=0.12%, sys=0.53%, ctx=16540, majf=0, minf=22
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=10401KB/s, minb=2600KB/s, maxb=2947KB/s, mint=177615msec, maxt=201329msec
  WRITE: io=2051.0MB, aggrb=10431KB/s, minb=2607KB/s, maxb=2956KB/s, mint=177615msec, maxt=201329msec

Disk stats (read/write):
    dm-0: ios=32841/33299, merge=0/0, ticks=2623746/506809, in_queue=3130698, util=100.00%, aggrios=32855/33392, aggrmerge=0/0, aggrticks=0/0, aggrin_queue=0, aggrutil=0.00%
    md127: ios=32855/33392, merge=0/0, ticks=0/0, in_queue=0, util=0.00%, aggrios=16426/33225, aggrmerge=1/168, aggrticks=1311820/306619, aggrin_queue=1618332, aggrutil=98.91%
  sda: ios=8494/33223, merge=0/171, ticks=464540/232964, in_queue=697442, util=96.18%
  sdb: ios=24359/33228, merge=2/166, ticks=2159100/380274, in_queue=2539222, util=98.91%

--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-ssd.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes

virt: (groupid=0, jobs=1): err= 0: pid=2177: Wed May 28 22:07:58 2014
  read : io=523520KB, bw=28983KB/s, iops=452, runt= 18063msec
    slat (usec): min=23, max=4451, avg=42.52, stdev=61.50
    clat (usec): min=136, max=26872, avg=4360.12, stdev=1103.80
     lat (msec): min=2, max=26, avg= 4.40, stdev= 1.10
    clat percentiles (usec):
     |  1.00th=[ 3824],  5.00th=[ 3888], 10.00th=[ 3920], 20.00th=[ 3952],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4256],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4960],
     | 99.00th=[ 9792], 99.50th=[10304], 99.90th=[17024], 99.95th=[21888],
     | 99.99th=[26752]
    bw (KB  /s): min=25600, max=33280, per=25.02%, avg=29007.28, stdev=1840.52
  write: io=525056KB, bw=29068KB/s, iops=454, runt= 18063msec
    slat (usec): min=26, max=5046, avg=48.33, stdev=57.35
    clat (msec): min=3, max=29, avg= 4.36, stdev= 1.10
     lat (msec): min=3, max=29, avg= 4.41, stdev= 1.11
    clat percentiles (usec):
     |  1.00th=[ 3856],  5.00th=[ 3920], 10.00th=[ 3952], 20.00th=[ 3984],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4256],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4896],
     | 99.00th=[ 9920], 99.50th=[10560], 99.90th=[16320], 99.95th=[21376],
     | 99.99th=[29056]
    bw (KB  /s): min=25447, max=31744, per=25.02%, avg=29091.58, stdev=1503.68
    lat (usec) : 250=0.01%
    lat (msec) : 4=24.84%, 10=74.26%, 20=0.82%, 50=0.08%
  cpu          : usr=1.10%, sys=4.57%, ctx=16802, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2178: Wed May 28 22:07:58 2014
  read : io=523520KB, bw=28986KB/s, iops=452, runt= 18061msec
    slat (usec): min=20, max=4734, avg=44.14, stdev=65.97
    clat (usec): min=134, max=34582, avg=4367.22, stdev=1102.36
     lat (msec): min=2, max=34, avg= 4.41, stdev= 1.10
    clat percentiles (usec):
     |  1.00th=[ 3824],  5.00th=[ 3888], 10.00th=[ 3920], 20.00th=[ 3984],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4256],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4704], 95.00th=[ 4960],
     | 99.00th=[ 9920], 99.50th=[10304], 99.90th=[16512], 99.95th=[17024],
     | 99.99th=[34560]
    bw (KB  /s): min=25804, max=33280, per=25.03%, avg=29016.61, stdev=1835.93
  write: io=525056KB, bw=29071KB/s, iops=454, runt= 18061msec
    slat (usec): min=26, max=2297, avg=49.25, stdev=29.79
    clat (msec): min=3, max=28, avg= 4.35, stdev= 1.07
     lat (msec): min=3, max=28, avg= 4.40, stdev= 1.07
    clat percentiles (usec):
     |  1.00th=[ 3824],  5.00th=[ 3888], 10.00th=[ 3920], 20.00th=[ 3984],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4192],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4896],
     | 99.00th=[ 9920], 99.50th=[10304], 99.90th=[16192], 99.95th=[18816],
     | 99.99th=[28288]
    bw (KB  /s): min=25447, max=31936, per=25.03%, avg=29099.78, stdev=1497.17
    lat (usec) : 250=0.01%
    lat (msec) : 4=25.34%, 10=73.77%, 20=0.83%, 50=0.04%
  cpu          : usr=1.23%, sys=4.71%, ctx=16888, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2179: Wed May 28 22:07:58 2014
  read : io=523520KB, bw=28983KB/s, iops=452, runt= 18063msec
    slat (usec): min=15, max=4262, avg=41.83, stdev=65.79
    clat (usec): min=128, max=35128, avg=4352.56, stdev=1194.36
     lat (msec): min=1, max=35, avg= 4.39, stdev= 1.19
    clat percentiles (usec):
     |  1.00th=[ 3824],  5.00th=[ 3888], 10.00th=[ 3920], 20.00th=[ 3952],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4192],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4896],
     | 99.00th=[ 9792], 99.50th=[10432], 99.90th=[17280], 99.95th=[20864],
     | 99.99th=[35072]
    bw (KB  /s): min=25676, max=33402, per=25.02%, avg=29002.72, stdev=1797.83
  write: io=525056KB, bw=29068KB/s, iops=454, runt= 18063msec
    slat (usec): min=22, max=1784, avg=47.23, stdev=24.88
    clat (usec): min=296, max=35165, avg=4367.18, stdev=1113.83
     lat (msec): min=1, max=35, avg= 4.41, stdev= 1.11
    clat percentiles (usec):
     |  1.00th=[ 3856],  5.00th=[ 3920], 10.00th=[ 3952], 20.00th=[ 3984],
     | 30.00th=[ 4048], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4256],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4960],
     | 99.00th=[ 9792], 99.50th=[10176], 99.90th=[16320], 99.95th=[20608],
     | 99.99th=[35072]
    bw (KB  /s): min=25223, max=32127, per=25.02%, avg=29093.50, stdev=1608.39
    lat (usec) : 250=0.01%, 500=0.01%
    lat (msec) : 2=0.01%, 4=23.93%, 10=75.24%, 20=0.73%, 50=0.07%
  cpu          : usr=1.07%, sys=4.55%, ctx=16766, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=2180: Wed May 28 22:07:58 2014
  read : io=523520KB, bw=28985KB/s, iops=452, runt= 18062msec
    slat (usec): min=24, max=5553, avg=44.79, stdev=80.00
    clat (usec): min=138, max=34979, avg=4358.30, stdev=1106.07
     lat (msec): min=2, max=35, avg= 4.40, stdev= 1.10
    clat percentiles (usec):
     |  1.00th=[ 3824],  5.00th=[ 3888], 10.00th=[ 3920], 20.00th=[ 3984],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4256],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4704], 95.00th=[ 4960],
     | 99.00th=[ 9792], 99.50th=[10304], 99.90th=[16192], 99.95th=[19584],
     | 99.99th=[35072]
    bw (KB  /s): min=25243, max=33280, per=25.02%, avg=29005.64, stdev=1815.27
  write: io=525056KB, bw=29070KB/s, iops=454, runt= 18062msec
    slat (usec): min=27, max=4550, avg=50.17, stdev=52.18
    clat (usec): min=372, max=34869, avg=4354.62, stdev=1175.13
     lat (msec): min=3, max=34, avg= 4.41, stdev= 1.17
    clat percentiles (usec):
     |  1.00th=[ 3856],  5.00th=[ 3888], 10.00th=[ 3952], 20.00th=[ 3984],
     | 30.00th=[ 4016], 40.00th=[ 4080], 50.00th=[ 4128], 60.00th=[ 4192],
     | 70.00th=[ 4320], 80.00th=[ 4448], 90.00th=[ 4640], 95.00th=[ 4896],
     | 99.00th=[ 9920], 99.50th=[10432], 99.90th=[18304], 99.95th=[22144],
     | 99.99th=[35072]
    bw (KB  /s): min=25377, max=32000, per=25.02%, avg=29094.31, stdev=1546.49
    lat (usec) : 250=0.01%, 500=0.01%
    lat (msec) : 4=25.07%, 10=74.04%, 20=0.82%, 50=0.05%
  cpu          : usr=1.02%, sys=4.93%, ctx=16748, majf=0, minf=22
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=115932KB/s, minb=28983KB/s, maxb=28986KB/s, mint=18061msec, maxt=18063msec
  WRITE: io=2051.0MB, aggrb=116272KB/s, minb=29068KB/s, maxb=29071KB/s, mint=18061msec, maxt=18063msec

Disk stats (read/write):
    dm-1: ios=32531/32589, merge=0/0, ticks=141395/170612, in_queue=312036, util=99.54%, aggrios=32720/32831, aggrmerge=0/12, aggrticks=142412/171944, aggrin_queue=314244, aggrutil=99.45%
  sdc: ios=32720/32831, merge=0/12, ticks=142412/171944, in_queue=314244, util=99.45%

--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-lvmcache.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes

virt: (groupid=0, jobs=1): err= 0: pid=4678: Fri May 30 14:49:36 2014
  read : io=523520KB, bw=6385.7KB/s, iops=99, runt= 81984msec
    slat (usec): min=15, max=51287, avg=92.23, stdev=1109.90
    clat (usec): min=3, max=17110, avg=741.35, stdev=1099.40
     lat (usec): min=374, max=51293, avg=834.14, stdev=1547.02
    clat percentiles (usec):
     |  1.00th=[  346],  5.00th=[  350], 10.00th=[  354], 20.00th=[  362],
     | 30.00th=[  374], 40.00th=[  378], 50.00th=[  398], 60.00th=[  430],
     | 70.00th=[  450], 80.00th=[  564], 90.00th=[ 1448], 95.00th=[ 2960],
     | 99.00th=[ 5664], 99.50th=[ 6880], 99.90th=[12096], 99.95th=[12608],
     | 99.99th=[17024]
    bw (KB  /s): min=  106, max=25344, per=28.73%, avg=6890.66, stdev=3382.41
  write: io=525056KB, bw=6404.4KB/s, iops=100, runt= 81984msec
    slat (usec): min=23, max=79877, avg=113.74, stdev=1656.45
    clat (usec): min=267, max=939139, avg=38930.63, stdev=72364.78
     lat (usec): min=343, max=939175, avg=39045.06, stdev=72510.87
    clat percentiles (usec):
     |  1.00th=[  298],  5.00th=[  302], 10.00th=[  326], 20.00th=[  844],
     | 30.00th=[ 6688], 40.00th=[38144], 50.00th=[41728], 60.00th=[43776],
     | 70.00th=[46848], 80.00th=[50944], 90.00th=[56064], 95.00th=[61184],
     | 99.00th=[181248], 99.50th=[790528], 99.90th=[872448], 99.95th=[905216],
     | 99.99th=[937984]
    bw (KB  /s): min=   71, max=22528, per=28.70%, avg=6904.82, stdev=3083.01
    lat (usec) : 4=0.01%, 10=0.02%, 100=0.01%, 250=0.01%, 500=47.35%
    lat (usec) : 750=4.99%, 1000=1.57%
    lat (msec) : 2=3.75%, 4=5.01%, 10=2.75%, 20=0.51%, 50=23.00%
    lat (msec) : 100=10.40%, 250=0.19%, 500=0.04%, 750=0.07%, 1000=0.32%
  cpu          : usr=0.25%, sys=1.29%, ctx=16566, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=4679: Fri May 30 14:49:36 2014
  read : io=523520KB, bw=6537.6KB/s, iops=102, runt= 80079msec
    slat (usec): min=16, max=61433, avg=102.37, stdev=1288.95
    clat (usec): min=2, max=16641, avg=737.39, stdev=1134.94
     lat (usec): min=376, max=61436, avg=840.31, stdev=1699.15
    clat percentiles (usec):
     |  1.00th=[  342],  5.00th=[  350], 10.00th=[  354], 20.00th=[  362],
     | 30.00th=[  374], 40.00th=[  378], 50.00th=[  398], 60.00th=[  430],
     | 70.00th=[  450], 80.00th=[  580], 90.00th=[ 1288], 95.00th=[ 2896],
     | 99.00th=[ 5664], 99.50th=[ 7648], 99.90th=[12864], 99.95th=[14656],
     | 99.99th=[16768]
    bw (KB  /s): min=  298, max=27181, per=29.47%, avg=7067.77, stdev=3871.99
  write: io=525056KB, bw=6556.8KB/s, iops=102, runt= 80079msec
    slat (usec): min=26, max=48770, avg=83.15, stdev=890.23
    clat (usec): min=266, max=5409.6K, avg=38023.69, stdev=102346.26
     lat (usec): min=337, max=5409.7K, avg=38107.52, stdev=102438.81
    clat percentiles (usec):
     |  1.00th=[  294],  5.00th=[  302], 10.00th=[  318], 20.00th=[  382],
     | 30.00th=[ 3248], 40.00th=[37120], 50.00th=[41216], 60.00th=[43776],
     | 70.00th=[46336], 80.00th=[50432], 90.00th=[56064], 95.00th=[61184],
     | 99.00th=[173056], 99.50th=[790528], 99.90th=[897024], 99.95th=[921600],
     | 99.99th=[5406720]
    bw (KB  /s): min=  298, max=24710, per=29.43%, avg=7078.80, stdev=3321.80
    lat (usec) : 4=0.02%, 10=0.03%, 50=0.01%, 250=0.01%, 500=48.87%
    lat (usec) : 750=5.78%, 1000=1.87%
    lat (msec) : 2=3.39%, 4=4.72%, 10=2.66%, 20=0.51%, 50=21.49%
    lat (msec) : 100=10.09%, 250=0.15%, 500=0.04%, 750=0.05%, 1000=0.31%
    lat (msec) : >=2000=0.01%
  cpu          : usr=0.25%, sys=1.35%, ctx=16791, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=4680: Fri May 30 14:49:36 2014
  read : io=523520KB, bw=5996.4KB/s, iops=93, runt= 87307msec
    slat (usec): min=15, max=50215, avg=79.95, stdev=812.30
    clat (usec): min=4, max=23674, avg=754.82, stdev=1161.37
     lat (usec): min=380, max=50222, avg=835.35, stdev=1406.50
    clat percentiles (usec):
     |  1.00th=[  346],  5.00th=[  350], 10.00th=[  354], 20.00th=[  362],
     | 30.00th=[  370], 40.00th=[  378], 50.00th=[  394], 60.00th=[  430],
     | 70.00th=[  446], 80.00th=[  572], 90.00th=[ 1496], 95.00th=[ 3024],
     | 99.00th=[ 6112], 99.50th=[ 7712], 99.90th=[12352], 99.95th=[13888],
     | 99.99th=[23680]
    bw (KB  /s): min=  372, max=26368, per=26.72%, avg=6409.15, stdev=3611.01
  write: io=525056KB, bw=6013.1KB/s, iops=93, runt= 87307msec
    slat (usec): min=25, max=69281, avg=119.08, stdev=1629.76
    clat (usec): min=288, max=4229.2K, avg=41517.28, stdev=86297.67
     lat (usec): min=345, max=4229.3K, avg=41637.09, stdev=86496.27
    clat percentiles (usec):
     |  1.00th=[  298],  5.00th=[  326], 10.00th=[  540], 20.00th=[ 5280],
     | 30.00th=[22144], 40.00th=[38656], 50.00th=[41728], 60.00th=[44288],
     | 70.00th=[46848], 80.00th=[50944], 90.00th=[56064], 95.00th=[62208],
     | 99.00th=[183296], 99.50th=[790528], 99.90th=[888832], 99.95th=[913408],
     | 99.99th=[4227072]
    bw (KB  /s): min=   91, max=23808, per=26.53%, avg=6381.50, stdev=3178.76
    lat (usec) : 10=0.02%, 100=0.01%, 500=43.29%, 750=4.35%, 1000=1.67%
    lat (msec) : 2=3.61%, 4=5.15%, 10=3.24%, 20=2.69%, 50=25.01%
    lat (msec) : 100=10.25%, 250=0.26%, 500=0.04%, 750=0.10%, 1000=0.32%
    lat (msec) : >=2000=0.01%
  cpu          : usr=0.22%, sys=1.24%, ctx=16506, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=4681: Fri May 30 14:49:36 2014
  read : io=523520KB, bw=6017.6KB/s, iops=94, runt= 86999msec
    slat (usec): min=15, max=50273, avg=88.62, stdev=1003.90
    clat (usec): min=2, max=16356, avg=742.71, stdev=1140.56
     lat (usec): min=368, max=50278, avg=831.90, stdev=1505.02
    clat percentiles (usec):
     |  1.00th=[  346],  5.00th=[  350], 10.00th=[  354], 20.00th=[  362],
     | 30.00th=[  370], 40.00th=[  378], 50.00th=[  398], 60.00th=[  430],
     | 70.00th=[  446], 80.00th=[  548], 90.00th=[ 1416], 95.00th=[ 2960],
     | 99.00th=[ 6048], 99.50th=[ 8032], 99.90th=[12608], 99.95th=[13120],
     | 99.99th=[16320]
    bw (KB  /s): min=  212, max=23936, per=26.82%, avg=6433.62, stdev=3648.50
  write: io=525056KB, bw=6035.2KB/s, iops=94, runt= 86999msec
    slat (usec): min=21, max=83882, avg=116.67, stdev=1719.48
    clat (usec): min=279, max=2542.4K, avg=41373.74, stdev=77980.27
     lat (usec): min=352, max=2542.4K, avg=41491.13, stdev=78185.74
    clat percentiles (usec):
     |  1.00th=[  298],  5.00th=[  322], 10.00th=[  394], 20.00th=[ 4448],
     | 30.00th=[22656], 40.00th=[38656], 50.00th=[41728], 60.00th=[44288],
     | 70.00th=[46848], 80.00th=[50944], 90.00th=[56064], 95.00th=[62208],
     | 99.00th=[183296], 99.50th=[782336], 99.90th=[897024], 99.95th=[913408],
     | 99.99th=[2539520]
    bw (KB  /s): min=  268, max=21760, per=26.76%, avg=6437.61, stdev=3158.84
    lat (usec) : 4=0.01%, 10=0.02%, 100=0.01%, 500=44.11%, 750=4.68%
    lat (usec) : 1000=1.61%
    lat (msec) : 2=3.28%, 4=4.80%, 10=2.88%, 20=2.45%, 50=25.24%
    lat (msec) : 100=10.17%, 250=0.27%, 500=0.04%, 750=0.10%, 1000=0.31%
    lat (msec) : >=2000=0.01%
  cpu          : usr=0.26%, sys=1.19%, ctx=16414, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=23985KB/s, minb=5996KB/s, maxb=6537KB/s, mint=80079msec, maxt=87307msec
  WRITE: io=2051.0MB, aggrb=24055KB/s, minb=6013KB/s, maxb=6556KB/s, mint=80079msec, maxt=87307msec

Disk stats (read/write):
    dm-3: ios=32666/32817, merge=0/0, ticks=24343/1321747, in_queue=1346205, util=99.98%, aggrios=11107/11174, aggrmerge=0/0, aggrticks=8553/834112, aggrin_queue=843695, aggrutil=99.96%
    dm-0: ios=33323/6886, merge=0/0, ticks=25660/6683, in_queue=32346, util=16.79%, aggrios=33299/6884, aggrmerge=24/2, aggrticks=25549/6673, aggrin_queue=32121, aggrutil=16.75%
  sdc: ios=33299/6884, merge=24/2, ticks=25549/6673, in_queue=32121, util=16.75%
  dm-1: ios=0/0, merge=0/0, ticks=0/0, in_queue=0, util=0.00%
    dm-2: ios=0/26636, merge=0/0, ticks=0/2495655, in_queue=2498741, util=99.96%, aggrios=0/26654, aggrmerge=0/0, aggrticks=0/0, aggrin_queue=0, aggrutil=0.00%
    md127: ios=0/26654, merge=0/0, ticks=0/0, in_queue=0, util=0.00%, aggrios=0/26616, aggrmerge=0/27, aggrticks=0/1625073, aggrin_queue=1626606, aggrutil=99.64%
  sda: ios=0/26610, merge=0/26, ticks=0/2380053, in_queue=2383117, util=99.64%
  sdb: ios=0/26622, merge=0/28, ticks=0/870094, in_queue=870095, util=89.86%

--t5C3/nrmPumNj5sH--
