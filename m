Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F9522@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] One VG or many?
MIME-Version: 1.0
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
Date: Wed Jun  5 14:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> First, I would separate system (= containing the OS) and data area.
> Second, if you do not intend to stripe data across LVs I would create
> one VG for every logical business/application unit and assign disk
> space on demand. That means that you leave most disks in a pool and
> if you need more space in one VG you'll add the disk online with
> vgextend. Why not start with one disks per VG?
> 

	I see how adding disks from a pool would work very well. The problem
with our arrangement is that we would like to combine disks into RAID 5 sets
and then use these RAID sets as the PVs. The optimal size of each RAID set
(optimal in terms of disk usage, controller redundancy, channel redundancy,
and enclosure fault-tolerance) is about 215GB; so we would have 8 PVs
available to use in VGs. This size seems insufficiently granular to use as a
"expansion unit" to each VG. In fact, even if we used the individual disks
in the array, they seem too large at 73GB. This is why we were thinking
about partitioning the RAID sets so they would appear to the host as smaller
disks which could be added to VGs (The disks, RAID sets and even partitions
are all externally managed on a Zzyzx RocketStor 2000).

	Let me ask a slightly different question - what is the advantage to
creating a VG for every logical business/application unit? Or perhaps, why
would I not want to use a single VG? Is it a good idea just in terms of
failure in one VG not wiping out everything? It would seem that a reasonable
analogy would be that one VG is like one disk with partitions (LVs) for each
business unit, whereas multiple VGs would be more like multiple disks. Both
seem to have sufficient ideological separation?

Thanks for you help,


-poul
