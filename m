Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8Q1kEip018630
	for <linux-lvm@redhat.com>; Fri, 25 Sep 2009 21:46:14 -0400
Received: from smtp-out1.berkeley.edu (smtp-out1.Berkeley.EDU [128.32.61.106])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8Q1jtBe020460
	for <linux-lvm@redhat.com>; Fri, 25 Sep 2009 21:45:55 -0400
Received: from adsl-99-60-4-64.dsl.pltn13.sbcglobal.net ([99.60.4.64]
	helo=venus.gateway.2wire.net)
	by fe1.calmail with esmtpsa (TLSv1:AES128-SHA:128) (Exim 4.69)
	(auth plain:ashworth@berkeley.edu)
	(envelope-from <julie.ashworth@berkeley.edu>) id 1MrMMC-0001vM-4x
	for linux-lvm@redhat.com; Fri, 25 Sep 2009 18:45:55 -0700
Date: Fri, 25 Sep 2009 18:45:46 -0700
From: Julie Ashworth <julie.ashworth@berkeley.edu>
Subject: Re: [linux-lvm] missing physical volumes after upgrade to rhel 5.4
Message-ID: <20090926014546.GB4165@venus.gateway.2wire.net>
References: <20090924100622.GA3517@venus.neuro.bekeley.edu>
	<E80FDE2F181F4841BA5C9FFD38D5992C71F9@mrpostman.ahc.uk.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E80FDE2F181F4841BA5C9FFD38D5992C71F9@mrpostman.ahc.uk.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

hi Mark,
Thank you so much for the thorough test and 
response.

I created a test volume with a gpt disk label to 
stay consistent with how the failed volumes were 
labelled. 
The only difference between our experiences, that
I can tell, is that the pvcreate command failed
with an error similar to 'disk doesn't exist, or
is being filtered'. I believe its because of the 
gpt label. I zeroed out the first 512 bytes of 
the disk label, and continued with the commands
(similar to the commands you used):
dd if=/dev/zero of=/dev/sdk bs=512 count=1
pvcreate -u 5wJCEA-IDC1-5GhI-jnEs-EpYF-8Uf3-sqPL4O /dev/sdk
vgcfgrestore -f /etc/lvm/backup/jetstor642 jetstor642
vgchange -ay

I had no problems, and the volumes were 
recovered.  <much celebration>

Its possible that my setup is so non-standard,
that most people won't be affected (presumably
by the upgrade) as I was. Reasons my setup is
non-standard:
1) I used ext3 to format >12TB volumes (ext3 
has a 8TB limit).
2) I used parted and gpt disk labels 
3) I created PV on a whole disk. 
Luckily, my request for a test environment was 
approved (after this experience) so I can 
attempt to replicate the problem and identify
the cause of the disk label corruption.
Unfortunately, the environment will certainly
arrive too late (I do work at a uni ;P) for me 
to make a timely contribution.

Please let me know if I can provide any more
information.
And thanks again.
Best,
Julie



On 25-09-2009 10.52 +0100, Mark Round wrote:
> I just tried this myself....
> 
> 1. First create a new PV on a whole disk, VG and LV  
> # pvcreate /dev/sdc
> # vgcreate test /dev/sdc
> # lvcreate -L2G -n testlv test
> 
> 2. Format the LV, mount it and copy some data to it (just a random
> tarball)
> # mke2fs -j /dev/test/testlv
> # mount /dev/test/testlv /mnt
> # tar -C /mnt -xvzf ~/iscsitarget-0.4.17.tar.gz
> # umount /mnt
> # e2fsck /dev/test/testlv
> e2fsck 1.39 (29-May-2006)
> /dev/test/testlv: clean, 87/262144 files, 25554/524288 blocks
> 
> 3. So the LV is OK. Now I'll make sure there's a config backup, then
> wipe the PV label...
> # vgcfgbackup test
>   Volume group "test" successfully backed up.
> # vgchange -an test
>   0 logical volume(s) in volume group "test" now active
> [root@europa ~]# pvremove -ff /dev/sdc
> Really WIPE LABELS from physical volume "/dev/sdc" of volume group
> "test" [y/n]? y
>   WARNING: Wiping physical volume label from /dev/sdc of volume group
> "test"
>   Labels on physical volume "/dev/sdc" successfully wiped
> 
> 4. Now, I'll try to recreate the PV using the backup data, and see if
> the contents are intact.
> # pvcreate --uuid="A0LDgs-KMlm-QEBR-sGNW-7Rlf-j3aU-x2JUKY"
> --restorefile=/etc/lvm/backup/test /dev/sdc
>   Couldn't find device with uuid
> 'A0LDgs-KMlm-QEBR-sGNW-7Rlf-j3aU-x2JUKY'.
>   Physical volume "/dev/sdc" successfully created
> # vgcfgrestore -f /etc/lvm/backup/test test
>   Restored volume group test
> 
> 5. Check to see if we can see the previously created LV, and mount it
> # lvs
>   LV     VG         Attr   LSize  Origin Snap%  Move Log Copy%  Convert
>   testlv test       -wi---  2.00G
> # vgchange -ay test
>   1 logical volume(s) in volume group "test" now active
> # e2fsck /dev/test/testlv
> e2fsck 1.39 (29-May-2006)
> /dev/test/testlv: clean, 87/262144 files, 25554/524288 blocks
> #  mount /dev/test/testlv /mnt
> # ls /mnt
> iscsitarget-0.4.17  lost+found
> 
> So, YMMV but it appears from my experiments that this operation should
> be safe, and should recover your volumes. I am concerned though about
> the news that the RHEL 5.3->5.4 upgrade may have caused this, as we're
> looking at making the same upgrade before not too long. Do you have any
> suspicion as to why this may have happened ? Have you filed a bug with
> Red Hat ?
> 
> Regards,
> 
> -Mark
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Julie Ashworth
> Sent: 24 September 2009 11:06
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] missing physical volumes after upgrade to rhel 5.4
> 
> I apologize for the cross-posting (to rhelv5-list).
> The lvm list is a more relevant list for my problem, 
> and I'm sorry I didn't realize this sooner.
> 
> After an upgrade from rhel5.3 -> rhel5.4 (and reboot)
> I can no longer see PVs for 3 fibre-channel storage 
> devices.
> 
> The operating system still see the disk:
> ----------------------
> # multipath -l
> mpath2 (2001b4d28000064db) dm-1 JetStor,Volume Set # 00
> [size=12T][features=0][hwhandler=0][rw]
> \_ round-robin 0 [prio=0][active]
>  \_ 11:0:1:0 sdj 8:144 [active][undef]
> mpath16 (1ACNCorp_FF01000113200019) dm-2 ACNCorp,R_LogVol-despo
> [size=15T][features=0][hwhandler=0][rw]
> \_ round-robin 0 [prio=0][active]
>  \_ 11:0:2:0 sdk 8:160 [active][undef]
> mpath7 (32800001b4d00cf5b) dm-0 JetStor,Volume Set 416F
> [size=12T][features=0][hwhandler=0][rw]
> \_ round-robin 0 [prio=0][active]
>  \_ 11:0:0:0 sdi 8:128 [active][undef]
> ----------------------
> 
> 
> There are files in /etc/lvm/backup/ that contain the
> original volume information, e.g.
> ----------------------
> jetstor642 {
>         id = "0e53Q3-evHX-I5f9-CWqf-NPcw-IqmC-0fVcTO"
>         seqno = 2
>         status = ["RESIZEABLE", "READ", "WRITE"]
>         flags = []
>         extent_size = 8192              # 4 Megabytes
>         max_lv = 0
>         max_pv = 0
> 
>         physical_volumes {
> 
>                 pv0 {
>                         id = "5wJCEA-IDC1-5GhI-jnEs-EpYF-8Uf3-sqPL4O"
>                         device = "/dev/dm-7"    # Hint only
> 
>                         status = ["ALLOCATABLE"]
>                         flags = []
>                         dev_size = 31214845952  # 14.5355 Terabytes
>                         pe_start = 384
>                         pe_count = 3810405  # 14.5355 Terabytes
>                 }
>         }
> ----------------------
> 
> The devices were formatted using parted on the entire disk, 
> i.e.  I didn't create a partition.
> The partition table is "gpt" (possible label types are
> "bsd", "dvh", "gpt",  "loop", "mac", "msdos", "pc98"
> or "sun".)
> 
> 
> partition table information for one of the devices is below:
> --------------------------
> # parted /dev/sdi
> GNU Parted 1.8.1
> Using /dev/sdi
> Welcome to GNU Parted! Type 'help' to view a list of commands.
> (parted) print
> 
> Model: JetStor Volume Set 416F (scsi)
> Disk /dev/sdi: 13.0TB
> Sector size (logical/physical): 512B/512B
> Partition Table: gpt
> 
> Number  Start  End  Size  File system  Name  Flags
> --------------------------
> 
> output of some commands:
> 
> $ pvdisplay
> returns nothing (no error)
> 
> $ lvs -a -o +devices
> returns nothing (no error)
> 
> $ pvck -vvvvv /dev/sdb
> #lvmcmdline.c:915         Processing: pvck -vvvvv /dev/sdb
> #lvmcmdline.c:918         O_DIRECT will be used
> #config/config.c:950     Setting global/locking_type to 3
> #locking/locking.c:245       Cluster locking selected.
> #locking/cluster_locking.c:83   connect() failed on local socket:
> Connection
> +refused
> #config/config.c:955     locking/fallback_to_local_locking not found in
> +config: defaulting to 1
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
> #config/config.c:927     Setting global/locking_dir to /var/lock/lvm
> #pvck.c:32     Scanning /dev/sdb
> #device/dev-cache.c:260         /dev/sdb: Added to device cache
> #device/dev-io.c:439         Opened /dev/sdb RO
> #device/dev-io.c:260     /dev/sdb: size is 25395814912 sectors
> #device/dev-io.c:134         /dev/sdb: block size is 4096 bytes
> #filters/filter.c:124         /dev/sdb: Skipping: Partition table
> signature
> +found
> #device/dev-io.c:485         Closed /dev/sdb
> #metadata/metadata.c:2337   Device /dev/sdb not found (or ignored by
> filtering).
> -------------------------
> 
> from doing google searches, I found this gem to restore a
> PV:
> pvcreate --uuid "cqH4SD-VrCw-jMsN-GcwH-omCq-ThpE-dO9KmJ"
>                   --restorefile /etc/lvm/backup/vg_04 /dev/sdd1
> 
> 
> however, the man page says to 'use with care'. I don't want
> to lose data. Can anybody comment on how safe it would be to
> run this?
> 
> Thanks in advance,
> Julie Ashworth
> 
> 
> -- 
> Julie Ashworth <julie.ashworth@berkeley.edu>
> Computational Infrastructure for Research Labs, UC Berkeley 
> http://cirl.berkeley.edu/
> PGP Key ID: 0x17F013D2
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
---end quoted text---

-- 
Julie Ashworth <julie.ashworth@berkeley.edu>
Computational Infrastructure for Research Labs, UC Berkeley 
http://cirl.berkeley.edu/
PGP Key ID: 0x17F013D2
