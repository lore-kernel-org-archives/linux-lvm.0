From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Questions about PE size and clustering
Message-ID: <20020604151157.C17699@sistina.com>
References: <F888C30C3021D411B9DA00B0D0209BE8038F9515@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F9515@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Mon, Jun 03, 2002 at 06:23:17PM -0700
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
Date: Tue Jun  4 08:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 03, 2002 at 06:23:17PM -0700, Poul Petersen wrote:
> 	Are there any concerns, performance or otherwise, with using a
> larger PE size then the 4MB default?  It would seem that the only problem
> with using a larger PE is that there is an increased potential for waste,
> sort of like "cluster overhang" on FAT file-systems?

Yes, that's it.

> That is, if I set the
> PE size to 128MB and then create a 150MB LV, I'll end up wasting 106MB of
> space since the LV needs two PEs. Of course, this means that the waste is
> always less than 1 PE. 

Well, in that case your LV will be 256MB in size. which yu might not want.
But yes, that's always less than 1 PE, because the PE size is the LVM
internal allocation units causing LV sizes of multiples of the PE size.

> 
> 	My other question relates to "clustering" if I can abuse the term.
> We currently have a fibre-channel RAID device and one NFS server which
> serves 7 distinct filesystems (distinct in the sense that they are separate
> partitions). One possible way for us to implement LVM is to create a single
> VG and then LVs for each of the 7 filesystems. This provides us with the
> best flexibility in re-sizing each filesystems since all LVs can be extended
> with any free PEs. Now the problem is that at a future date we may wish to
> add a second NFS server, not as a redundant system perhaps, but just to
> balance the NFS traffic. If I understand correctly, this will work even with
> one VG provided that:
> 
> 	1) No attempt is made to mount a single LV from two machines (unless
> using GFS)

Correct.

> 	2) All nodes except one must "vgchange -an" before making any
> changes to VG layout.

Correct.

In summer, you can go with Cluster LVM + GFS in order to avoid these
constraints. That'll give you shared volume groups active on all nodes
and GFS filesystems mounted on all as well.

> 
> 	The first restriction isn't really a problem since this is the same
> problem one would have without using a filesystem like GFS, irrespective of
> whether LVM is in use. However, the second restriction is a bit of a problem
> because all NFS services essentially need to be stopped on the second node
> before modifications can be made to the VG, even if the change is simply a
> lvextend, etc. One possible solution that we are considering is creating a
> separate VG for each of the filesystems that we have exported, so we would
> have 7 VGs each with one maximally sized LV. The disadvantage to this is of
> course that a PV can only be assigned to one VG. To solve this, what we are
> considering is simply partitioning the RAID device into many partitions (The
> RAID device will allow us to partition RAID sets which will then look like
> separate disks, and we can physically partition each of these disks as
> well). The goal would be to have enough partitions to minimize waste in each
> filesystem. Now, if we need to extend a LV (and thus a VG since each VG has
> just one maximally sized LV) we simply add the necessary number of
> partitions to the VG and then issue lvextend. This will also allow moving a
> VG, and thus a LV, from one node to another using vgexport/vgimport. And
> since each node manages it's own VGs, there is hopefully no need for step 2
> above. 

Splitting capacity either way as a workaround is no acceptable solution.

LVM + GFS would enable you to add your second server (or even more) later
by installing Cluster LVM additionally which avoids problems like those
below as well.


> 
> 	One possible problem I can see is if I add a partition to a VG on
> one node, then the other node still thinks of that partition as being
> unused. Other than possible user error (that is, trying to then assign that
> partition to a different VG from the other node since it looks free) are
> there any problems? Would a vgscan correct from the second node correctly
> identify the partition as now being in use without interfering with the VG
> activity? Is it necessary to ensure that each node only vgchange -a the
> volume groups it is managing?
> 
> 	One thing that is interesting is that if it were possible to
> export/import a LV, then the same functionality could be achieved with a
> single VG for each node. 
> 
> Thanks for any comments,
> 
> (my, that was long winded - apologies)
> 
> -poul
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
