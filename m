Message-ID: <3BB4A25D.167A4600@divsol.com>
Date: Fri, 28 Sep 2001 10:16:30 -0600
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
References: <3BB2FBF9.D68BC6D@adelaide.edu.au> <3BB300E1.90809@st-peter.stw.uni-erlangen.de> <3BB306C3.29ECD29F@adelaide.edu.au>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM deployment tips ?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hi lvm'rs,

Ive begun to think about really using lvm, ie to handle /home, /usr,
as well as /tmp, other mundane stuff.

This requires planning I said, then decided it was strategy;
how to use the namespaces of VGs, LVs, PVs across 3 ides?

heres some assertions, ( and wild speculations, despite my authoritative tone )
please disabuse me of any errs, wrong thinking.
who knows, maybe its a perfect what-not-to-do.


PVs reside on partitions; ex /dev/hdb2
PVs can split a hard drive by speed.

Partition speed is widely understood to vary linearly with head radius
from spindle, more area at edge can hold more data, and which is then
read/written faster.  Addition of PVs can make LV less reliable; it now
depends on continued operation of multiple disks.

an LV can have multiple PVs, and can extend and reduce the LVs
by allocating more space from the currently used PVs, or by adding
entirely new PVs.

an LV can have its PVs striped together for BW needs.
striped LVs should never use 2 PVs from same drive.
the PV-stripes used should have similar perf #s

LVs are also used to contain snapshots.  these work like
jfs in that they preserve a consistent view of a set of files,
even as other users change the 'current' copies.

snapshots are not talked about in terms of commit / rollback.
this seems unfortunate, even if to say that snapshots cant rollback.
Someday we might get such a feature - 'restore-fs-on-reboot',
but w/o the reboot.

VGs are mostly used to container-ize data ownership,
and for administrative control, backup.  Multiple VGs
are mostly used in larger installations.

Std pcs have only 4 ide drives, limiting multi-platter parallelism.
how best to use VGs here ? removable drives ?

Tuning LVs by recomposing them of different PVs
is a time-consuming process; measuring LV traffic with
lvmsadc, lvmsar requires that you have representative loads.

For example, if you balance loads to /usr, /home/httpd/docroot,
/var/log, you may fail cuz you ignored database io loads.
This is why man lvmsar says to use a cron-job, you get to
see real data, and hopefully load patterns.

putting each dir above into a striped LVs may not be beneficial,
particularly when they compete with each other for the spindle.
Such a config would serialize access to those LVs, rather than
each dir having its own spindle.

swag: lvmsar can report io loads against each PV and LV,
but not on PEs.  (PE activity wouldnt tell you much w/o
knowing the files residing there - and this would undermine
the abstraction)


are these true ? do they have any value as guidance ?

Journalling file-systems (JFS) ?

JFS seems to have a natural advantage on growable partitions.  What are the major
features of, and distinctions between; reiserfs, ext3, xfs, jffs, xyz, etc  ??

features such as transparency and auto-sync with lvextend/reduce
seem a be high priority.  Interaction-cooperation between snapshots
and jfs would be interesting.

JFS should in the end be better at journalling, can LVM be considered
jfs-lite, or perhaps jfs-block ?  This leaves out issues

even bigger swag:

fs-load-monitoring tools are / can be much better
in real JFS, as the fs can know in detail where the load is going.
However, how to create info from such data is unclear.

In contrast, LVM-sar only separates on boundaries (LVs) you create explicitly,
it doesnt do tuning & analysis for free.

It could be possible to use snapshots or similar to create monitors on directories
somewhere within a partition.  Ex; it could separately count loads to /usr, /usr/local,
even if /usr/local werent actually a different partition, by suitable setup.

lastly,

what would happen if I lvextend'd an ext2 partition ?
would an fsck fail immediately / later, or would it never see
the new space ?    Is it thus possble to create 'hidden' storage,
(similar to files in /tmp hidden when /tmp becomes mount point for /dev/hdc3 )

tia
jimc
