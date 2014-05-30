Date: Fri, 30 May 2014 15:36:59 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530143659.GP1302@redhat.com>
References: <20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530142926.GA9219@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Snitzer <snitzer@redhat.com>
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 30, 2014 at 10:29:26AM -0400, Mike Snitzer wrote:
> sequential_threshold is only going to help the md5sum's IO get promoted
> (assuming you're having it read a large file).

Note the fio test runs on the virt.* files.  I'm using md5sum in an
attempt to pull those same files into the SSD.

> > Is there a way to print the current settings?
> > 
> > Could writethrough be enabled?  (I'm supposed to be using writeback).
> > How do I find out?
> 
> dmsetup status vg_guests-libvirt--images

Here's dmsetup status on various objects:

$ sudo dmsetup table
vg_guests-lv_cache_cdata: 0 419430400 linear 8:33 2099200
vg_guests-lv_cache_cmeta: 0 2097152 linear 8:33 2048
vg_guests-home: 0 209715200 linear 9:127 2048
vg_guests-libvirt--images: 0 1677721600 cache 253:1 253:0 253:2 128 0 default 0
vg_guests-libvirt--images_corig: 0 1677721600 linear 9:127 2055211008
$ sudo dmsetup status vg_guests-libvirt--images
0 1677721600 cache 8 10162/262144 128 39839/3276800 1087840 821795 116320 2057235 0 39835 0 1 writeback 2 migration_threshold 2048 mq 10 random_threshold 4 sequential_threshold 0 discard_promote_adjustment 1 read_promote_adjustment 0 write_promote_adjustment 0
$ sudo dmsetup status vg_guests-lv_cache_cdata
0 419430400 linear 
$ sudo dmsetup status vg_guests-lv_cache_cmeta
0 2097152 linear 
$ sudo dmsetup status vg_guests-libvirt--images_corig
0 1677721600 linear 

> But I'm really wondering if your IO is misaligned (like my earlier email
> brought up).  It _could_ be promoting 2 64K blocks from the origin for
> every 64K IO.

There's nothing obviously wrong ...

** For the SSD **

$ sudo fdisk -l /dev/sdc

Disk /dev/sdc: 232.9 GiB, 250059350016 bytes, 488397168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x3e302f2a

Device    Boot Start       End    Blocks  Id System
/dev/sdc1       2048 488397167 244197560  8e Linux LVM

The PV is placed directly on /dev/sdc1.

** For the HDD array **

$ sudo fdisk -l /dev/sd{a,b}

Disk /dev/sda: 1.8 TiB, 2000398934016 bytes, 3907029168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: B9545B67-681D-4729-A8A0-C75CB2EFFCB1

Device    Start          End   Size Type
/dev/sda1  2048   3907029134   1.8T Linux filesystem


Disk /dev/sdb: 1.8 TiB, 2000398934016 bytes, 3907029168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: EFA66BD1-E813-4826-88A2-F2BB3C2E093E

Device    Start          End   Size Type
/dev/sdb1  2048   3907029134   1.8T Linux filesystem

$ cat /proc/mdstat 
Personalities : [raid1] 
md127 : active raid1 sdb1[2] sda1[1]
      1953382272 blocks super 1.2 [2/2] [UU]
      
unused devices: <none>


The PV is placed on /dev/md127.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW
