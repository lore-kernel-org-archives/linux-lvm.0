Date: Wed, 30 Nov 2005 09:48:46 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] lvm + raid (confused)
Message-ID: <20051130084846.GA2778@redhat.com>
References: <efef33d20511292301s1fe5cf0dp90180833f51e2360@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efef33d20511292301s1fe5cf0dp90180833f51e2360@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: hjm@redhat.com

On Wed, Nov 30, 2005 at 08:01:20AM +0100, Wallace Wadge wrote:
> Hi,
> 
> I've got a hardware raid in place. I'd like to add snapshots via lvm to it
> but unfortunately the underlying filesystem is ext3 which cannot be resized
> downwards; therefore I would like to add another disk.
> 
> Now for the problem:
> 
> I would like to add a secondary (physical) disk to the mix and use it for
> snapshots only. However I do not want the lvm to stay writing to that disk
> for normal data since this seconday disk would not be part of my hardware
> raid. In other words, I wouldn't care if the snapshot drive failed because I
> would just replace it.
> 
> Is this at all possible?

Hi Wallace,

yes, it is.

pvcreate the physical disk and vegextend your VG by it.

When creating snapshots, add the path to that PV (say /dev/sdc) to the lvcreate
command line:

lvcreate -LSnapshotSize -nSnapshotName /dev/YourVG/YourLV /dev/sdc

You need to make sure though, that spave for LVs you want to be resilient, gets
allocated on your HW RAID, rather than to the single drive PV.

There's 2 ways to achive that:

o add the path to your HW-RAID to all your lvcreate/lvextend commands
  (but the ones to create snapshots)

o if your snapshots are short-term (which is typical), vgreduce the
  VG by the single drive PV until you need to create (a) snapshot(s) again;
  of course that solution falls short with respect to creating/extending
  LVs *while* the PV is a member of your VG

> 
> Thanks.
> Wallace

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
