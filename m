Received: from o.ww.redhat.com (vpn50-5.rdu.redhat.com [172.16.50.5])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1DF4Ui02502
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 10:04:30 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Bug report for LVM 1.08
Message-ID: <20040213150428.GE10943@redhat.com>
References: <s02bd9d6.050@prv-mail20.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s02bd9d6.050@prv-mail20.provo.novell.com>
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
Date: Fri Feb 13 10:03:10 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Alexander,

the colon output has been added in 1997 to address a SuSE requirement
IRT to easing the installation process and displays the requested fields.

LVM1 is in feature freeze for a long time now in favour
of putting the development focus on LVM2, which is compatible to LVM1.

Please check into the pvs, vgs and lvs commands in LVM2,
which provide formatable output.

Regards,
Heinz    -- The LVM Guy --


On Thu, Feb 12, 2004 at 07:53:44PM -0700, Alexander Danoyan wrote:
> Hello Heinz,
> 
> Here are a few defects.
> There are inconsistency in view between 
> lvdisplay and lvdisplay with -c option
> Here is an example:
> 
> lvdisplay /dev/vg_demo/striped 
> 
> --- Logical volume ---
> LV Name                /dev/vg_demo/striped
> VG Name                vg_demo
> LV Write Access        read/write
> LV Status              available
> LV #                   3
> # open                 0
> LV Size                1 GB
> Current LE             32
> Allocated LE           32
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:2
> 
> lvdisplay -c /dev/vg_demo/striped 
> /dev/vg_demo/striped:vg_demo:3:1:2:0:2097152:32:32:0:1024:58:2
> 
> 1. As you can see the option -c does not show information about stripes
> at all.
> 2. -c option also does not show information on snapshot volumes
> 
> 3. Also in vgdisplay, pvdisplay and lvdisplay with -c option some of
> the sizes shown in KBytes and some of the sizes in the number of sectors
> ? 
> 
> We are (here at Novell) relying heavily on -c option. 
> Do you have any plans to fix these defects ? 
> If yes when are you planing to have a patch or next release ?
> Thanks a lot.
> 
> Alex.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
