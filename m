Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CB12029F62
	for <linux-lvm@redhat.com>; Fri,  8 May 2020 16:10:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F6B91859160
	for <linux-lvm@redhat.com>; Fri,  8 May 2020 16:10:27 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24245.33901.720471.896495@quad.stoffel.home>
Date: Fri, 8 May 2020 12:10:21 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <a344c3a1-caff-796e-96c9-a2beb245e619@yandex.pl>
References: <b0e91faf-3a14-3ac9-3c31-6989154791c1@yandex.pl>
	<CAAMCDef6hKJsPw3738KJ0vEEwnVKB-QpTMJ6aSeybse-4h+y6Q@mail.gmail.com>
	<24244.30530.155404.154787@quad.stoffel.home>
	<adccabc0-529f-e0a9-538f-1e5b784269e4@yandex.pl>
	<24244.44462.151185.626440@quad.stoffel.home>
	<a344c3a1-caff-796e-96c9-a2beb245e619@yandex.pl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [general question] rare silent data corruption when
	writing data
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
To: Michal Soltys <msoltyspl@yandex.pl>
Cc: Linux RAID <linux-raid@vger.kernel.org>, Roger Heflin <rogerheflin@gmail.com>, dm-devel@redhat.com, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

>>>>> "Michal" == Michal Soltys <msoltyspl@yandex.pl> writes:

And of course it should also go to dm-devel@redhat.com, my fault for
not including that as well.  I strongly suspect it's an thin-lv
problem somewhere, but I don't know enough to help chase down the
problem in detail.

John


Michal> note: as suggested, I'm also CCing this to linux-lvm; the full
Michal> context with replies starts at:
Michal> https://www.spinics.net/lists/raid/msg64364.html There is also
Michal> the initial post at the bottom as well.

Michal> On 5/8/20 2:54 AM, John Stoffel wrote:
>>>>>>> "Michal" == Michal Soltys <msoltyspl@yandex.pl> writes:
>> 
Michal> On 20/05/07 23:01, John Stoffel wrote:
>>>>>>>>> "Roger" == Roger Heflin <rogerheflin@gmail.com> writes:
>>>> 
Roger> Have you tried the same file 2x and verified the corruption is in the
Roger> same places and looks the same?
>>>> 
>>>> Are these 1tb files VMDK or COW images of VMs?  How are these files
>>>> made.  And does it ever happen with *smaller* files?  What about if
>>>> you just use a sparse 2tb file and write blocks out past 1tb to see if
>>>> there's a problem?
>> 
Michal> The VMs are always directly on lvm volumes. (e.g.
Michal> /dev/mapper/vg0-gitlab). The guest (btrfs inside the guest) detected the
Michal> errors after we ran scrub on the filesystem.
>> 
Michal> Yes, the errors were also found on small files.
>> 
>> Those errors are in small files inside the VM, which is running btrfs
>> ontop of block storage provided by your thin-lv, right?
>> 

Michal> Yea, the small files were in this case on that thin-lv.

Michal> We also discovered (yesterday) file corruptions with VM hosting gitlab registry - this one was using the same thin-lv underneath, but the guest itself was using ext4 (in this case, docker simply reported incorrect sha checksum on (so far) 2 layers.

>> 
>> 
>> disks -> md raid5 -> pv -> vg -> lv-thin -> guest QCOW/LUN ->
>> filesystem -> corruption

Michal> Those particular guests, yea. The host case it's just w/o "guest" step.

Michal> But (so far) all corruption ended going via one of the lv-thin layers (and via one of md raids).

>> 
>> 
Michal> Since then we recreated the issue directly on the host, just
Michal> by making ext4 filesystem on some LV, then doing write with
Michal> checksum, sync, drop_caches, read and check checksum. The
Michal> errors are, as I mentioned - always a full 4KiB chunks (always
Michal> same content, always same position).
>> 
>> What position?  Is it a 4k, 1.5m or some other consistent offset?  And
>> how far into the file?  And this LV is a plain LV or a thin-lv?   I'm
>> running a debian box at home with RAID1 and I haven't seen this, but
>> I'm not nearly as careful as you.  Can you provide the output of:
>> 

Michal> What I meant that it doesn't "move" when verifying the same file (aka different reads from same test file). Between the tests, the errors are of course in different places - but it's always some 4KiB piece(s) - that look like correct pieces belonging somewhere else.

>> /sbin/lvs --version

Michal>   LVM version:     2.03.02(2) (2018-12-18)
Michal>   Library version: 1.02.155 (2018-12-18)
Michal>   Driver version:  4.41.0
Michal>   Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr --includedir=${prefix}/include --mandir=${prefix}/share/man --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu --libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run --disable-maintainer-mode --disable-dependency-tracking --exec-prefix= --bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin --with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 --with-cache=internal --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-default-locking-dir=/run/lock/lvm --with-thin=internal --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd --enable-dbus-service --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-dbus --enable-pkgconfig --enable-readline --enable-udev_rules --enable-udev_sync

>> 
>> too?
>> 
>> Can you post your:
>> 
>> /sbin/dmsetup status
>> 
>> output too?  There's a better command to use here, but I'm not an
>> export.  You might really want to copy this over to the
>> linux-lvm@redhat.com mailing list as well.

Michal> x22v0-tp_ssd-tpool: 0 2577285120 thin-pool 19 8886/552960 629535/838960 - rw no_discard_passdown queue_if_no_space - 1024 
Michal> x22v0-tp_ssd_tdata: 0 2147696640 linear 
Michal> x22v0-tp_ssd_tdata: 2147696640 429588480 linear 
Michal> x22v0-tp_ssd_tmeta_rimage_1: 0 4423680 linear 
Michal> x22v0-tp_ssd_tmeta: 0 4423680 raid raid1 2 AA 4423680/4423680 idle 0 0 -
Michal> x22v0-gerrit--new: 0 268615680 thin 255510528 268459007
Michal> x22v0-btrfsnopool: 0 134430720 linear 
Michal> x22v0-gitlab_root: 0 629145600 thin 628291584 629145599
Michal> x22v0-tp_ssd_tmeta_rimage_0: 0 4423680 linear 
Michal> x22v0-nexus_old_storage: 0 10737500160 thin 5130817536 10737500159
Michal> x22v0-gitlab_reg: 0 2147696640 thin 1070963712 2147696639
Michal> x22v0-nexus_old_root: 0 268615680 thin 257657856 268615679
Michal> x22v0-tp_big_tmeta_rimage_1: 0 8601600 linear 
Michal> x22v0-tp_ssd_tmeta_rmeta_1: 0 245760 linear 
Michal> x22v0-micron_vol: 0 268615680 linear 
Michal> x22v0-tp_big_tmeta_rimage_0: 0 8601600 linear 
Michal> x22v0-tp_ssd_tmeta_rmeta_0: 0 245760 linear 
Michal> x22v0-gerrit--root: 0 268615680 thin 103388160 268443647
Michal> x22v0-btrfs_ssd_linear: 0 268615680 linear 
Michal> x22v0-btrfstest: 0 268615680 thin 40734720 268615679
Michal> x22v0-tp_ssd: 0 2577285120 linear 
Michal> x22v0-tp_big: 0 22164602880 linear 
Michal> x22v0-nexus3_root: 0 167854080 thin 21860352 167854079
Michal> x22v0-nusknacker--staging: 0 268615680 thin 268182528 268615679
Michal> x22v0-tmob2: 0 1048657920 linear 
Michal> x22v0-tp_big-tpool: 0 22164602880 thin-pool 35 35152/1075200 3870070/7215040 - rw no_discard_passdown queue_if_no_space - 1024 
Michal> x22v0-tp_big_tdata: 0 4295147520 linear 
Michal> x22v0-tp_big_tdata: 4295147520 17869455360 linear 
Michal> x22v0-btrfs_ssd_test: 0 201523200 thin 191880192 201335807
Michal> x22v0-nussknacker2: 0 268615680 thin 58573824 268615679
Michal> x22v0-tmob1: 0 1048657920 linear 
Michal> x22v0-tp_big_tmeta: 0 8601600 raid raid1 2 AA 8601600/8601600 idle 0 0 -
Michal> x22v0-nussknacker1: 0 268615680 thin 74376192 268615679
Michal> x22v0-touk--elk4: 0 839024640 linear 
Michal> x22v0-gerrit--backup: 0 268615680 thin 228989952 268443647
Michal> x22v0-tp_big_tmeta_rmeta_1: 0 245760 linear 
Michal> x22v0-openvpn--new: 0 134430720 thin 24152064 66272255
Michal> x22v0-k8sdkr: 0 268615680 linear 
Michal> x22v0-nexus3_storage: 0 10737500160 thin 4976683008 10737500159
Michal> x22v0-rocket: 0 167854080 thin 163602432 167854079
Michal> x22v0-tp_big_tmeta_rmeta_0: 0 245760 linear 
Michal> x22v0-roger2: 0 134430720 thin 33014784 134430719
Michal> x22v0-gerrit--new--backup: 0 268615680 thin 6552576 268443647

Michal> Also lvs -a with segment ranges:
Michal>   LV                      VG    Attr       LSize    Pool   Origin      Data%  Meta%  Move Log Cpy%Sync Convert LE Ranges                                                
Michal>   btrfs_ssd_linear        x22v0 -wi-a----- <128.09g                                                            /dev/md125:19021-20113                                   
Michal>   btrfs_ssd_test          x22v0 Vwi-a-t---   96.09g tp_ssd             95.21                                                                                            
Michal>   btrfsnopool             x22v0 -wi-a-----   64.10g                                                            /dev/sdt2:35-581                                         
Michal>   btrfstest               x22v0 Vwi-a-t--- <128.09g tp_big             15.16                                                                                            
Michal>   gerrit-backup           x22v0 Vwi-aot--- <128.09g tp_big             85.25                                                                                            
Michal>   gerrit-new              x22v0 Vwi-a-t--- <128.09g tp_ssd             95.12                                                                                            
Michal>   gerrit-new-backup       x22v0 Vwi-a-t--- <128.09g tp_big             2.44                                                                                             
Michal>   gerrit-root             x22v0 Vwi-aot--- <128.09g tp_ssd             38.49                                                                                            
Michal>   gitlab_reg              x22v0 Vwi-a-t---    1.00t tp_big             49.87                                                                                            
Michal>   gitlab_reg_snapshot     x22v0 Vwi---t--k    1.00t tp_big gitlab_reg                                                                                                   
Michal>   gitlab_root             x22v0 Vwi-a-t---  300.00g tp_ssd             99.86                                                                                            
Michal>   gitlab_root_snapshot    x22v0 Vwi---t--k  300.00g tp_ssd gitlab_root                                                                                                  
Michal>   k8sdkr                  x22v0 -wi-a----- <128.09g                                                            /dev/md126:20891-21983                                   
Michal>   [lvol0_pmspare]         x22v0 ewi-------    4.10g                                                            /dev/sdt2:0-34                                           
Michal>   micron_vol              x22v0 -wi-a----- <128.09g                                                            /dev/sdt2:582-1674                                       
Michal>   nexus3_root             x22v0 Vwi-aot---  <80.04g tp_ssd             13.03                                                                                            
Michal>   nexus3_storage          x22v0 Vwi-aot---    5.00t tp_big             46.35                                                                                            
Michal>   nexus_old_root          x22v0 Vwi-a-t--- <128.09g tp_ssd             95.92                                                                                            
Michal>   nexus_old_storage       x22v0 Vwi-a-t---    5.00t tp_big             47.78                                                                                            
Michal>   nusknacker-staging      x22v0 Vwi-aot--- <128.09g tp_big             99.84                                                                                            
Michal>   nussknacker1            x22v0 Vwi-aot--- <128.09g tp_big             27.69                                                                                            
Michal>   nussknacker2            x22v0 Vwi-aot--- <128.09g tp_big             21.81                                                                                            
Michal>   openvpn-new             x22v0 Vwi-aot---   64.10g tp_big             17.97                                                                                            
Michal>   rocket                  x22v0 Vwi-aot---  <80.04g tp_ssd             97.47                                                                                            
Michal>   roger2                  x22v0 Vwi-a-t---   64.10g tp_ssd             24.56                                                                                            
Michal>   tmob1                   x22v0 -wi-a----- <500.04g                                                            /dev/md125:8739-13005                                    
Michal>   tmob2                   x22v0 -wi-a----- <500.04g                                                            /dev/md125:13006-17272                                   
Michal>   touk-elk4               x22v0 -wi-ao---- <400.08g                                                            /dev/md126:17477-20890                                   
Michal>   tp_big                  x22v0 twi-aot---   10.32t                    53.64  3.27                             [tp_big_tdata]:0-90187                                   
Michal>   [tp_big_tdata]          x22v0 Twi-ao----   10.32t                                                            /dev/md126:0-17476                                       
Michal>   [tp_big_tdata]          x22v0 Twi-ao----   10.32t                                                            /dev/md126:21984-94694                                   
Michal>   [tp_big_tmeta]          x22v0 ewi-aor---    4.10g                                           100.00           [tp_big_tmeta_rimage_0]:0-34,[tp_big_tmeta_rimage_1]:0-34
Michal>   [tp_big_tmeta_rimage_0] x22v0 iwi-aor---    4.10g                                                            /dev/sda3:30-64                                          
Michal>   [tp_big_tmeta_rimage_1] x22v0 iwi-aor---    4.10g                                                            /dev/sdb3:30-64                                          
Michal>   [tp_big_tmeta_rmeta_0]  x22v0 ewi-aor---  120.00m                                                            /dev/sda3:29-29                                          
Michal>   [tp_big_tmeta_rmeta_1]  x22v0 ewi-aor---  120.00m                                                            /dev/sdb3:29-29                                          
Michal>   tp_ssd                  x22v0 twi-aot---    1.20t                    75.04  1.61                             [tp_ssd_tdata]:0-10486                                   
Michal>   [tp_ssd_tdata]          x22v0 Twi-ao----    1.20t                                                            /dev/md125:0-8738                                        
Michal>   [tp_ssd_tdata]          x22v0 Twi-ao----    1.20t                                                            /dev/md125:17273-19020                                   
Michal>   [tp_ssd_tmeta]          x22v0 ewi-aor---   <2.11g                                           100.00           [tp_ssd_tmeta_rimage_0]:0-17,[tp_ssd_tmeta_rimage_1]:0-17
Michal>   [tp_ssd_tmeta_rimage_0] x22v0 iwi-aor---   <2.11g                                                            /dev/sda3:11-28                                          
Michal>   [tp_ssd_tmeta_rimage_1] x22v0 iwi-aor---   <2.11g                                                            /dev/sdb3:11-28                                          
Michal>   [tp_ssd_tmeta_rmeta_0]  x22v0 ewi-aor---  120.00m                                                            /dev/sda3:10-10                                          
Michal>   [tp_ssd_tmeta_rmeta_1]  x22v0 ewi-aor---  120.00m                                                            /dev/sdb3:10-10                                          


>> 
>>>> Are the LVs split across RAID5 PVs by any chance?
>> 
Michal> raid5s are used as PVs, but a single logical volume always uses one only
Michal> one physical volume underneath (if that's what you meant by split across).
>> 
>> Ok, that's what I was asking about.  It shouldn't matter... but just
>> trying to chase down the details.
>> 
>> 
>>>> It's not clear if you can replicate the problem without using
>>>> lvm-thin, but that's what I suspect you might be having problems with.
>> 
Michal> I'll be trying to do that, though the heavier tests will have to wait
Michal> until I move all VMs to other hosts (as that is/was our production machnie).
>> 
>> Sure, makes sense.
>> 
>>>> Can you give us the versions of the your tools, and exactly how you
>>>> setup your test cases?  How long does it take to find the problem?

Michal> Regarding this, currently:

Michal> kernel:  5.4.0-0.bpo.4-amd64 #1 SMP Debian 5.4.19-1~bpo10+1 (2020-03-09) x86_64 GNU/Linux (was also happening with 5.2.0-0.bpo.3-amd64)
Michal> LVM version:     2.03.02(2) (2018-12-18)
Michal> Library version: 1.02.155 (2018-12-18)
Michal> Driver version:  4.41.0
Michal> mdadm - v4.1 - 2018-10-01

>> 
Michal> Will get all the details tommorow (the host is on up to date debian
Michal> buster, the VMs are mix of archlinuxes and debians (and the issue
Michal> happened on both)).
>> 
Michal> As for how long, it's a hit and miss. Sometimes writing and reading back
Michal> ~16gb file fails (the cheksum read back differs from what was written)
Michal> after 2-3 tries. That's on the host.
>> 
Michal> On the guest, it's been (so far) a guaranteed thing when we were
Michal> creating very large tar file (900gb+). As for past two weeks we were
Michal> unable to create that file without errors even once.
>> 
>> Ouch!  That's not good.  Just to confirm, these corruptions are all in
>> a thin-lv based filesystem, right?   I'd be interested to know if you
>> can create another plain LV and cause the same error.  Trying to
>> simplify the potential problems.

Michal> I have been trying to - but so far didn't manage to replicate this with:

Michal> - a physical partition
Michal> - filesystem directly on a physical partition
Michal> - filesystem directly on mdraid
Michal> - filesystem directly on a linear volume

Michal> Note that this _doesn't_ imply that I _always_ get errors if lvm-thin is in use - as I also had lengthy period of attempts to cause corruption on some thin volume w/o any successes either. But the ones that failed had those in common (so far): md & lvm-thin - with 4 KiB piece(s) being incorrect

>> 
>> 
>>>> Can you compile the newst kernel and newest thin tools and try them
>>>> out?
>> 
Michal> I can, but a bit later (once we move VMs out of the host).
>> 
>>>> 
>>>> How long does it take to replicate the corruption?
>>>> 
>> 
Michal> When it happens, it's usually few tries tries of writing a 16gb file
Michal> with random patterns and reading it back (directly on host). The
Michal> irritating thing is that it can be somewhat hard to reproduce (e.g.
Michal> after machine's reboot).
>> 
>>>> Sorry for all the questions, but until there's a test case which is
>>>> repeatable, it's going to be hard to chase this down.
>>>> 
>>>> I wonder if running 'fio' tests would be something to try?
>>>> 
>>>> And also changing your RAID5 setup to use the default stride and
>>>> stripe widths, instead of the large values you're using.
>> 
Michal> The raid5 is using mdadm's defaults (which is 512 KiB these days for a
Michal> chunk). LVM on top is using much longer extents (as we don't really need
Michal> 4mb granularity) and the lvm-thin chunks were set to match (and align)
Michal> to raid's stripe.
>> 
>>>> 
>>>> Good luck!
>>>> 
Roger> I have not as of yet seen write corruption (except when a vendors disk
Roger> was resetting and it was lying about having written the data prior to
Roger> the crash, these were ssds, if your disk write cache is on and you
Roger> have a disk reset this can also happen), but have not seen "lost
Roger> writes" otherwise, but would expect the 2 read corruption I have seen
Roger> to also be able to cause write issues.  So for that look for scsi
Roger> notifications for disk resets that should not happen.
>>>> 
Roger> I have had a "bad" controller cause read corruptions, those
Roger> corruptions would move around, replacing the controller resolved it,
Roger> so there may be lack of error checking "inside" some paths in the
Roger> card.  Lucky I had a number of these controllers and had cold spares
Roger> for them.  The give away here was 2 separate buses with almost
Roger> identical load with 6 separate disks each and all12 disks on 2 buses
Roger> had between 47-52 scsi errors, which points to the only component
Roger> shared (the controller).
>>>> 
Roger> The backplane and cables are unlikely in general cause this, there is
Roger> too much error checking between the controller and the disk from what
Roger> I know.
>>>> 
Roger> I have had pre-pcie bus (PCI-X bus, 2 slots shared, both set to 133
Roger> cause random read corruptions, lowering speed to 100 fixed it), this
Roger> one was duplicated on multiple identical pieces of hw with all
Roger> different parts on the duplication machine.
>>>> 
Roger> I have also seen lost writes (from software) because someone did a
Roger> seek without doing a flush which in some versions of the libs loses
Roger> the unfilled block when the seek happens (this is noted in the man
Roger> page, and I saw it 20years ago, it is still noted in the man page, so
Roger> no idea if it was ever fixed).  So has more than one application been
Roger> noted to see the corruption?
>>>> 
Roger> So one question, have you seen the corruption in a path that would
Roger> rely on one controller, or all corruptions you have seen involving
Roger> more than one controller?  Isolate and test each controller if you
Roger> can, or if you can afford to replace it and see if it continues.
>>>> 
>>>> 
Roger> On Thu, May 7, 2020 at 12:33 PM Michal Soltys <msoltyspl@yandex.pl> wrote:
>>>>>> 
>>>>> Note: this is just general question - if anyone experienced something similar or could suggest how to pinpoint / verify the actual cause.
>>>>>> 
>>>>> Thanks to btrfs's checksumming we discovered somewhat (even if quite rare) nasty silent corruption going on on one of our hosts. Or perhaps "corruption" is not the correct word - the files simply have precise 4kb (1 page) of incorrect data. The incorrect pieces of data look on their own fine - as something that was previously in the place, or written from wrong source.
>>>>>> 
>>>>> The hardware is (can provide more detailed info of course):
>>>>>> 
>>>>> - Supermicro X9DR7-LN4F
>>>>> - onboard LSI SAS2308 controller (2 sff-8087 connectors, 1 connected to backplane)
>>>>> - 96 gb ram (ecc)
>>>>> - 24 disk backplane
>>>>>> 
>>>>> - 1 array connected directly to lsi controller (4 disks, mdraid5, internal bitmap, 512kb chunk)
>>>>> - 1 array on the backplane (4 disks, mdraid5, journaled)
>>>>> - journal for the above array is: mdraid1, 2 ssd disks (micron 5300 pro disks)
>>>>> - 1 btrfs raid1 boot array on motherboard's sata ports (older but still fine intel ssds from DC 3500 series)
>>>>>> 
>>>>> Raid 5 arrays are in lvm volume group, and the logical volumes are used by VMs. Some of the volumes are linear, some are using thin-pools (with metadata on the aforementioned intel ssds, in mirrored config). LVM
>>>>> uses large extent sizes (120m) and the chunk-size of thin-pools is set to 1.5m to match underlying raid stripe. Everything is cleanly aligned as well.
>>>>>> 
>>>>> With a doze of testing we managed to roughly rule out the following elements as being the cause:
>>>>>> 
>>>>> - qemu/kvm (issue occured directly on host)
>>>>> - backplane (issue occured on disks directly connected via LSI's 2nd connector)
>>>>> - cable (as a above, two different cables)
>>>>> - memory (unlikely - ECC for once, thoroughly tested, no errors ever reported via edac-util or memtest)
>>>>> - mdadm journaling (issue occured on plain mdraid configuration as well)
>>>>> - disks themselves (issue occured on two separate mdadm arrays)
>>>>> - filesystem (issue occured on both btrfs and ext4 (checksumed manually) )
>>>>>> 
>>>>> We did not manage to rule out (though somewhat _highly_ unlikely):
>>>>>> 
>>>>> - lvm thin (issue always - so far - occured on lvm thin pools)
>>>>> - mdraid (issue always - so far - on mdraid managed arrays)
>>>>> - kernel (tested with - in this case - debian's 5.2 and 5.4 kernels, happened with both - so it would imply rather already longstanding bug somewhere)
>>>>>> 
>>>>> And finally - so far - the issue never occured:
>>>>>> 
>>>>> - directly on a disk
>>>>> - directly on mdraid
>>>>> - on linear lvm volume on top of mdraid
>>>>>> 
>>>>> As far as the issue goes it's:
>>>>>> 
>>>>> - always a 4kb chunk that is incorrect - in a ~1 tb file it can be from a few to few dozens of such chunks
>>>>> - we also found (or rather btrfs scrub did) a few small damaged files as well
>>>>> - the chunks look like a correct piece of different or previous data
>>>>>> 
>>>>> The 4kb is well, weird ? Doesn't really matter any chunk/stripes sizes anywhere across the stack (lvm - 120m extents, 1.5m chunks on thin pools; mdraid - default 512kb chunks). It does nicely fit a page though ...
>>>>>> 
>>>>> Anyway, if anyone has any ideas or suggestions what could be happening (perhaps with this particular motherboard or vendor) or how to pinpoint the cause - I'll be grateful for any.
>>>> 
>> 
