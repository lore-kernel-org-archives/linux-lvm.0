Received: from o.ww.redhat.com (vpn50-1.rdu.redhat.com [172.16.50.1])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1G9Tui13729
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 04:29:56 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM 1: Snapshot causes seg fault of lvdisplay and crashes system
Message-ID: <20040216092955.GC13581@redhat.com>
References: <200402140615.i1E6Fbr03401@ecstasy.winternet.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200402140615.i1E6Fbr03401@ecstasy.winternet.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 04:29:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Feb 14, 2004 at 12:15:37AM -0600, Ken Fuchs wrote:
> I did the following to create a snapshot of an active filesystem to try
> to make a consistent copy of it:
> 
> # lvcreate --extents 30 --snapshot --name home2snap /dev/sys/home2gb
> ...
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/sys/home\
> 2snap"
> lvcreate -- doing automatic backup of "sys"
> lvcreate -- logical volume "/dev/sys/home2snap" successfully created
> 
> # lvdisplay /dev/sys/home2gb
> --- Logical volume ---
> LV Name                /dev/sys/home2gb
> VG Name                sys
> LV Write Access        read/write
> LV snapshot status     source of
>                        /dev/sys/home2snap [active]
> Segmentation fault
> # lvdisplay /dev/sys/home2gb
> --- Logical volume ---
> LV Name                /dev/sys/home2gb
> VG Name                sys
> LV Write Access        read/write
> LV snapshot status     source of
>                        /dev/sys/home2snap [active]
> Segmentation fault
> ecstasy:/#
> 
> <At this point I lost my remote connection to the machine and presume it
> crashed; it probably didn't reboot, since subsequent attempts to
> reconnect via ssh failed and ping failed as well.>
> 
> The kernel is probably 1.0.3 (Debian SPARC sun4u 2.4.21 up) and the lvm
> tools are 1.0.8.
> 
> Any suggestions for avoiding these seg faults and the system crash?

Upgrade to an actual driver LVM version. You hit a list bug IRT snapshots.

> 
> Sincerely,
> 
> Ken Fuchs <kfuchs@winternet.com>
> 
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

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
