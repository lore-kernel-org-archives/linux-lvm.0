From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error creating snapshot, "Cannot allocate memory"
Message-ID: <20021203114821.A25161@sistina.com>
References: <20021202223223.GC21924@ofb.net>
Mime-Version: 1.0
In-Reply-To: <20021202223223.GC21924@ofb.net>; from jheiss-linuxlvm@ofb.net on Mon, Dec 02, 2002 at 02:32:23PM -0800
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
Date: Tue Dec  3 04:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 02, 2002 at 02:32:23PM -0800, jheiss-linuxlvm@ofb.net wrote:
> I have a volume group that is 1.4 TB, with a volume that is 400 GB.
> I currently have three 50 GB snapshots of that volume.  When I try
> to create a fourth, I get the following error:
> 
> bash-2.05a# lvcreate -L 50G -s -n snap_home1_20021202 /dev/home/home1
> lvcreate -- WARNING: the snapshot will be automatically disabled once it
> gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/home/snap_home1_20021202"
> lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
> "/dev/home/snap_home1_20021202" in kernel

You don't have enough kernel virtual memory to hold the snapshot exception
table in core :(
Install more RAM.

We have planned to reduce the amount of RAM needed to hold such tables
in LVM2/device-mapper next year.

> 
> After some experimenting, I found that I could create a snapshot that
> is 36 GB or smaller, but anything larger than 36 GB fails with the above
> error.  The volume group has 386 GB free.
> 
> Any thoughts?  I looked through the changelog and mailing list archives
> and couldn't find anything similar.
> 
> Other possibly useful bits of info:
> 
> OS:  Red Hat 7.3
> kernel:  2.4.18-18.7.xsmp
> LVM:  1.0.3-4  (Red Hat RPM)
> 
> Jason
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
