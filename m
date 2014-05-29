Date: Thu, 29 May 2014 14:52:46 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140529135246.GA31293@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20140522181334.GE1302@redhat.com>
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've done some more testing, comparing RAID 1 HDD with RAID 1 HDD + an
SSD overlay (using lvm-cache).

I'm now using 'fio', with the following job file:

[virt]
ioengine=libaio
iodepth=4
rw=randrw
bs=64k
direct=1
size=1g
numjobs=4

I'm still seeing almost no benefit from LVM cache.  It's about 4%
faster than the underlying, slow HDDs.  See attached runs.

The SSD LV is 200 GB and the underlying LV is 800 GB, so I would
expect there is plenty of space to cache things in the SSD during the
test.

For comparison, the fio tests runs about 11 times faster on the SSD.

Any ideas?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

--d6Gm4EdcadzBjdND
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

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-lvmcache.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)
virt: Laying out IO file(s) (1 file(s) / 1024MB)

virt: (groupid=0, jobs=1): err= 0: pid=1643: Thu May 29 14:44:39 2014
  read : io=523520KB, bw=2721.8KB/s, iops=42, runt=192348msec
    slat (usec): min=36, max=11159, avg=79.21, stdev=140.35
    clat (usec): min=305, max=1346.1K, avg=82931.26, stdev=118358.55
     lat (usec): min=383, max=1347.8K, avg=83011.13, stdev=118357.33
    clat percentiles (usec):
     |  1.00th=[  556],  5.00th=[ 6368], 10.00th=[ 8896], 20.00th=[13632],
     | 30.00th=[18816], 40.00th=[26496], 50.00th=[38144], 60.00th=[55552],
     | 70.00th=[81408], 80.00th=[125440], 90.00th=[211968], 95.00th=[313344],
     | 99.00th=[561152], 99.50th=[708608], 99.90th=[1056768], 99.95th=[1138688],
     | 99.99th=[1351680]
    bw (KB  /s): min=   64, max=13714, per=25.99%, avg=2828.82, stdev=1614.75
  write: io=525056KB, bw=2729.8KB/s, iops=42, runt=192348msec
    slat (usec): min=40, max=120228, avg=113.58, stdev=1327.58
    clat (usec): min=345, max=1401.6K, avg=10882.68, stdev=66932.84
     lat (usec): min=428, max=1401.7K, avg=10996.89, stdev=66947.30
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  366], 10.00th=[  386], 20.00th=[  442],
     | 30.00th=[  612], 40.00th=[  812], 50.00th=[ 1240], 60.00th=[ 1304],
     | 70.00th=[ 1448], 80.00th=[ 2960], 90.00th=[12736], 95.00th=[23168],
     | 99.00th=[259072], 99.50th=[403456], 99.90th=[995328], 99.95th=[1286144],
     | 99.99th=[1400832]
    bw (KB  /s): min=  105, max=13079, per=26.20%, avg=2860.76, stdev=1798.77
    lat (usec) : 500=13.62%, 750=6.18%, 1000=2.75%
    lat (msec) : 2=17.00%, 4=1.83%, 10=8.55%, 20=12.82%, 50=14.40%
    lat (msec) : 100=9.28%, 250=9.26%, 500=3.45%, 750=0.50%, 1000=0.23%
    lat (msec) : 2000=0.13%
  cpu          : usr=0.13%, sys=0.69%, ctx=16575, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=1644: Thu May 29 14:44:39 2014
  read : io=523520KB, bw=3056.4KB/s, iops=47, runt=171287msec
    slat (usec): min=34, max=166, avg=77.72, stdev=12.41
    clat (usec): min=314, max=1179.1K, avg=76362.24, stdev=95270.37
     lat (usec): min=386, max=1180.8K, avg=76440.60, stdev=95269.97
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    8], 10.00th=[   10], 20.00th=[   16],
     | 30.00th=[   23], 40.00th=[   31], 50.00th=[   42], 60.00th=[   58],
     | 70.00th=[   80], 80.00th=[  118], 90.00th=[  186], 95.00th=[  262],
     | 99.00th=[  457], 99.50th=[  570], 99.90th=[  791], 99.95th=[  906],
     | 99.99th=[ 1188]
    bw (KB  /s): min=  237, max= 6259, per=28.43%, avg=3094.94, stdev=1094.43
  write: io=525056KB, bw=3065.4KB/s, iops=47, runt=171287msec
    slat (usec): min=47, max=120139, avg=115.02, stdev=1329.52
    clat (usec): min=343, max=958790, avg=7162.31, stdev=39237.72
     lat (usec): min=422, max=958895, avg=7277.98, stdev=39265.48
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  370], 10.00th=[  386], 20.00th=[  442],
     | 30.00th=[  588], 40.00th=[  740], 50.00th=[ 1192], 60.00th=[ 1288],
     | 70.00th=[ 1320], 80.00th=[ 1496], 90.00th=[ 3216], 95.00th=[15552],
     | 99.00th=[183296], 99.50th=[301056], 99.90th=[514048], 99.95th=[610304],
     | 99.99th=[962560]
    bw (KB  /s): min=  100, max= 7418, per=28.37%, avg=3097.42, stdev=1395.25
    lat (usec) : 500=13.75%, 750=6.58%, 1000=3.16%
    lat (msec) : 2=20.43%, 4=1.64%, 10=6.06%, 20=9.94%, 50=14.88%
    lat (msec) : 100=10.52%, 250=9.92%, 500=2.67%, 750=0.35%, 1000=0.06%
    lat (msec) : 2000=0.01%
  cpu          : usr=0.14%, sys=0.79%, ctx=16933, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=1645: Thu May 29 14:44:39 2014
  read : io=523520KB, bw=3097.5KB/s, iops=48, runt=169019msec
    slat (usec): min=36, max=141, avg=77.24, stdev=12.48
    clat (usec): min=311, max=1577.6K, avg=74149.52, stdev=97313.65
     lat (usec): min=376, max=1577.6K, avg=74227.41, stdev=97313.32
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    8], 10.00th=[   10], 20.00th=[   15],
     | 30.00th=[   22], 40.00th=[   30], 50.00th=[   42], 60.00th=[   56],
     | 70.00th=[   77], 80.00th=[  112], 90.00th=[  176], 95.00th=[  251],
     | 99.00th=[  453], 99.50th=[  578], 99.90th=[  947], 99.95th=[ 1254],
     | 99.99th=[ 1582]
    bw (KB  /s): min=   62, max= 7492, per=29.37%, avg=3197.36, stdev=1186.93
  write: io=525056KB, bw=3106.6KB/s, iops=48, runt=169019msec
    slat (usec): min=47, max=120168, avg=112.54, stdev=1325.71
    clat (usec): min=335, max=1474.2K, avg=8254.87, stdev=57083.94
     lat (usec): min=416, max=1474.3K, avg=8368.05, stdev=57098.21
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  366], 10.00th=[  386], 20.00th=[  442],
     | 30.00th=[  564], 40.00th=[  724], 50.00th=[ 1176], 60.00th=[ 1272],
     | 70.00th=[ 1320], 80.00th=[ 1464], 90.00th=[ 2224], 95.00th=[13504],
     | 99.00th=[185344], 99.50th=[321536], 99.90th=[1019904], 99.95th=[1073152],
     | 99.99th=[1466368]
    bw (KB  /s): min=  109, max= 8172, per=29.43%, avg=3213.21, stdev=1535.62
    lat (usec) : 500=14.15%, 750=6.58%, 1000=3.03%
    lat (msec) : 2=20.82%, 4=1.48%, 10=6.24%, 20=9.75%, 50=14.67%
    lat (msec) : 100=10.94%, 250=9.46%, 500=2.37%, 750=0.34%, 1000=0.07%
    lat (msec) : 2000=0.10%
  cpu          : usr=0.13%, sys=0.81%, ctx=16936, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=1646: Thu May 29 14:44:39 2014
  read : io=523520KB, bw=2773.6KB/s, iops=43, runt=188788msec
    slat (usec): min=23, max=2618, avg=77.53, stdev=31.29
    clat (usec): min=309, max=1755.5K, avg=82247.61, stdev=119257.63
     lat (usec): min=356, max=1755.6K, avg=82325.78, stdev=119257.35
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[   10], 20.00th=[   14],
     | 30.00th=[   20], 40.00th=[   27], 50.00th=[   38], 60.00th=[   55],
     | 70.00th=[   81], 80.00th=[  122], 90.00th=[  212], 95.00th=[  306],
     | 99.00th=[  578], 99.50th=[  750], 99.90th=[  988], 99.95th=[ 1106],
     | 99.99th=[ 1762]
    bw (KB  /s): min=  122, max= 9325, per=26.30%, avg=2863.03, stdev=1442.98
  write: io=525056KB, bw=2781.2KB/s, iops=43, runt=188788msec
    slat (usec): min=44, max=120232, avg=112.99, stdev=1326.51
    clat (usec): min=346, max=1033.4K, avg=9830.80, stdev=52064.46
     lat (usec): min=421, max=1033.5K, avg=9944.42, stdev=52084.32
    clat percentiles (usec):
     |  1.00th=[  362],  5.00th=[  370], 10.00th=[  386], 20.00th=[  446],
     | 30.00th=[  588], 40.00th=[  788], 50.00th=[ 1240], 60.00th=[ 1304],
     | 70.00th=[ 1416], 80.00th=[ 1976], 90.00th=[12736], 95.00th=[23424],
     | 99.00th=[244736], 99.50th=[333824], 99.90th=[937984], 99.95th=[954368],
     | 99.99th=[1036288]
    bw (KB  /s): min=  100, max= 8694, per=26.24%, avg=2865.37, stdev=1678.69
    lat (usec) : 500=13.65%, 750=6.05%, 1000=2.78%
    lat (msec) : 2=18.05%, 4=1.64%, 10=7.68%, 20=12.79%, 50=14.66%
    lat (msec) : 100=9.39%, 250=9.17%, 500=3.31%, 750=0.51%, 1000=0.24%
    lat (msec) : 2000=0.07%
  cpu          : usr=0.13%, sys=0.70%, ctx=16629, majf=0, minf=22
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=10886KB/s, minb=2721KB/s, maxb=3097KB/s, mint=169019msec, maxt=192348msec
  WRITE: io=2051.0MB, aggrb=10918KB/s, minb=2729KB/s, maxb=3106KB/s, mint=169019msec, maxt=192348msec

Disk stats (read/write):
    dm-3: ios=32687/32957, merge=0/0, ticks=2580936/388295, in_queue=2969480, util=100.00%, aggrios=10910/11025, aggrmerge=0/0, aggrticks=860321/160031, aggrin_queue=1020354, aggrutil=100.00%
    dm-0: ios=5/44, merge=0/0, ticks=10/85, in_queue=95, util=0.05%, aggrios=11/50, aggrmerge=0/2, aggrticks=11/94, aggrin_queue=105, aggrutil=0.05%
  sdc: ios=11/50, merge=0/2, ticks=11/94, in_queue=105, util=0.05%
  dm-1: ios=6/8, merge=0/0, ticks=1/9, in_queue=10, util=0.01%
    dm-2: ios=32721/33023, merge=0/0, ticks=2580952/479999, in_queue=3060959, util=100.00%, aggrios=32721/33023, aggrmerge=0/0, aggrticks=0/0, aggrin_queue=0, aggrutil=0.00%
    md127: ios=32721/33023, merge=0/0, ticks=0/0, in_queue=0, util=0.00%, aggrios=16360/32937, aggrmerge=0/87, aggrticks=1290283/255548, aggrin_queue=1545711, aggrutil=99.71%
  sda: ios=8101/32937, merge=1/88, ticks=402681/125603, in_queue=528232, util=96.21%
  sdb: ios=24619/32938, merge=0/87, ticks=2177886/385493, in_queue=2563190, util=99.71%

--d6Gm4EdcadzBjdND--
