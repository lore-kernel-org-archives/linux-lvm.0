From: tim@connectlive.com
Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020227063421.A15647@connectlive.com>
References: <OE259ql2RkeS8YkdavN00018e1a@hotmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OE259ql2RkeS8YkdavN00018e1a@hotmail.com>; from
    gitansh@hotmail.com on Wed, Feb 27, 2002 at 05:35:26PM +0530
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
Date: Wed Feb 27 08:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoth Gitansh Chadha:
> hi....
> well i am an undergraduate student from Pune ,India and we implementing a cluster LVM as our final year project.
> we are manipulating   vg_status in vg_t structure to determine the status the of a volume group.basically playing with the bits in it.so we can have a shared and exclusive locked volume group.
> we also have a administrator which communicates with all nodes in the cluster and basically to maintain the consistency of the LVMTAB.
> any suggestions?

Have you looked at IBM's old Distributed Lock Manager?  I believe it was
used in DFS/DCE for pretty much the same type of thing.  If not, you may
be able to get some good algorithms out of it. 

http://www-124.ibm.com/developerworks/projects/dlm

The reason I would consider implementing code that's already been
tested is that subtle bugs in your implementation would almost certainly
hose any VG that had two "owners" at a point in time.  Al Bazinet at IBM
always seemed to be finding new possibilities for this in DFS.  Likewise
I have become a bit gun-shy about kernelspace changes since hosing my
installation's "live" storage for 30 minutes (recovery & failover went
fine, but apocalyptic unscheduled downtime always sucks, doesn't it?).
I was using a much more primitive mirroring-the-LVMTAB method with
non-shared drives in a Heartbeat cluster, and the outage was due to VM
corruption within the kernel affecting a snapshot vgchange (see 1.0.3).
The old saw, "if you're going to re-invent the wheel, at least make it
round" applies here as ever.  Very clever idea you have come up with,
I'd just suggest borrowing tested code to shorten the "beta" period.

-- 
  "What I feel for her isn't simple hate. It is an all-encompassing 
   repulsion not unlike what you might feel if you woke up to discover
   a four-pound cockroach using your toothbrush."
      --Eric Umansky, in a Washington Post piece on Alanis Morrissette
