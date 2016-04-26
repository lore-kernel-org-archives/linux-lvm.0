Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QIFsZY001870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 14:15:54 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 613F97F080
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 18:15:53 +0000 (UTC)
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	u3QHcJ8n007972
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 10:38:22 -0700
Message-ID: <571FA78A.2020700@tlinx.org>
Date: Tue, 26 Apr 2016 10:38:18 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
In-Reply-To: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin Pool Performance
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


shankha wrote:
>  Hi,
>  Please allow me to describe our setup.
>
>  1) 8 SSDS with a raid5 on top of it. Let us call the raid device : 
dev_raid5
>  2) We create a Volume Group on dev_raid5
>  3) We create a thin pool occupying 100% of the volume group.
>
>  We performed some experiments.
>
>  Our random write operations dropped  by half and there was significant
>  reduction for
>  other operations(sequential read, sequential write, random reads) as
>  well compared to native raid5

----

    What is 'native raid 5', Do you mean using the kernel-software
driver for RAID5, or do you mean using a hardware RAID solution like an
LSI card that does the RAID checksumming and writes in background
(presuming you have 'Write-Back' enabled and have the RAID-card's RAM
battery-backed up).  To write the data stripe on 1 data-disk, RAID has
to read the data-disks of all the other data-disks in the array in order
to compute a "checksum" (often/usually XOR).  The only possible speed
benefits on RAID5 and RAID6 are in reading.  Writes will be slower than
RAID1.  Also, I presume the partitioning, disk-brand, and lvm layout on
disk is exactly the same for each disk(?), and assume these are
Enterprise grade drives (no 'Deskstars', for example, only 'Ultrastars'
if you go w/Hitachi.

    The reason for the latter is that desktop drives vary their
spin-rate by up to 15-20% (one might be spinning at 7800RPM, another at
6800RPM.  With enterprise grade drives, I've never seen a measurable
difference in spin speed.  Also, desktop drives are not guaranteed to to
already have some sectors remapped upon initial purchase.  In other
words, today's disks reserve some capacity for remapping tracks and
sectors.  If a read detects a fail and but can still recover using the
ECC recover data, then it can virtually move that sector (or track) to
a spare.  However, what *that* means is that the disk with the bad
sector or track has to seek to an "extra space section" on the hard disk
to fetch the data, then seek back to the original location "+1" to read
the next sector.

    That means the 1 drive will take noticeable longer to do the same
read (or write) as the rest.

    Most Software-based raid solutions, will accept alot of sloppiness
in diskspeed variation.  But as an example -- I once accidentally
received a dozen Hitachi deskstar (consumer line) drives instead of the
Enterprise-line, "Ultrastars".  My hardware RAID card (LSI) pretests
basic parameters of each disk inserted.  Only 2 out of 12 disks were
considered to "pass" the self check -- meaning 10/12 or over 80% will
show sub-optimal performance compared to Enterprise-grade drives.  So in
my case, I can't even use disks that are too far out of spec, compared
to the case of most software drivers that simply 'wait' for all the data
to arrive, which can kill performance even on reads.  I've been told
that many of the HW-RAID cards will know where each disk's head is --
not just by track, but also where in the track it is spinning.

    The optimal solution is, of course the most costly -- using a RAID10
solution, where out of 12 disks, you create 6 RAID1 mirrors, then stripe
those 6 mirrors as a RAID0.  However, I *feel* less safe, since if
I have RAID 6 I can lose 2 disks and still read+recover my data, but if
I lost 2 disks on RAID10, If they are the same RAID1-pair, then I'm
screwed.

    Lvm was designed as a *volume manager* -- it wasn't _designed_ to be
a RAID solution, **though it is increasingly becoming used as such**.
Downsides -- in a RAID5 or 6, You can stripe RAID5 sets as RAID50 and
RAID6 sets as RAID60, it is still the case that all of those I/O's need
to be done to compute the correct checksum.  At the kernel SW-driver
level, I am pretty sure its standard to compute multiple segments in
a RAID50 (i.e. one might have 4 drives setup as RAID5, then w/12 disks,
one can stripe those giving fairly fast READ performance) at the same
time using multiple-cores.  So if you have a 4-core machine
3 of those cores can be used to compute the XOR of the 3 segments of
your RAID5.  I have no idea if lvm is capable of using parallel kernel
threads for such, since there is more of lvm's code (I believe) in
"user-space".  Another consideration,  as you go to higher models of HW
raid cards, they often contain more processors on the RAID card.  My
last RAID card had 1 I/O processor, vs. my newer one has 2 I/O-CPU's on
the card, which can really help in write speeds.

    Also of significance is whether or not the HW RAID card has it's own
cache memory and whether or not it is battery backed-up.  If it is, then
it can be safe to do 'write-back' processing, where the data first goes
into the card's memory and is written back to disk later on (much faster
option), vs. if there is no battery backup or UPS, many LSI cards will
automatically switch over to "Write-through" -- where it writes the data
to disk and doesn't return to the user until the write-to-disk is
complete(slower but safer).

    So the fact that RAID5 under any circumstance would be slower in
writes is *normal*.  To optimize speed, one needs to make sure the disks
are same make+model and are "Enterprise grade" (I use 7200RPM SATA
drives -- don't need SAS for RAIDs).  You also need to make sure all
partitions, lvm-parameters and FS-parameters are the same for each --
don't even think of trying to put multiple data-disks of the same
meta-partition (combined at the lvm level) on the same disks.  That
should give horrible performance -- yuck.

    Sorry for the long post, but I think I'm buzzing w/too much
caffiene.  :-)
-linda
