Date: Wed, 23 May 2012 14:32:58 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <CAOAgVpz_b738-YwyUXMDMzjuzPYP_VV=YusaFjLVAUiMHvaOsA@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.1205231419310.4474@bmsred.bmsi.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
	<CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
	<4FBD1D47.204@redhat.com>
	<CAOAgVpz_b738-YwyUXMDMzjuzPYP_VV=YusaFjLVAUiMHvaOsA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fun and games with mirroring
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lvm@beer.org.uk

On May 23, Les Mikesell transmitted in part:

> I normally want my data on two disks all of the time (and have a large
> pile of failed drives waiting to be destroyed to back up the reasoning
> there...).  But I might tolerate only one fresh copy for the duration
> of testing a possible replacement OS/filesystem.  So in the 'break the
> mirror' case, the copy is already there, and in an instantly usable
> form if I want it back.
>
> The unfortunate part is that most linux distributions don't allow
> installation on a 'broken mirror' or have a way to convert from
> non-raid to raid after the install the way you can on a windows server
> - or if there is, I haven't found it.  So even if you like the new
> replacement that you tried on the single-disk install, you have to
> throw it away and re-install on raid in the end.

I do this all the time - but with MD raid.  Use custom install, and
create RAID1 MD devices in the install with only 1 leg.  You can add
mirrors later with mdadm.  I also have customers pull out a disk and
send it to me so I can quickly clone their system (while they continue
to operate) on new hardware.  I also routinely add an MD mirror on a new
drive to migrate a PV to new hardware.

It is only the LVM mirroring that isn't doing what you want.

My only complaint with the MD driver is that it doesn't divide up drives
into small partitions.  I often end up creating 2 or 3 partitions on a drive,
and mirroring each.  This allows later distributing them over drives of
unequal size.  E.g., you start out with 2x512G, then later add a 1T,
which you split into 2 partitions big enough to mirror your original
drives, thus doubling your mirrored space with 3 drives.  This kind
of thing would be automatic with a more complete feature set in LVM
mirroring.

It could make sense, however, to add such features to the MD driver,
and keep LVM focused on LVs (and snapshot pools and such) rather than
mirroring.  And that seems to be the way MD + LVM is going now.
