Date: Wed, 25 Jan 2017 09:38:25 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20170125143825.GC15251@redhat.com>
References: <1485351995.3931.4.camel@intelliad.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1485351995.3931.4.camel@intelliad.de>
Subject: Re: [linux-lvm] LVM snapshot: in memory COW table
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
To: Francois Blondel <fblondel@intelliad.de>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Wed, Jan 25 2017 at  8:46am -0500,
Francois Blondel <fblondel@intelliad.de> wrote:

> Hi all,
> 
> We currently use LVM snapshot as a solution to backups block devices.
> The snapshot is not active for a long time, only for the time during
> which we need to upload the backup to the backup server.
> 
> As I could read, for example here: http://www.nikhef.nl/~dennisvd/lvmcrap.html
> snapshots multiply the IO needs of the origin Logical Volume.
> We would like to avoid that.

The old dm-snapshot target has "transient" snapshot store already.
See drivers/md/dm-snap-transient.c

Use of transient isn't going to change the fact that you'll still need N
snapshot stores; and that any write will trigger an N-way copy-out
penality when N snapshots of the origin exist.  All you'd be doing with
transient is getting implicit improved performance of memory speeds.

For improved scalability you'd do well to switch to using DM
thin-provisioning's snapshots.  There are some customers/users who are
already making use of it for the backend for backups (using thin_delta
to know what the differences are between thin volumes and snapshots).

> As our servers have enough free RAM, and the COW table of the
> snapshot remains quite small, I had the project to store the snapshot
> (or its cow table) in RAM.
> The goal there is to avoid additional IO aimed at the disk and redirect
> them to memory.
> Yes, this would lead to the loss of the snapshot in case of power
> failure, but this is not an issue for our use case.

Documentation/device-mapper/snapshot touches on "transient" with:

*) snapshot <origin> <COW device> <persistent?> <chunksize>

A snapshot of the <origin> block device is created. Changed chunks of
<chunksize> sectors will be stored on the <COW device>.  Writes will
only go to the <COW device>.  Reads will come from the <COW device> or
from <origin> for unchanged data.  <COW device> will often be
smaller than the origin and if it fills up the snapshot will become
useless and be disabled, returning errors.  So it is important to monitor
the amount of free space and expand the <COW device> before it fills up.

<persistent?> is P (Persistent) or N (Not persistent - will not survive
after reboot).  O (Overflow) can be added as a persistent store option
to allow userspace to advertise its support for seeing "Overflow" in the
snapshot status.  So supported store types are "P", "PO" and "N".

The difference between persistent and transient is with transient
snapshots less metadata must be saved on disk - they can be kept in
memory by the kernel.
