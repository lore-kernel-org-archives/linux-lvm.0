Message-Id: <5CC6C0E8020000F900062DC8@prv1-mh.provo.novell.com>
Date: Mon, 29 Apr 2019 03:16:24 -0600
From: "Gang He" <ghe@suse.com>
References: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
	<9cd91b48-408b-f7a9-c4bc-df05d55376e6@redhat.com>
	<5CBFD6B1020000F90006183A@prv1-mh.provo.novell.com>
	<20190424150858.GA3218@redhat.com>
In-Reply-To: <20190424150858.GA3218@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvscan: /dev/sdc: open failed: No medium found
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
To: linux-lvm@redhat.com, teigland@redhat.com

Hello David,

Sorry for delayed reply.
the verbose log (lvm2-2.02.180) looks like,

#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-id/ata-TSSTcorp_DVDWBD_SH-B123L_R84A6GDC10003F - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-label/SLE-12-SP4-Server-DVD-x86_640456 - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-path/pci-0000:00:1f.2-ata-2 - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-uuid/2018-11-07-14-08-50-00 - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/dvd - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/dvdrw - new alias.
#cache/lvmetad.c:1420          Asking lvmetad for complete list of known PVs
#device/dev-io.c:609           Opened /dev/sda RO O_DIRECT
#device/dev-io.c:359         /dev/sda: size is 268435456 sectors
#device/dev-io.c:658           Closed /dev/sda
#filters/filter-partitioned.c:37            /dev/sda: Skipping: Partition table signature found
#filters/filter-type.c:27            /dev/cdrom: Skipping: Unrecognised LVM device type 11
#device/dev-io.c:609           Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:359         /dev/sda1: size is 4206592 sectors
#device/dev-io.c:658           Closed /dev/sda1
#filters/filter-mpath.c:196           /dev/sda1: Device is a partition, using primary device sda for mpath component detection
#device/dev-io.c:336         /dev/sda1: using cached size 4206592 sectors
#filters/filter-persistent.c:346           filter caching good /dev/sda1
#device/dev-io.c:609           Opened /dev/root RO O_DIRECT
#device/dev-io.c:359         /dev/root: size is 264226816 sectors
#device/dev-io.c:658           Closed /dev/root
#filters/filter-mpath.c:196           /dev/root: Device is a partition, using primary device sda for mpath component detection
#device/dev-io.c:336         /dev/root: using cached size 264226816 sectors
#filters/filter-persistent.c:346           filter caching good /dev/root
#device/dev-io.c:567     /dev/sdb: open failed: No medium found                    <<== here
#device/dev-io.c:343           <backtrace>
#filters/filter-usable.c:32            /dev/sdb: Skipping: dev_get_size failed
#toollib.c:4377          Processing PVs in VG #orphans_lvm2
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/P_orphans RB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans:aux WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans:aux
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans RB
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#metadata/metadata.c:3764        Reading VG #orphans_lvm2
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:70          Unlocking /run/lvm/lock/P_orphans
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#locking/locking.c:331           Dropping cache for #orphans.

Thanks
Gang 

>>> On 4/24/2019 at 11:08 pm, in message <20190424150858.GA3218@redhat.com>, David
Teigland <teigland@redhat.com> wrote:
> On Tue, Apr 23, 2019 at 09:23:29PM -0600, Gang He wrote:
>> Hello Peter and David,
>> 
>> Thank for your quick responses.
>> How do we handle this behavior further?
>> Fix it as an issue, filter this kind of disk silently. 
>> or keep the current error message printing, looking a bit unfriendly, but 
> the logic is not wrong.
> 
> Hi, 
> 
> I'd like to figure out what the old code was doing differently to avoid
> this.  Part of the problem is that I don't have a device that reports
> these same errors.  Could you send me the output of pvscan -vvvv so I can
> see which open is causing the error?
> Thanks
