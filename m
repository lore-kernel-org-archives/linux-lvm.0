Date: Fri, 30 May 2014 16:28:58 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530152858.GR1302@redhat.com>
References: <20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
	<20140530143659.GP1302@redhat.com>
	<20140530144453.GD9219@redhat.com>
	<20140530145152.GQ1302@redhat.com>
	<20140530145802.GA9373@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="cGfB/trNgB3WtPHu"
Content-Disposition: inline
In-Reply-To: <20140530145802.GA9373@redhat.com>
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
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I did in fact recreate the ext4 filesystem, because I didn't read your
email in time.

Here are the commands I used to create the whole lot:

----------------------------------------------------------------------
lvcreate -L 800G -n testorigin vg_guests @slow
mkfs -t ext4 /dev/vg_guests/testorigin
# at this point, I tested the speed of the uncached LV, see below
lvcreate -L 1G -n lv_cache_meta vg_guests @ssd
lvcreate -L 200G -n lv_cache vg_guests @ssd
lvconvert --type cache-pool --chunksize 32k --poolmetadata vg_guests/lv_cache_meta vg_guests/lv_cache
lvconvert --type cache --cachepool vg_guests/lv_cache vg_guests/testorigin
dmsetup message vg_guests-testorigin 0 sequential_threshold 0
dmsetup message vg_guests-testorigin 0 read_promote_adjustment 0
dmsetup message vg_guests-testorigin 0 write_promote_adjustment 0
# at this point, I tested the speed of the cached LV, see below
----------------------------------------------------------------------

To test the uncached LV, I ran the same fio test twice on the mounted
ext4 filesystem.  The results of the second run are in the first
attachment.

To test the cached LV, I ran these commands 3 times in a row:

md5sum virt.*
echo 3 > /proc/sys/vm/drop_caches

then I ran the fio test twice.  The results of the second run are
attached.

This time the LVM cache test is about 10% slower than the HDD test.
I'm not sure what to make of that at all.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-testorigin-hdd.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes

virt: (groupid=0, jobs=1): err= 0: pid=5346: Fri May 30 16:06:21 2014
  read : io=523520KB, bw=2910.4KB/s, iops=45, runt=179881msec
    slat (usec): min=21, max=307271, avg=162.28, stdev=4500.17
    clat (usec): min=4, max=1491.2K, avg=78284.57, stdev=119672.87
     lat (usec): min=362, max=1491.2K, avg=78447.46, stdev=119690.26
    clat percentiles (usec):
     |  1.00th=[  410],  5.00th=[ 5536], 10.00th=[ 7968], 20.00th=[12352],
     | 30.00th=[17280], 40.00th=[24448], 50.00th=[35072], 60.00th=[48896],
     | 70.00th=[74240], 80.00th=[116224], 90.00th=[195584], 95.00th=[288768],
     | 99.00th=[577536], 99.50th=[782336], 99.90th=[1187840], 99.95th=[1335296],
     | 99.99th=[1499136]
    bw (KB  /s): min=  228, max=14924, per=25.99%, avg=3025.00, stdev=1860.17
  write: io=525056KB, bw=2918.1KB/s, iops=45, runt=179881msec
    slat (usec): min=32, max=327239, avg=577.55, stdev=9388.69
    clat (usec): min=330, max=1294.2K, avg=8890.55, stdev=46138.42
     lat (usec): min=402, max=1294.3K, avg=9468.75, stdev=47132.58
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  370], 10.00th=[  430], 20.00th=[  450],
     | 30.00th=[  668], 40.00th=[  940], 50.00th=[ 1272], 60.00th=[ 1336],
     | 70.00th=[ 1560], 80.00th=[ 5600], 90.00th=[15424], 95.00th=[24192],
     | 99.00th=[144384], 99.50th=[228352], 99.90th=[741376], 99.95th=[872448],
     | 99.99th=[1286144]
    bw (KB  /s): min=  105, max=13660, per=25.98%, avg=3033.09, stdev=2056.10
    lat (usec) : 10=0.01%, 100=0.01%, 250=0.02%, 500=12.04%, 750=6.01%
    lat (usec) : 1000=3.24%
    lat (msec) : 2=16.93%, 4=2.02%, 10=9.87%, 20=13.46%, 50=15.23%
    lat (msec) : 100=8.54%, 250=9.04%, 500=2.72%, 750=0.54%, 1000=0.24%
    lat (msec) : 2000=0.09%
  cpu          : usr=0.14%, sys=0.59%, ctx=16625, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5347: Fri May 30 16:06:21 2014
  read : io=523520KB, bw=3348.3KB/s, iops=52, runt=156355msec
    slat (usec): min=25, max=242606, avg=177.64, stdev=4926.94
    clat (usec): min=5, max=1128.2K, avg=69030.33, stdev=92416.74
     lat (usec): min=357, max=1128.2K, avg=69208.61, stdev=92459.50
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[    9], 20.00th=[   14],
     | 30.00th=[   19], 40.00th=[   26], 50.00th=[   37], 60.00th=[   51],
     | 70.00th=[   71], 80.00th=[  105], 90.00th=[  172], 95.00th=[  241],
     | 99.00th=[  416], 99.50th=[  545], 99.90th=[  922], 99.95th=[ 1004],
     | 99.99th=[ 1123]
    bw (KB  /s): min=   63, max= 6876, per=29.66%, avg=3452.75, stdev=1274.21
  write: io=525056KB, bw=3358.2KB/s, iops=52, runt=156355msec
    slat (usec): min=37, max=335316, avg=588.63, stdev=10049.71
    clat (usec): min=326, max=1003.8K, avg=6620.20, stdev=43120.65
     lat (usec): min=413, max=1003.9K, avg=7209.47, stdev=44354.58
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  366], 10.00th=[  406], 20.00th=[  442],
     | 30.00th=[  620], 40.00th=[  756], 50.00th=[ 1176], 60.00th=[ 1272],
     | 70.00th=[ 1320], 80.00th=[ 1480], 90.00th=[ 2640], 95.00th=[15808],
     | 99.00th=[140288], 99.50th=[193536], 99.90th=[864256], 99.95th=[897024],
     | 99.99th=[1003520]
    bw (KB  /s): min=   72, max= 8762, per=29.71%, avg=3468.34, stdev=1603.79
    lat (usec) : 10=0.01%, 250=0.02%, 500=13.07%, 750=7.15%, 1000=3.34%
    lat (msec) : 2=21.17%, 4=1.43%, 10=7.20%, 20=10.63%, 50=14.55%
    lat (msec) : 100=10.03%, 250=9.04%, 500=1.93%, 750=0.23%, 1000=0.15%
    lat (msec) : 2000=0.04%
  cpu          : usr=0.16%, sys=0.68%, ctx=16915, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5348: Fri May 30 16:06:21 2014
  read : io=523520KB, bw=3268.2KB/s, iops=51, runt=160195msec
    slat (usec): min=26, max=338078, avg=259.14, stdev=6769.07
    clat (usec): min=4, max=903517, avg=70958.19, stdev=87737.74
     lat (usec): min=375, max=903571, avg=71217.97, stdev=87838.17
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    7], 10.00th=[   10], 20.00th=[   15],
     | 30.00th=[   21], 40.00th=[   29], 50.00th=[   40], 60.00th=[   55],
     | 70.00th=[   76], 80.00th=[  110], 90.00th=[  174], 95.00th=[  243],
     | 99.00th=[  429], 99.50th=[  506], 99.90th=[  725], 99.95th=[  816],
     | 99.99th=[  906]
    bw (KB  /s): min=  173, max= 7153, per=28.77%, avg=3349.59, stdev=1188.82
  write: io=525056KB, bw=3277.7KB/s, iops=51, runt=160195msec
    slat (usec): min=42, max=303703, avg=517.35, stdev=9112.62
    clat (usec): min=340, max=1461.5K, avg=6556.03, stdev=47381.54
     lat (usec): min=411, max=1461.6K, avg=7074.03, stdev=48289.76
    clat percentiles (usec):
     |  1.00th=[  362],  5.00th=[  370], 10.00th=[  398], 20.00th=[  446],
     | 30.00th=[  636], 40.00th=[  780], 50.00th=[ 1192], 60.00th=[ 1288],
     | 70.00th=[ 1336], 80.00th=[ 1496], 90.00th=[ 3600], 95.00th=[15680],
     | 99.00th=[138240], 99.50th=[201728], 99.90th=[733184], 99.95th=[856064],
     | 99.99th=[1466368]
    bw (KB  /s): min=  173, max= 9708, per=28.86%, avg=3369.21, stdev=1468.01
    lat (usec) : 10=0.01%, 100=0.01%, 250=0.03%, 500=12.98%, 750=6.61%
    lat (usec) : 1000=3.67%
    lat (msec) : 2=20.85%, 4=1.40%, 10=6.91%, 20=10.44%, 50=14.89%
    lat (msec) : 100=10.28%, 250=9.41%, 500=2.17%, 750=0.25%, 1000=0.07%
    lat (msec) : 2000=0.02%
  cpu          : usr=0.15%, sys=0.68%, ctx=16814, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5349: Fri May 30 16:06:21 2014
  read : io=523520KB, bw=2992.8KB/s, iops=46, runt=174928msec
    slat (usec): min=23, max=311675, avg=171.27, stdev=4974.27
    clat (usec): min=75, max=1114.8K, avg=76585.62, stdev=105112.42
     lat (usec): min=364, max=1114.9K, avg=76757.53, stdev=105149.80
    clat percentiles (usec):
     |  1.00th=[ 1704],  5.00th=[ 6240], 10.00th=[ 8768], 20.00th=[13376],
     | 30.00th=[19328], 40.00th=[27520], 50.00th=[39168], 60.00th=[54528],
     | 70.00th=[77312], 80.00th=[114176], 90.00th=[187392], 95.00th=[272384],
     | 99.00th=[518144], 99.50th=[675840], 99.90th=[913408], 99.95th=[995328],
     | 99.99th=[1122304]
    bw (KB  /s): min=  145, max= 9984, per=26.41%, avg=3074.43, stdev=1438.71
  write: io=525056KB, bw=3001.6KB/s, iops=46, runt=174928msec
    slat (usec): min=38, max=265589, avg=587.60, stdev=9637.20
    clat (usec): min=342, max=906290, avg=8148.18, stdev=44226.22
     lat (usec): min=406, max=906371, avg=8736.42, stdev=45334.93
    clat percentiles (usec):
     |  1.00th=[  358],  5.00th=[  366], 10.00th=[  422], 20.00th=[  446],
     | 30.00th=[  644], 40.00th=[  852], 50.00th=[ 1240], 60.00th=[ 1304],
     | 70.00th=[ 1416], 80.00th=[ 1960], 90.00th=[11200], 95.00th=[21888],
     | 99.00th=[146432], 99.50th=[216064], 99.90th=[815104], 99.95th=[856064],
     | 99.99th=[905216]
    bw (KB  /s): min=   74, max= 9472, per=26.38%, avg=3079.66, stdev=1727.46
    lat (usec) : 100=0.01%, 250=0.01%, 500=12.76%, 750=6.02%, 1000=3.50%
    lat (msec) : 2=18.48%, 4=1.65%, 10=8.47%, 20=11.68%, 50=14.81%
    lat (msec) : 100=10.03%, 250=9.42%, 500=2.51%, 750=0.41%, 1000=0.23%
    lat (msec) : 2000=0.02%
  cpu          : usr=0.12%, sys=0.63%, ctx=16535, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=11641KB/s, minb=2910KB/s, maxb=3348KB/s, mint=156355msec, maxt=179881msec
  WRITE: io=2051.0MB, aggrb=11675KB/s, minb=2918KB/s, maxb=3358KB/s, mint=156355msec, maxt=179881msec

Disk stats (read/write):
    dm-0: ios=32704/33128, merge=0/0, ticks=2371685/821383, in_queue=3193165, util=100.00%, aggrios=32720/33200, aggrmerge=0/0, aggrticks=0/0, aggrin_queue=0, aggrutil=0.00%
    md127: ios=32720/33200, merge=0/0, ticks=0/0, in_queue=0, util=0.00%, aggrios=16359/33122, aggrmerge=0/78, aggrticks=1185825/498678, aggrin_queue=1684398, aggrutil=99.75%
  sda: ios=8461/33122, merge=1/78, ticks=393799/195017, in_queue=588764, util=95.85%
  sdb: ios=24258/33122, merge=0/78, ticks=1977851/802340, in_queue=2780032, util=99.75%

--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="virt-ham0-testorigin-lvmcache.txt"

virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
...
virt: (g=0): rw=randrw, bs=64K-64K/64K-64K/64K-64K, ioengine=libaio, iodepth=4
fio-2.1.2
Starting 4 processes

virt: (groupid=0, jobs=1): err= 0: pid=5531: Fri May 30 16:25:54 2014
  read : io=523520KB, bw=2629.4KB/s, iops=41, runt=199130msec
    slat (usec): min=24, max=197634, avg=143.59, stdev=2991.82
    clat (usec): min=174, max=26698K, avg=67465.64, stdev=365815.35
     lat (usec): min=388, max=26698K, avg=67609.87, stdev=365817.53
    clat percentiles (usec):
     |  1.00th=[  398],  5.00th=[ 5600], 10.00th=[ 7968], 20.00th=[11584],
     | 30.00th=[15552], 40.00th=[21376], 50.00th=[29568], 60.00th=[41216],
     | 70.00th=[60160], 80.00th=[90624], 90.00th=[152576], 95.00th=[226304],
     | 99.00th=[440320], 99.50th=[544768], 99.90th=[880640], 99.95th=[1515520],
     | 99.99th=[16711680]
    bw (KB  /s): min=  320, max=13128, per=25.53%, avg=2685.01, stdev=1713.14
  write: io=525056KB, bw=2636.8KB/s, iops=41, runt=199130msec
    slat (usec): min=33, max=240957, avg=320.30, stdev=5617.33
    clat (usec): min=353, max=65433K, avg=29338.06, stdev=1020379.84
     lat (usec): min=437, max=65433K, avg=29659.01, stdev=1020395.97
    clat percentiles (usec):
     |  1.00th=[  370],  5.00th=[  378], 10.00th=[  398], 20.00th=[  454],
     | 30.00th=[  620], 40.00th=[  900], 50.00th=[ 1240], 60.00th=[ 1320],
     | 70.00th=[ 1608], 80.00th=[ 7584], 90.00th=[19584], 95.00th=[30848],
     | 99.00th=[103936], 99.50th=[175104], 99.90th=[815104], 99.95th=[3063808],
     | 99.99th=[16711680]
    bw (KB  /s): min=  114, max=13254, per=25.43%, avg=2681.93, stdev=1885.06
    lat (usec) : 250=0.01%, 500=13.29%, 750=5.71%, 1000=2.83%
    lat (msec) : 2=15.81%, 4=1.70%, 10=9.86%, 20=14.95%, 50=17.03%
    lat (msec) : 100=9.34%, 250=7.23%, 500=1.78%, 750=0.32%, 1000=0.05%
    lat (msec) : 2000=0.02%, >=2000=0.05%
  cpu          : usr=0.10%, sys=0.77%, ctx=16731, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5532: Fri May 30 16:25:54 2014
  read : io=523520KB, bw=3213.1KB/s, iops=50, runt=162892msec
    slat (usec): min=47, max=185115, avg=128.16, stdev=2376.71
    clat (usec): min=4, max=25770K, avg=59285.18, stdev=394418.17
     lat (usec): min=401, max=25770K, avg=59413.99, stdev=394421.00
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[    9], 20.00th=[   13],
     | 30.00th=[   17], 40.00th=[   22], 50.00th=[   30], 60.00th=[   41],
     | 70.00th=[   56], 80.00th=[   78], 90.00th=[  126], 95.00th=[  182],
     | 99.00th=[  347], 99.50th=[  420], 99.90th=[  578], 99.95th=[  635],
     | 99.99th=[16712]
    bw (KB  /s): min=  242, max= 6629, per=31.56%, avg=3318.74, stdev=1376.74
  write: io=525056KB, bw=3223.4KB/s, iops=50, runt=162892msec
    slat (usec): min=61, max=269043, avg=299.24, stdev=5817.49
    clat (usec): min=326, max=69958K, avg=19848.94, stdev=886022.82
     lat (usec): min=444, max=69959K, avg=20148.82, stdev=886040.88
    clat percentiles (usec):
     |  1.00th=[  366],  5.00th=[  374], 10.00th=[  390], 20.00th=[  446],
     | 30.00th=[  524], 40.00th=[  700], 50.00th=[ 1112], 60.00th=[ 1256],
     | 70.00th=[ 1304], 80.00th=[ 1448], 90.00th=[ 2024], 95.00th=[17024],
     | 99.00th=[64768], 99.50th=[115200], 99.90th=[346112], 99.95th=[3260416],
     | 99.99th=[16711680]
    bw (KB  /s): min=  121, max= 8796, per=31.72%, avg=3345.35, stdev=1578.99
    lat (usec) : 10=0.01%, 100=0.01%, 500=14.81%, 750=6.41%, 1000=3.04%
    lat (msec) : 2=21.03%, 4=1.18%, 10=7.43%, 20=12.62%, 50=16.28%
    lat (msec) : 100=9.69%, 250=6.25%, 500=1.08%, 750=0.12%, 1000=0.01%
    lat (msec) : >=2000=0.04%
  cpu          : usr=0.13%, sys=0.93%, ctx=17115, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5533: Fri May 30 16:25:54 2014
  read : io=523520KB, bw=2713.7KB/s, iops=42, runt=192920msec
    slat (usec): min=35, max=30712, avg=92.16, stdev=338.87
    clat (usec): min=315, max=63712K, avg=73273.62, stdev=983181.94
     lat (usec): min=401, max=63713K, avg=73366.42, stdev=983181.85
    clat percentiles (msec):
     |  1.00th=[    3],  5.00th=[    7], 10.00th=[    9], 20.00th=[   13],
     | 30.00th=[   18], 40.00th=[   24], 50.00th=[   32], 60.00th=[   42],
     | 70.00th=[   58], 80.00th=[   83], 90.00th=[  135], 95.00th=[  202],
     | 99.00th=[  383], 99.50th=[  482], 99.90th=[ 1401], 99.95th=[ 1483],
     | 99.99th=[16712]
    bw (KB  /s): min=  121, max= 9216, per=31.94%, avg=3358.56, stdev=1911.18
  write: io=525056KB, bw=2721.7KB/s, iops=42, runt=192920msec
    slat (usec): min=56, max=258524, avg=400.46, stdev=7012.38
    clat (usec): min=348, max=70388K, avg=20488.66, stdev=849098.66
     lat (usec): min=435, max=70389K, avg=20889.77, stdev=849131.29
    clat percentiles (usec):
     |  1.00th=[  366],  5.00th=[  374], 10.00th=[  394], 20.00th=[  450],
     | 30.00th=[  620], 40.00th=[  876], 50.00th=[ 1224], 60.00th=[ 1288],
     | 70.00th=[ 1464], 80.00th=[ 2960], 90.00th=[15808], 95.00th=[24960],
     | 99.00th=[87552], 99.50th=[218112], 99.90th=[888832], 99.95th=[1400832],
     | 99.99th=[16711680]
    bw (KB  /s): min=    2, max=10112, per=31.98%, avg=3372.91, stdev=2142.52
    lat (usec) : 500=12.87%, 750=5.95%, 1000=2.91%
    lat (msec) : 2=18.21%, 4=1.31%, 10=8.83%, 20=13.82%, 50=17.58%
    lat (msec) : 100=10.40%, 250=6.34%, 500=1.43%, 750=0.20%, 1000=0.04%
    lat (msec) : 2000=0.07%, >=2000=0.04%
  cpu          : usr=0.12%, sys=0.77%, ctx=16939, majf=0, minf=24
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0
virt: (groupid=0, jobs=1): err= 0: pid=5534: Fri May 30 16:25:54 2014
  read : io=523520KB, bw=2857.1KB/s, iops=44, runt=183181msec
    slat (usec): min=44, max=195215, avg=112.54, stdev=2157.49
    clat (usec): min=312, max=43560K, avg=74513.46, stdev=550534.41
     lat (usec): min=375, max=43560K, avg=74626.63, stdev=550535.28
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[    9], 20.00th=[   13],
     | 30.00th=[   18], 40.00th=[   25], 50.00th=[   35], 60.00th=[   48],
     | 70.00th=[   67], 80.00th=[   96], 90.00th=[  159], 95.00th=[  233],
     | 99.00th=[  441], 99.50th=[  545], 99.90th=[  979], 99.95th=[ 1205],
     | 99.99th=[16712]
    bw (KB  /s): min=  348, max= 7734, per=27.54%, avg=2895.85, stdev=1213.49
  write: io=525056KB, bw=2866.4KB/s, iops=44, runt=183181msec
    slat (usec): min=54, max=275450, avg=324.36, stdev=5740.29
    clat (usec): min=348, max=47249K, avg=14560.10, stdev=569838.75
     lat (usec): min=441, max=47249K, avg=14885.10, stdev=569878.87
    clat percentiles (usec):
     |  1.00th=[  366],  5.00th=[  374], 10.00th=[  394], 20.00th=[  450],
     | 30.00th=[  564], 40.00th=[  740], 50.00th=[ 1192], 60.00th=[ 1256],
     | 70.00th=[ 1336], 80.00th=[ 1576], 90.00th=[10432], 95.00th=[21888],
     | 99.00th=[99840], 99.50th=[166912], 99.90th=[528384], 99.95th=[692224],
     | 99.99th=[16711680]
    bw (KB  /s): min=  213, max= 7303, per=27.52%, avg=2901.91, stdev=1403.33
    lat (usec) : 500=14.29%, 750=6.23%, 1000=2.95%
    lat (msec) : 2=19.19%, 4=1.25%, 10=8.00%, 20=12.42%, 50=15.55%
    lat (msec) : 100=10.17%, 250=7.70%, 500=1.84%, 750=0.31%, 1000=0.04%
    lat (msec) : 2000=0.03%, >=2000=0.04%
  cpu          : usr=0.13%, sys=0.81%, ctx=16805, majf=0, minf=23
  IO depths    : 1=0.1%, 2=0.1%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8180/w=8204/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=2045.0MB, aggrb=10516KB/s, minb=2629KB/s, maxb=3213KB/s, mint=162892msec, maxt=199130msec
  WRITE: io=2051.0MB, aggrb=10546KB/s, minb=2636KB/s, maxb=3223KB/s, mint=162892msec, maxt=199130msec

Disk stats (read/write):
    dm-0: ios=65408/67846, merge=0/0, ticks=4160319/11781438, in_queue=15944596, util=100.00%, aggrios=21839/22771, aggrmerge=0/0, aggrticks=1288260/3918688, aggrin_queue=5206991, aggrutil=100.00%
    dm-1: ios=84/117, merge=0/0, ticks=120/182, in_queue=302, util=0.11%, aggrios=96/383, aggrmerge=0/62, aggrticks=124/431, aggrin_queue=555, aggrutil=0.22%
  sdc: ios=96/383, merge=0/62, ticks=124/431, in_queue=555, util=0.22%
  dm-2: ios=12/328, merge=0/0, ticks=3/268, in_queue=271, util=0.12%
    dm-5: ios=65421/67870, merge=0/0, ticks=3864659/11755615, in_queue=15620402, util=100.00%, aggrios=65421/67888, aggrmerge=0/0, aggrticks=0/0, aggrin_queue=0, aggrutil=0.00%
    md127: ios=65421/67888, merge=0/0, ticks=0/0, in_queue=0, util=0.00%, aggrios=16422/33219, aggrmerge=16286/34662, aggrticks=970890/852897, aggrin_queue=1823577, aggrutil=99.59%
  sda: ios=9379/33225, merge=9264/34659, ticks=406471/203345, in_queue=609659, util=96.99%
  sdb: ios=23466/33213, merge=23309/34666, ticks=1535310/1502449, in_queue=3037496, util=99.59%

--cGfB/trNgB3WtPHu--
