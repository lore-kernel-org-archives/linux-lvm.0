Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F9515@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
MIME-Version: 1.0
Subject: [linux-lvm] Questions about PE size and clustering
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
Date: Mon Jun  3 20:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

	Are there any concerns, performance or otherwise, with using a
larger PE size then the 4MB default? It would seem that the only problem
with using a larger PE is that there is an increased potential for waste,
sort of like "cluster overhang" on FAT file-systems? That is, if I set the
PE size to 128MB and then create a 150MB LV, I'll end up wasting 106MB of
space since the LV needs two PEs. Of course, this means that the waste is
always less than 1 PE. 

	My other question relates to "clustering" if I can abuse the term.
We currently have a fibre-channel RAID device and one NFS server which
serves 7 distinct filesystems (distinct in the sense that they are separate
partitions). One possible way for us to implement LVM is to create a single
VG and then LVs for each of the 7 filesystems. This provides us with the
best flexibility in re-sizing each filesystems since all LVs can be extended
with any free PEs. Now the problem is that at a future date we may wish to
add a second NFS server, not as a redundant system perhaps, but just to
balance the NFS traffic. If I understand correctly, this will work even with
one VG provided that:

	1) No attempt is made to mount a single LV from two machines (unless
using GFS)
	2) All nodes except one must "vgchange -an" before making any
changes to VG layout.

	The first restriction isn't really a problem since this is the same
problem one would have without using a filesystem like GFS, irrespective of
whether LVM is in use. However, the second restriction is a bit of a problem
because all NFS services essentially need to be stopped on the second node
before modifications can be made to the VG, even if the change is simply a
lvextend, etc. One possible solution that we are considering is creating a
separate VG for each of the filesystems that we have exported, so we would
have 7 VGs each with one maximally sized LV. The disadvantage to this is of
course that a PV can only be assigned to one VG. To solve this, what we are
considering is simply partitioning the RAID device into many partitions (The
RAID device will allow us to partition RAID sets which will then look like
separate disks, and we can physically partition each of these disks as
well). The goal would be to have enough partitions to minimize waste in each
filesystem. Now, if we need to extend a LV (and thus a VG since each VG has
just one maximally sized LV) we simply add the necessary number of
partitions to the VG and then issue lvextend. This will also allow moving a
VG, and thus a LV, from one node to another using vgexport/vgimport. And
since each node manages it's own VGs, there is hopefully no need for step 2
above. 

	One possible problem I can see is if I add a partition to a VG on
one node, then the other node still thinks of that partition as being
unused. Other than possible user error (that is, trying to then assign that
partition to a different VG from the other node since it looks free) are
there any problems? Would a vgscan correct from the second node correctly
identify the partition as now being in use without interfering with the VG
activity? Is it necessary to ensure that each node only vgchange -a the
volume groups it is managing?

	One thing that is interesting is that if it were possible to
export/import a LV, then the same functionality could be achieved with a
single VG for each node. 

Thanks for any comments,

(my, that was long winded - apologies)

-poul
