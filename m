Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7P8Qvkd001372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 04:26:57 -0400
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B32144E4DF
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 08:26:53 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 4so57688519oih.2
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 01:26:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <mailman.27104.1472111213.3910.linux-lvm@redhat.com>
References: <mailman.27104.1472111213.3910.linux-lvm@redhat.com>
From: su liu <liusu8788@gmail.com>
Date: Thu, 25 Aug 2016 16:26:52 +0800
Message-ID: <CAN2gjWRb7VpD02gt3pDFCBQtii3yUEj_uYaDhANRzEmzSzRdUg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113d476af75e2f053ae12815
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 150, Issue 2
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
To: linux-lvm <linux-lvm@redhat.com>

--001a113d476af75e2f053ae12815
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks your replay explanation.

My use case is:

One admin node and some compute nodes, All the nodes shares a storage (eg.
FCSAN).
I create a vg on the shared storage=EF=BC=8C and the vg can be seen on all =
the
nodes.
The admin node's  responsibility is to manage the logical volume it
created, and the other compute node can attach these lvs to VM directly,
not through admin node.
Under the scene of LVM driver of OpenStack Cinder project, The lvm volumes
are attached to VMs through Cinder node via ISCSI. So I want to make sure
whether I can attach lvm volumes to VMs directly.

To achieve this goal, Should I use the method you mentiond before?

Thanks very much!



2016-08-25 15:46 GMT+08:00 <linux-lvm-request@redhat.com>:

> Send linux-lvm mailing list submissions to
>         linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>         linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
>         linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
>    1. sata cable disconnect + hotplug after (Xen)
>    2. Re: lvm2 raid volumes (Xen)
>    3. Re: Snapshots & data security (Zdenek Kabelac)
>    4. lvm2 cluster aware (su liu)
>    5. Re: lvm2 cluster aware (Digimer)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 09 Aug 2016 11:58:35 +0200
> From: Xen <list@xenhideout.nl>
> To: Linux lvm <linux-lvm@redhat.com>
> Subject: [linux-lvm] sata cable disconnect + hotplug after
> Message-ID: <16a575c3fb60f2579ab1687540cea01e@dds.nl>
> Content-Type: text/plain; charset=3DUS-ASCII; format=3Dflowed
>
> What am I supposed to do when a sata cable disconnects and reconnects as
> another device?
>
> I had a disk at probably /dev/sda.
>
> At a certain point the filesystem had become read-only. I realized the
> cable must have disconnected and after fixing it the same device was now
> at /dev/sdf.
>
> Now the device had gone missing from the system but it would not refind
> it.
>
> # pvscan
>    WARNING: Device for PV fEGbBn-tbIp-rL7y-m22b-1rQh-r9i5-Qwlqz7 not
> found or rejected by a filter.
>    PV unknown device                VG xenpc1          lvm2 [600,00 GiB /
> 158,51 GiB free]
>
> pvck clearly found it and lvmdiskscan also found it. Nothing happened
> until I did pvscan --cache /dev/sdf:
>
> # pvscan --cache /dev/sdf
> # vgscan
>    Reading all physical volumes.  This may take a while...
>    Duplicate of PV fEGbBn-tbIp-rL7y-m22b-1rQh-r9i5-Qwlqz7 dev /dev/sdf
> exists on unknown device 8:0
>    Found volume group "xenpc1" using metadata type lvm2
>
> Now I was able to activate it again and it was no longer flagged as
> partial (but now it is duplicate).
>
> The unknown device 8:0 is clearly going to be /dev/sda, which is no
> longer there.
>
> How can I dump this reference to 8:0 or should something else be done?
>
> Oh right.... pvscan --cache without a parameter....
>
> I wonder if I can run this while the thing is still activated....
>
> I was beginning to think there'd be some hidden filter rule, but it was
> "just" the cache.
>
> Should this thing be automatically resolved? Is running pvscan --cache
> enough?
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 15 Aug 2016 15:38:06 +0200
> From: Xen <list@xenhideout.nl>
> To: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] lvm2 raid volumes
> Message-ID: <e2f9476f73b7ab05cc1e7a21643ed29e@dds.nl>
> Content-Type: text/plain; charset=3DUS-ASCII; format=3Dflowed
>
> Heinz Mauelshagen schreef op 03-08-2016 15:10:
>
> > The Cyp%Sync field tells you about the resynchronization progress,
> > i.e. the initial mirroring of
> > all data blocks in a raid1/10 or the initial calculation and storing
> > of parity blocks in raid4/5/6.
>
> Heinz, can I perhaps ask you here. If I can.
>
> I have put a root volume on raid 1. Maybe "of course" the second disk
> (LVM volumes) are not available at system boot:
>
> aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Loading target
> version 1.7.0
> aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Failed to read
> superblock of device at position 1
> aug 15 14:09:19 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2
> mirrors
> aug 15 14:09:19 xenpc2 kernel: created bitmap (15 pages) for device mdX
> aug 15 14:09:19 xenpc2 kernel: mdX: bitmap initialized from disk: read 1
> pages, set 19642 of 30040 bits
> aug 15 14:09:19 xenpc2 kernel: EXT4-fs (dm-6): mounted filesystem with
> ordered data mode. Opts: (null)
>
>
> This could be because I am using PV directly on disk (no partition
> table) for *some* volumes (actually the first disk, that is booted
> from), however, I force a start of LVM2 service by enabling it in
> SystemD:
>
> aug 15 14:09:19 xenpc2 systemd[1]: Starting LVM2...
>
> This is further down the log, so LVM is actually started after the RAID
> is loading.
>
> At that point normally, from my experience, only the root LV is
> available.
>
> Then at a certain point more devices become available:
>
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/mapper/msata-boot.
> aug 15 14:09:22 xenpc2 systemd[1]: Started LVM2.
>
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/tmp.
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/swap.
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/var.
>
> But just before that happens, there are some more RAID1 errors:
>
> aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read
> superblock of device at position 1
> aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2
> mirrors
> aug 15 14:09:22 xenpc2 kernel: created bitmap (1 pages) for device mdX
> aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 1
> pages, set 320 of 480 bits
> aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read
> superblock of device at position 1
> aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2
> mirrors
> aug 15 14:09:22 xenpc2 kernel: created bitmap (15 pages) for device mdX
> aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 1
> pages, set 19642 of 30040 bits
>
> Well small wonder if the device isn't there yet. There are no messages
> for it, but I will assume the mirror LVs came online at the same time as
> the other "raid" volume group LVs, which means the RAID errors preceded
> that.
>
> Hence, no secondary mirror volumes available, cannot start the raid,
> right.
>
> However after logging in, the Cpy%Sync behaviour seems normal:
>
>    boot     msata  rwi-aor--- 240,00m
> 100,00
>    root     msata  rwi-aor---  14,67g
> 100,00
>
> Devices are shown as:
>
>    boot msata rwi-aor--- 240,00m
> 100,00           boot_rimage_0(0),boot_rimage_1(0)
>    root msata rwi-aor---  14,67g
> 100,00           root_rimage_0(0),root_rimage_1(0)
>
> dmsetup table seems normal:
>
> # dmsetup table | grep msata | sort
> coll-msata--lv: 0 60620800 linear 8:36 2048
> msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15 - -
> msata-boot_rimage_0: 0 491520 linear 8:16 4096
> msata-boot_rimage_1: 0 491520 linear 252:12 10240
> msata-boot_rimage_1-missing_0_0: 0 491520 error
> msata-boot_rmeta_0: 0 8192 linear 8:16 495616
> msata-boot_rmeta_1: 0 8192 linear 252:12 2048
> msata-boot_rmeta_1-missing_0_0: 0 8192 error
> msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -
> msata-root_rimage_0: 0 30760960 linear 8:16 512000
> msata-root_rimage_1: 0 30760960 linear 252:12 509952
> msata-root_rimage_1-missing_0_0: 0 30760960 error
> msata-root_rmeta_0: 0 8192 linear 8:16 503808
> msata-root_rmeta_1: 0 8192 linear 252:12 501760
> msata-root_rmeta_1-missing_0_0: 0 8192 error
>
> But actually it's not because it should reference 4 devices, not two.
> Apologies.
>
> It only references the volumes of the first disk (image and meta).
>
> E.g. 252:0 and 252:1 are:
>
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rmeta_0 ->
> ../dm-0
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rimage_0 ->
> ../dm-1
>
> Whereas the volumes from the other disk are:
>
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rmeta_1 ->
> ../dm-3
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rimage_1 ->
> ../dm-5
>
> If I dismount /boot, lvchange -an msata/boot, lvchange -ay msata/boot,
> it loads correctly:
>
> aug 15 14:56:23 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2
> mirrors
> aug 15 14:56:23 xenpc2 kernel: created bitmap (1 pages) for device mdX
> aug 15 14:56:23 xenpc2 kernel: mdX: bitmap initialized from disk: read 1
> pages, set 320 of 480 bits
> aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:23 xenpc2 kernel:  --- wd:1 rd:2
> aug 15 14:56:23 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:23 xenpc2 kernel:  disk 1, wo:1, o:1, dev:dm-19
> aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:23 xenpc2 kernel:  --- wd:1 rd:2
> aug 15 14:56:23 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:23 xenpc2 kernel:  disk 1, wo:1, o:1, dev:dm-19
> aug 15 14:56:23 xenpc2 kernel: md: recovery of RAID array mdX
> aug 15 14:56:23 xenpc2 kernel: md: minimum _guaranteed_  speed: 1000
> KB/sec/disk.
> aug 15 14:56:23 xenpc2 kernel: md: using maximum available idle IO
> bandwidth (but not more than 200000 KB/sec) for recovery.
> aug 15 14:56:23 xenpc2 kernel: md: using 128k window, over a total of
> 245760k.
> aug 15 14:56:23 xenpc2 systemd[1]: Starting File System Check on
> /dev/mapper/msata-boot...
> aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check Daemon to
> report status.
> aug 15 14:56:23 xenpc2 systemd-fsck[6938]: /dev/mapper/msata-boot:
> clean, 310/61440 files, 121269/245760 blocks
> aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check on
> /dev/mapper/msata-boot.
> aug 15 14:56:23 xenpc2 systemd[1]: Mounting /boot...
> aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounting ext2 file
> system using the ext4 subsystem
> aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounted filesystem
> without journal. Opts: (null)
> aug 15 14:56:23 xenpc2 systemd[1]: Mounted /boot.
> aug 15 14:56:26 xenpc2 kernel: md: mdX: recovery done.
> aug 15 14:56:26 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:26 xenpc2 kernel:  --- wd:2 rd:2
> aug 15 14:56:26 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:26 xenpc2 kernel:  disk 1, wo:0, o:1, dev:dm-19
>
>
>
> Maybe this whole thing is just caused by the first disk being
> partitionless.
>
> msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15
> 252:17 252:19
>
>
> I don't know how LVM is activated under SystemD. This is currently the
> initial startup:
>
>    dev-mapper-msata\x2droot.device (2.474s)
>    init.scope
>    -.mount
>    -.slice
>    swap.target
>    dm-event.socket
>    system.slice
>    lvm2-lvmpolld.socket
>    systemd-udevd-kernel.socket
>    systemd-initctl.socket
>    systemd-journald-audit.socket
>    lvm2-lvmetad.socket
>    systemd-journald.socket
>    systemd-modules-load.service (199ms)
>    dev-mqueue.mount (66ms)
>    ufw.service (69ms)
>    systemd-fsckd.socket
>    proc-sys-fs-binfmt_misc.automount
>    lvm2.service (3.237s)
>
> I have had to enable the SysV lvm2 service and replace vgchange -aay
> --sysinit with just vgchange -aay or it wouldn't work.
>
> lvmetad is started later, but without the manual lvm2 activation, my
> devices just wouldn't get loaded (on multiple systems, ie. when using a
> PV directly on disk to boot from).
>
> No one else boots directly from PV, so I may be the only one to ever
> have experienced this.
>
>
>
> But at this point, my mirrors don't work. They do work when not started
> as the main system. So If I boot from another disk, they work.
>
> At least I think they do.
>
>
> Basically all my LVM volumes are not loaded fast enough before the RAID
> is getting started.
>
> LVM itself gives no indication of error. lvchange --syncaction check
> msata/root does not produce any data. It seems it doesn't notice that
> the RAID hasn't been started.
>
> Again, there is zero output from commands such as lvs -a -o+lv_all and
> yet this is the output from dmsetup table:
>
> msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -
>
>
> So my first question is really: can I restore the RAID array while the
> system is running? E.g. while root is mounted?
>
> I haven't explored the initramfs yet to see why my LVM volumes are not
> getting loaded.
>
> Regards.
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 16 Aug 2016 11:44:23 +0200
> From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
> To: LVM general discussion and development <linux-lvm@redhat.com>,
>         stuart@gathman.org
> Subject: Re: [linux-lvm] Snapshots & data security
> Message-ID: <56821cec-70f8-086a-7e5b-6db8f0a9b780@gmail.com>
> Content-Type: text/plain; charset=3Dwindows-1252; format=3Dflowed
>
> Dne 27.7.2016 v 21:17 Stuart Gathman napsal(a):
> > On 07/19/2016 11:28 AM, Scott Sullivan wrote:
> >>
> >> Could someone please clarify if there is a legitimate reason to worry
> >> about data security of a old (removed) LVM snapshot?
> >>
> >> For example, when you lvremove a LVM snapshot, is it possible for data
> >> to be recovered if you create another LVM and it happens to go into
> >> the same area as the old snapshot we lvremoved?
> >>
> >> If this helps clarify, do we have to worry about security scrubbing a
> >> LVM snapshot for data security ?
> >>
> > Another idea: if your VG is on SSD, and properly aligned, then DISCARD
> > on the new LV will effectively zero it as far as any guest VMs are
> > concerned.  (The data is still on the flash until erased by the
> > firmware, of course.)  If VG and PE size do not align with the SSD eras=
e
> > block, then you can still zero the "edges" of the new LV, which is much
> > faster (and less wear on the SSD) than zeroing the whole thing.  You
> > could always read-verify that the data is actually all zero.
>
> Yes - as already suggested -  once you create a new LV -
> you can  'blkdicard /dev/vg/lv'
>
> Note - SSD may not always ensure blocks are zeroed - they could just
> move trimmed block into reuse list with undefined content.
>
> Anyway - lvm2 is not tool for data protection and it's upto system admin
> to ensure there are no data leaks.
>
> So pick the solution which fits best your needs - lvm2 provides all the
> tooling for it.
>
> Regards
>
> Zdenek
>
>
>
> ------------------------------
>
> Message: 4
> Date: Thu, 25 Aug 2016 09:50:24 +0800
> From: su liu <liusu8788@gmail.com>
> To: linux-lvm <linux-lvm@redhat.com>
> Subject: [linux-lvm] lvm2 cluster aware
> Message-ID:
>         <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@
> mail.gmail.com>
> Content-Type: text/plain; charset=3D"utf-8"
>
> I have a question about lvm2 cluster, The scene is that I try to imitate
> FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
> volume to  create a PV and VG.I stoped the lvmetad daemon on the compute
> nodes. Then I find that when I operating the VG on one compute node, the
> changes can also be aware on another compute nodes.
>
> But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html?
> says
> that "*LVM is not cluster aware".*
>
> My question is that can I use the method to achieve the case that I creat=
e
> or delete lv on one node whlie other compute node can using the lvs?
>
> Can anybody explain this?
>
> thx very much!
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <https://www.redhat.com/archives/linux-lvm/
> attachments/20160825/e6fb6630/attachment.html>
>
> ------------------------------
>
> Message: 5
> Date: Thu, 25 Aug 2016 03:37:08 -0400
> From: Digimer <lists@alteeve.ca>
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] lvm2 cluster aware
> Message-ID: <a0c7bedf-23d1-26c5-3853-0bd36f528185@alteeve.ca>
> Content-Type: text/plain; charset=3DUTF-8
>
> On 24/08/16 09:50 PM, su liu wrote:
> > I have a question about lvm2 cluster, The scene is that I try to imitat=
e
> > FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
> > volume to  create a PV and VG.I stoped the lvmetad daemon on the comput=
e
> > nodes. Then I find that when I operating the VG on one compute node, th=
e
> > changes can also be aware on another compute nodes.
> >
> > But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO
> > /sharinglvm1.html? says that "*LVM is not cluster aware".*
> >
> > My question is that can I use the method to achieve the case that I
> > create or delete lv on one node whlie other compute node can using the
> lvs?
> >
> > Can anybody explain this?
> >
> > thx very much!
>
> You can use DLM (distributed lock manager) to provide cluster locking to
> LVM (locking_type =3D 3 via clvmd). This requires a cluster though, which
> you can get with corosync + pacemaker (and use stonith!).
>
> Further details/advice requires more understanding of your environment
> and use-case. Feel free to pop over to Clusterlabs[1], as many of us do
> this setup regularly. I use clustered LVM in all our HA setups and have
> done so successfully for years.
>
> digimer
>
> 1. http://clusterlabs.org/mailman/listinfo/users - freenode #clusterlabs
>
> --
> Digimer
> Papers and Projects: https://alteeve.ca/w/
> What if the cure for cancer is trapped in the mind of a person without
> access to education?
>
>
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 150, Issue 2
> *****************************************
>

--001a113d476af75e2f053ae12815
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks your replay explanation.<div><br></div><div>My use =
case is:</div><div><br></div><div>One admin node and some compute nodes, Al=
l the nodes shares a storage (eg. FCSAN).</div><div>I create a vg on the sh=
ared storage=EF=BC=8C and the vg can be seen on all the nodes.</div><div>Th=
e admin node&#39;s =C2=A0responsibility is to manage the logical volume it =
created, and the other compute node can attach these lvs to VM directly, no=
t through admin node.</div><div>Under the scene of LVM driver of OpenStack =
Cinder project, The lvm volumes are attached to VMs through Cinder node via=
 ISCSI. So I want to make sure whether I can attach lvm volumes to VMs dire=
ctly.</div><div><br></div><div>To achieve this goal, Should I use the metho=
d you mentiond before?=C2=A0</div><div><br></div><div>Thanks very much!</di=
v><div><br></div><div><br></div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">2016-08-25 15:46 GMT+08:00  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:linux-lvm-request@redhat.com" target=3D"_blank">linux-lvm-req=
uest@redhat.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Send lin=
ux-lvm mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-lvm@redhat.com">linux-l=
vm@redhat.com</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.redhat.com/mailman/listi=
nfo/linux-lvm" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/=
<wbr>mailman/listinfo/linux-lvm</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-lvm-request@redhat.com"=
>linux-lvm-request@redhat.com</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-lvm-owner@redhat.com">l=
inux-lvm-owner@redhat.com</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of linux-lvm digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. sata cable disconnect + hotplug after (Xen)<br>
=C2=A0 =C2=A02. Re: lvm2 raid volumes (Xen)<br>
=C2=A0 =C2=A03. Re: Snapshots &amp; data security (Zdenek Kabelac)<br>
=C2=A0 =C2=A04. lvm2 cluster aware (su liu)<br>
=C2=A0 =C2=A05. Re: lvm2 cluster aware (Digimer)<br>
<br>
<br>
------------------------------<wbr>------------------------------<wbr>-----=
-----<br>
<br>
Message: 1<br>
Date: Tue, 09 Aug 2016 11:58:35 +0200<br>
From: Xen &lt;<a href=3D"mailto:list@xenhideout.nl">list@xenhideout.nl</a>&=
gt;<br>
To: Linux lvm &lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.=
com</a>&gt;<br>
Subject: [linux-lvm] sata cable disconnect + hotplug after<br>
Message-ID: &lt;<a href=3D"mailto:16a575c3fb60f2579ab1687540cea01e@dds.nl">=
16a575c3fb60f2579ab1687540cea<wbr>01e@dds.nl</a>&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII; format=3Dflowed<br>
<br>
What am I supposed to do when a sata cable disconnects and reconnects as<br=
>
another device?<br>
<br>
I had a disk at probably /dev/sda.<br>
<br>
At a certain point the filesystem had become read-only. I realized the<br>
cable must have disconnected and after fixing it the same device was now<br=
>
at /dev/sdf.<br>
<br>
Now the device had gone missing from the system but it would not refind<br>
it.<br>
<br>
# pvscan<br>
=C2=A0 =C2=A0WARNING: Device for PV fEGbBn-tbIp-rL7y-m22b-1rQh-<wbr>r9i5-Qw=
lqz7 not<br>
found or rejected by a filter.<br>
=C2=A0 =C2=A0PV unknown device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 VG xenpc1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvm2 [600,00 GiB /<b=
r>
158,51 GiB free]<br>
<br>
pvck clearly found it and lvmdiskscan also found it. Nothing happened<br>
until I did pvscan --cache /dev/sdf:<br>
<br>
# pvscan --cache /dev/sdf<br>
# vgscan<br>
=C2=A0 =C2=A0Reading all physical volumes.=C2=A0 This may take a while...<b=
r>
=C2=A0 =C2=A0Duplicate of PV fEGbBn-tbIp-rL7y-m22b-1rQh-<wbr>r9i5-Qwlqz7 de=
v /dev/sdf<br>
exists on unknown device 8:0<br>
=C2=A0 =C2=A0Found volume group &quot;xenpc1&quot; using metadata type lvm2=
<br>
<br>
Now I was able to activate it again and it was no longer flagged as<br>
partial (but now it is duplicate).<br>
<br>
The unknown device 8:0 is clearly going to be /dev/sda, which is no<br>
longer there.<br>
<br>
How can I dump this reference to 8:0 or should something else be done?<br>
<br>
Oh right.... pvscan --cache without a parameter....<br>
<br>
I wonder if I can run this while the thing is still activated....<br>
<br>
I was beginning to think there&#39;d be some hidden filter rule, but it was=
<br>
&quot;just&quot; the cache.<br>
<br>
Should this thing be automatically resolved? Is running pvscan --cache<br>
enough?<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Mon, 15 Aug 2016 15:38:06 +0200<br>
From: Xen &lt;<a href=3D"mailto:list@xenhideout.nl">list@xenhideout.nl</a>&=
gt;<br>
To: <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
Subject: Re: [linux-lvm] lvm2 raid volumes<br>
Message-ID: &lt;<a href=3D"mailto:e2f9476f73b7ab05cc1e7a21643ed29e@dds.nl">=
e2f9476f73b7ab05cc1e7a21643ed<wbr>29e@dds.nl</a>&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII; format=3Dflowed<br>
<br>
Heinz Mauelshagen schreef op 03-08-2016 15:10:<br>
<br>
&gt; The Cyp%Sync field tells you about the resynchronization progress,<br>
&gt; i.e. the initial mirroring of<br>
&gt; all data blocks in a raid1/10 or the initial calculation and storing<b=
r>
&gt; of parity blocks in raid4/5/6.<br>
<br>
Heinz, can I perhaps ask you here. If I can.<br>
<br>
I have put a root volume on raid 1. Maybe &quot;of course&quot; the second =
disk<br>
(LVM volumes) are not available at system boot:<br>
<br>
aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Loading target<br>
version 1.7.0<br>
aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Failed to read<br>
superblock of device at position 1<br>
aug 15 14:09:19 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2<br>
mirrors<br>
aug 15 14:09:19 xenpc2 kernel: created bitmap (15 pages) for device mdX<br>
aug 15 14:09:19 xenpc2 kernel: mdX: bitmap initialized from disk: read 1<br=
>
pages, set 19642 of 30040 bits<br>
aug 15 14:09:19 xenpc2 kernel: EXT4-fs (dm-6): mounted filesystem with<br>
ordered data mode. Opts: (null)<br>
<br>
<br>
This could be because I am using PV directly on disk (no partition<br>
table) for *some* volumes (actually the first disk, that is booted<br>
from), however, I force a start of LVM2 service by enabling it in<br>
SystemD:<br>
<br>
aug 15 14:09:19 xenpc2 systemd[1]: Starting LVM2...<br>
<br>
This is further down the log, so LVM is actually started after the RAID<br>
is loading.<br>
<br>
At that point normally, from my experience, only the root LV is<br>
available.<br>
<br>
Then at a certain point more devices become available:<br>
<br>
aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/mapper/msata-boot.<br>
aug 15 14:09:22 xenpc2 systemd[1]: Started LVM2.<br>
<br>
aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/tmp.<br>
aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/swap.<br>
aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/var.<br>
<br>
But just before that happens, there are some more RAID1 errors:<br>
<br>
aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read<br>
superblock of device at position 1<br>
aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2<br>
mirrors<br>
aug 15 14:09:22 xenpc2 kernel: created bitmap (1 pages) for device mdX<br>
aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 1<br=
>
pages, set 320 of 480 bits<br>
aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read<br>
superblock of device at position 1<br>
aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2<br>
mirrors<br>
aug 15 14:09:22 xenpc2 kernel: created bitmap (15 pages) for device mdX<br>
aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 1<br=
>
pages, set 19642 of 30040 bits<br>
<br>
Well small wonder if the device isn&#39;t there yet. There are no messages<=
br>
for it, but I will assume the mirror LVs came online at the same time as<br=
>
the other &quot;raid&quot; volume group LVs, which means the RAID errors pr=
eceded<br>
that.<br>
<br>
Hence, no secondary mirror volumes available, cannot start the raid,<br>
right.<br>
<br>
However after logging in, the Cpy%Sync behaviour seems normal:<br>
<br>
=C2=A0 =C2=A0boot=C2=A0 =C2=A0 =C2=A0msata=C2=A0 rwi-aor--- 240,00m<br>
100,00<br>
=C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0msata=C2=A0 rwi-aor---=C2=A0 14,67g<br=
>
100,00<br>
<br>
Devices are shown as:<br>
<br>
=C2=A0 =C2=A0boot msata rwi-aor--- 240,00m<br>
100,00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_rimage_0(0),boot_rimage=
_<wbr>1(0)<br>
=C2=A0 =C2=A0root msata rwi-aor---=C2=A0 14,67g<br>
100,00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root_rimage_0(0),root_rimage=
_<wbr>1(0)<br>
<br>
dmsetup table seems normal:<br>
<br>
# dmsetup table | grep msata | sort<br>
coll-msata--lv: 0 60620800 linear 8:36 2048<br>
msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15 - -<br=
>
msata-boot_rimage_0: 0 491520 linear 8:16 4096<br>
msata-boot_rimage_1: 0 491520 linear 252:12 10240<br>
msata-boot_rimage_1-missing_0_<wbr>0: 0 491520 error<br>
msata-boot_rmeta_0: 0 8192 linear 8:16 495616<br>
msata-boot_rmeta_1: 0 8192 linear 252:12 2048<br>
msata-boot_rmeta_1-missing_0_<wbr>0: 0 8192 error<br>
msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -<br=
>
msata-root_rimage_0: 0 30760960 linear 8:16 512000<br>
msata-root_rimage_1: 0 30760960 linear 252:12 509952<br>
msata-root_rimage_1-missing_0_<wbr>0: 0 30760960 error<br>
msata-root_rmeta_0: 0 8192 linear 8:16 503808<br>
msata-root_rmeta_1: 0 8192 linear 252:12 501760<br>
msata-root_rmeta_1-missing_0_<wbr>0: 0 8192 error<br>
<br>
But actually it&#39;s not because it should reference 4 devices, not two.<b=
r>
Apologies.<br>
<br>
It only references the volumes of the first disk (image and meta).<br>
<br>
E.g. 252:0 and 252:1 are:<br>
<br>
lrwxrwxrwx 1 root root=C2=A0 =C2=A0 =C2=A0 =C2=A07 aug 15 14:09 msata-root_=
rmeta_0 -&gt;<br>
../dm-0<br>
lrwxrwxrwx 1 root root=C2=A0 =C2=A0 =C2=A0 =C2=A07 aug 15 14:09 msata-root_=
rimage_0 -&gt;<br>
../dm-1<br>
<br>
Whereas the volumes from the other disk are:<br>
<br>
lrwxrwxrwx 1 root root=C2=A0 =C2=A0 =C2=A0 =C2=A07 aug 15 14:09 msata-root_=
rmeta_1 -&gt;<br>
../dm-3<br>
lrwxrwxrwx 1 root root=C2=A0 =C2=A0 =C2=A0 =C2=A07 aug 15 14:09 msata-root_=
rimage_1 -&gt;<br>
../dm-5<br>
<br>
If I dismount /boot, lvchange -an msata/boot, lvchange -ay msata/boot,<br>
it loads correctly:<br>
<br>
aug 15 14:56:23 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2<br>
mirrors<br>
aug 15 14:56:23 xenpc2 kernel: created bitmap (1 pages) for device mdX<br>
aug 15 14:56:23 xenpc2 kernel: mdX: bitmap initialized from disk: read 1<br=
>
pages, set 320 of 480 bits<br>
aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 --- wd:1 rd:2<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 disk 0, wo:0, o:1, dev:dm-15<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 disk 1, wo:1, o:1, dev:dm-19<br>
aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 --- wd:1 rd:2<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 disk 0, wo:0, o:1, dev:dm-15<br>
aug 15 14:56:23 xenpc2 kernel:=C2=A0 disk 1, wo:1, o:1, dev:dm-19<br>
aug 15 14:56:23 xenpc2 kernel: md: recovery of RAID array mdX<br>
aug 15 14:56:23 xenpc2 kernel: md: minimum _guaranteed_=C2=A0 speed: 1000<b=
r>
KB/sec/disk.<br>
aug 15 14:56:23 xenpc2 kernel: md: using maximum available idle IO<br>
bandwidth (but not more than 200000 KB/sec) for recovery.<br>
aug 15 14:56:23 xenpc2 kernel: md: using 128k window, over a total of<br>
245760k.<br>
aug 15 14:56:23 xenpc2 systemd[1]: Starting File System Check on<br>
/dev/mapper/msata-boot...<br>
aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check Daemon to<br>
report status.<br>
aug 15 14:56:23 xenpc2 systemd-fsck[6938]: /dev/mapper/msata-boot:<br>
clean, 310/61440 files, 121269/245760 blocks<br>
aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check on<br>
/dev/mapper/msata-boot.<br>
aug 15 14:56:23 xenpc2 systemd[1]: Mounting /boot...<br>
aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounting ext2 file<br>
system using the ext4 subsystem<br>
aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounted filesystem<br>
without journal. Opts: (null)<br>
aug 15 14:56:23 xenpc2 systemd[1]: Mounted /boot.<br>
aug 15 14:56:26 xenpc2 kernel: md: mdX: recovery done.<br>
aug 15 14:56:26 xenpc2 kernel: RAID1 conf printout:<br>
aug 15 14:56:26 xenpc2 kernel:=C2=A0 --- wd:2 rd:2<br>
aug 15 14:56:26 xenpc2 kernel:=C2=A0 disk 0, wo:0, o:1, dev:dm-15<br>
aug 15 14:56:26 xenpc2 kernel:=C2=A0 disk 1, wo:0, o:1, dev:dm-19<br>
<br>
<br>
<br>
Maybe this whole thing is just caused by the first disk being<br>
partitionless.<br>
<br>
msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15<br>
252:17 252:19<br>
<br>
<br>
I don&#39;t know how LVM is activated under SystemD. This is currently the<=
br>
initial startup:<br>
<br>
=C2=A0 =C2=A0dev-mapper-msata\x2droot.<wbr>device (2.474s)<br>
=C2=A0 =C2=A0init.scope<br>
=C2=A0 =C2=A0-.mount<br>
=C2=A0 =C2=A0-.slice<br>
=C2=A0 =C2=A0swap.target<br>
=C2=A0 =C2=A0dm-event.socket<br>
=C2=A0 =C2=A0system.slice<br>
=C2=A0 =C2=A0lvm2-lvmpolld.socket<br>
=C2=A0 =C2=A0systemd-udevd-kernel.socket<br>
=C2=A0 =C2=A0systemd-initctl.socket<br>
=C2=A0 =C2=A0systemd-journald-audit.socket<br>
=C2=A0 =C2=A0lvm2-lvmetad.socket<br>
=C2=A0 =C2=A0systemd-journald.socket<br>
=C2=A0 =C2=A0systemd-modules-load.service (199ms)<br>
=C2=A0 =C2=A0dev-mqueue.mount (66ms)<br>
=C2=A0 =C2=A0ufw.service (69ms)<br>
=C2=A0 =C2=A0systemd-fsckd.socket<br>
=C2=A0 =C2=A0proc-sys-fs-binfmt_misc.<wbr>automount<br>
=C2=A0 =C2=A0lvm2.service (3.237s)<br>
<br>
I have had to enable the SysV lvm2 service and replace vgchange -aay<br>
--sysinit with just vgchange -aay or it wouldn&#39;t work.<br>
<br>
lvmetad is started later, but without the manual lvm2 activation, my<br>
devices just wouldn&#39;t get loaded (on multiple systems, ie. when using a=
<br>
PV directly on disk to boot from).<br>
<br>
No one else boots directly from PV, so I may be the only one to ever<br>
have experienced this.<br>
<br>
<br>
<br>
But at this point, my mirrors don&#39;t work. They do work when not started=
<br>
as the main system. So If I boot from another disk, they work.<br>
<br>
At least I think they do.<br>
<br>
<br>
Basically all my LVM volumes are not loaded fast enough before the RAID<br>
is getting started.<br>
<br>
LVM itself gives no indication of error. lvchange --syncaction check<br>
msata/root does not produce any data. It seems it doesn&#39;t notice that<b=
r>
the RAID hasn&#39;t been started.<br>
<br>
Again, there is zero output from commands such as lvs -a -o+lv_all and<br>
yet this is the output from dmsetup table:<br>
<br>
msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -<br=
>
<br>
<br>
So my first question is really: can I restore the RAID array while the<br>
system is running? E.g. while root is mounted?<br>
<br>
I haven&#39;t explored the initramfs yet to see why my LVM volumes are not<=
br>
getting loaded.<br>
<br>
Regards.<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Tue, 16 Aug 2016 11:44:23 +0200<br>
From: Zdenek Kabelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com">zdenek=
.kabelac@gmail.com</a>&gt;<br>
To: LVM general discussion and development &lt;<a href=3D"mailto:linux-lvm@=
redhat.com">linux-lvm@redhat.com</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:stuart@gathman.org">stuart@ga=
thman.org</a><br>
Subject: Re: [linux-lvm] Snapshots &amp; data security<br>
Message-ID: &lt;<a href=3D"mailto:56821cec-70f8-086a-7e5b-6db8f0a9b780@gmai=
l.com">56821cec-70f8-086a-7e5b-<wbr>6db8f0a9b780@gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3Dwindows-1252; format=3Dflowed<br>
<br>
Dne 27.7.2016 v 21:17 Stuart Gathman napsal(a):<br>
&gt; On 07/19/2016 11:28 AM, Scott Sullivan wrote:<br>
&gt;&gt;<br>
&gt;&gt; Could someone please clarify if there is a legitimate reason to wo=
rry<br>
&gt;&gt; about data security of a old (removed) LVM snapshot?<br>
&gt;&gt;<br>
&gt;&gt; For example, when you lvremove a LVM snapshot, is it possible for =
data<br>
&gt;&gt; to be recovered if you create another LVM and it happens to go int=
o<br>
&gt;&gt; the same area as the old snapshot we lvremoved?<br>
&gt;&gt;<br>
&gt;&gt; If this helps clarify, do we have to worry about security scrubbin=
g a<br>
&gt;&gt; LVM snapshot for data security ?<br>
&gt;&gt;<br>
&gt; Another idea: if your VG is on SSD, and properly aligned, then DISCARD=
<br>
&gt; on the new LV will effectively zero it as far as any guest VMs are<br>
&gt; concerned.=C2=A0 (The data is still on the flash until erased by the<b=
r>
&gt; firmware, of course.)=C2=A0 If VG and PE size do not align with the SS=
D erase<br>
&gt; block, then you can still zero the &quot;edges&quot; of the new LV, wh=
ich is much<br>
&gt; faster (and less wear on the SSD) than zeroing the whole thing.=C2=A0 =
You<br>
&gt; could always read-verify that the data is actually all zero.<br>
<br>
Yes - as already suggested -=C2=A0 once you create a new LV -<br>
you can=C2=A0 &#39;blkdicard /dev/vg/lv&#39;<br>
<br>
Note - SSD may not always ensure blocks are zeroed - they could just<br>
move trimmed block into reuse list with undefined content.<br>
<br>
Anyway - lvm2 is not tool for data protection and it&#39;s upto system admi=
n<br>
to ensure there are no data leaks.<br>
<br>
So pick the solution which fits best your needs - lvm2 provides all the<br>
tooling for it.<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Thu, 25 Aug 2016 09:50:24 +0800<br>
From: su liu &lt;<a href=3D"mailto:liusu8788@gmail.com">liusu8788@gmail.com=
</a>&gt;<br>
To: linux-lvm &lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.=
com</a>&gt;<br>
Subject: [linux-lvm] lvm2 cluster aware<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CAN2gjWSEzL%2BM45UGFEkEA_=
i5bgNpKLXTQ%2BDAMPJjJJvBBvaTKQ@mail.gmail.com">CAN2gjWSEzL+M45UGFEkEA_<wbr>=
i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@<wbr>mail.gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
I have a question about lvm2 cluster, The scene is that I try to imitate<br=
>
FCSAN by mapping a rbd volume to two compute node, Then I using the rbd<br>
volume to=C2=A0 create a PV and VG.I stoped the lvmetad daemon on the compu=
te<br>
nodes. Then I find that when I operating the VG on one compute node, the<br=
>
changes can also be aware on another compute nodes.<br>
<br>
But this docment(<a href=3D"http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1=
.html" rel=3D"noreferrer" target=3D"_blank">http://www.tldp.org/<wbr>HOWTO/=
LVM-HOWTO/sharinglvm1.<wbr>html</a>? says<br>
that &quot;*LVM is not cluster aware&quot;.*<br>
<br>
My question is that can I use the method to achieve the case that I create<=
br>
or delete lv on one node whlie other compute node can using the lvs?<br>
<br>
Can anybody explain this?<br>
<br>
thx very much!<br>
-------------- next part --------------<br>
An HTML attachment was scrubbed...<br>
URL: &lt;<a href=3D"https://www.redhat.com/archives/linux-lvm/attachments/2=
0160825/e6fb6630/attachment.html" rel=3D"noreferrer" target=3D"_blank">http=
s://www.redhat.com/<wbr>archives/linux-lvm/<wbr>attachments/20160825/e6fb66=
30/<wbr>attachment.html</a>&gt;<br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Thu, 25 Aug 2016 03:37:08 -0400<br>
From: Digimer &lt;<a href=3D"mailto:lists@alteeve.ca">lists@alteeve.ca</a>&=
gt;<br>
To: LVM general discussion and development &lt;<a href=3D"mailto:linux-lvm@=
redhat.com">linux-lvm@redhat.com</a>&gt;<br>
Subject: Re: [linux-lvm] lvm2 cluster aware<br>
Message-ID: &lt;<a href=3D"mailto:a0c7bedf-23d1-26c5-3853-0bd36f528185@alte=
eve.ca">a0c7bedf-23d1-26c5-3853-<wbr>0bd36f528185@alteeve.ca</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
On 24/08/16 09:50 PM, su liu wrote:<br>
&gt; I have a question about lvm2 cluster, The scene is that I try to imita=
te<br>
&gt; FCSAN by mapping a rbd volume to two compute node, Then I using the rb=
d<br>
&gt; volume to=C2=A0 create a PV and VG.I stoped the lvmetad daemon on the =
compute<br>
&gt; nodes. Then I find that when I operating the VG on one compute node, t=
he<br>
&gt; changes can also be aware on another compute nodes.<br>
&gt;<br>
&gt; But this docment(<a href=3D"http://www.tldp.org/HOWTO/LVM-HOWTO" rel=
=3D"noreferrer" target=3D"_blank">http://www.tldp.org/<wbr>HOWTO/LVM-HOWTO<=
/a><br>
&gt; /sharinglvm1.html? says that &quot;*LVM is not cluster aware&quot;.*<b=
r>
&gt;<br>
&gt; My question is that can I use the method to achieve the case that I<br=
>
&gt; create or delete lv on one node whlie other compute node can using the=
 lvs?<br>
&gt;<br>
&gt; Can anybody explain this?<br>
&gt;<br>
&gt; thx very much!<br>
<br>
You can use DLM (distributed lock manager) to provide cluster locking to<br=
>
LVM (locking_type =3D 3 via clvmd). This requires a cluster though, which<b=
r>
you can get with corosync + pacemaker (and use stonith!).<br>
<br>
Further details/advice requires more understanding of your environment<br>
and use-case. Feel free to pop over to Clusterlabs[1], as many of us do<br>
this setup regularly. I use clustered LVM in all our HA setups and have<br>
done so successfully for years.<br>
<br>
digimer<br>
<br>
1. <a href=3D"http://clusterlabs.org/mailman/listinfo/users" rel=3D"norefer=
rer" target=3D"_blank">http://clusterlabs.org/<wbr>mailman/listinfo/users</=
a> - freenode #clusterlabs<br>
<br>
--<br>
Digimer<br>
Papers and Projects: <a href=3D"https://alteeve.ca/w/" rel=3D"noreferrer" t=
arget=3D"_blank">https://alteeve.ca/w/</a><br>
What if the cure for cancer is trapped in the mind of a person without<br>
access to education?<br>
<br>
<br>
<br>
------------------------------<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/<wbr>mailman/listinfo/linux-=
lvm</a><br>
<br>
End of linux-lvm Digest, Vol 150, Issue 2<br>
******************************<wbr>***********<br>
</blockquote></div><br></div>

--001a113d476af75e2f053ae12815--
