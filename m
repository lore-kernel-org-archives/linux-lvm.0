From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM for a Database
Message-ID: <332740000.1038377915@[192.168.100.3]>
In-Reply-To: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
References: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed Nov 27 11:21:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Joseph Kezar <jkezar@doc.state.vt.us>

> We are in the process of building a database on a 4 processor 1.8GHz, 4GB
> RAM Dell 6650.
> I am trying to figure out the most efficient way to use LVM for our raw
> data storage.  We have a RAID array with 8x36GB drives in it.  Should I
> do a raid 1+0(mirror 4 disks, and span them to get one logical volume)?
>
> If so this leaves me a /dev/sdb.  Or would I get better performance if I
> mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].  Is it possible
> to figure out where the center of our spindles are?  So I can arrange for
> the heads to spend little time seeking?
> Any perfomance hints would be greatly appreciated.

(1)	Use hardware RAID.

(2)	RAID5 with a stripe == O/S I/O page size will avoid the
	write penalty. This normally means using 4 drives with
	1K chunk size or 8 with 1-page chunk.

(3) Striping across RAID5 stripes using a stripe size equal
	to the page (which is equal to the stripe) gives good
	performance by avoids write penalty and spreading the
	data over more devices and controllers (or SCSI at least
	chains). High-end RAID controllers (e.g., from Mylex)
	have multiple SCSI chains, which makes striping across
	the SCSI controllers a rather nice alternative.

RAID5 avoids loosing data; its performance if a drive fails
will be pretty dismal even with hot spares. RAID1 avoids
the performance penalty during failures and has the additional
advantage of making "cold" backups from a split mirror. Price
is doubling the storage cost.

For the best uptime results use RAID0+5 (mirrored drives
grouped into RAID5 stripes). This allows up to 1/2 the
drives to fail without any serious performance penalty
(if you have lots of spare cash for drives).

Once the hardware RAID5 has been set up to spread the
I/O out and avoid downtime, LVM is a rather nice choice
for managing the space. At this point the RAID system
is doing considerable work to spread out the I/O and
buffer the data at multiple levels. This saves you from
having to play games with cyl numbers for speed: just
use the space and be done with it.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
