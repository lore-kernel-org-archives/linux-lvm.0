Received: from o.ww.redhat.com (vpn50-5.rdu.redhat.com [172.16.50.5])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1DG6Ci22880
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 11:06:12 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] SuSE 9.0 and LVM2
Message-ID: <20040213160611.GF10943@redhat.com>
References: <402AAB52.7010405@sympatico.ca> <200402120840.59051.krienke@uni-koblenz.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200402120840.59051.krienke@uni-koblenz.de>
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
Date: Fri Feb 13 11:05:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 12, 2004 at 08:40:54AM +0100, Rainer Krienke wrote:
Content-Description: signed data
> On Mittwoch, 11. Februar 2004 23:23, Avtar Gill wrote:
> > This is a general question to anyone out there currently using
> > LVM2 with SuSE Professional 9.0 on production servers (or
> > workstations). Would you be kind enough to share your experiences
> > with the rest of us? Did you experience any minor or major issues
> > along the way? SuSE 9.0 ships with LVM 1.* by default but I thought
> > it might be a good idea to implement new servers with LVM 2.*
> > instead so upgrading to future versions of SuSE (with kernel 2.6)
> > will be less of a hassle. Any thoughts or comments?
> >
> 
> We are running LVM2 on a suse8.2 system using the suse9.0 kernel (2.4.21-166).  
> The lvm2 utilities (version 2.2.00.05) are in this case not taken from suse 
> RPMs. I compiled them myself. The system (actualy 3 hosts with a total of ~3 
> Hardware  RAIDs, configured with raid level 5) is a NFS and SMB fileserver 
> with a total of 3 TBytes storage. Actually the RAIDs offer a total of  ~6 TB 
> but we do mirroring so we can only use have of the real size. 
> 
> LVM sits on top of a md device hierachy: The hardware RAIDs are connected by 
> fibrechannel using 2 seperate paths from each raid array to each host across 
> 2 fc switches. So each host has first two multipath md devices and on top of 
> this it has a raid1 md device (mirror) that performs mirroring across the 
> raids so that even if one complete RAID should fail nothing serious will 
> happen. This redundency already proved quite useful since we can take one 
> hardware RAID out of order eg for a firmware upgrade we had to do lately 
> without stopping the servers in doing their job. 
> 
> The md mirror each hosts sees is used as physical volume for LVM. Here LVM2 
> proved very useful since it allowed me to configure the (md) devices LVM 
> should scan for volumes when starting. I first tried using LVM1 in this 
> system, but this failed since LVM1 was confused since during scanning the 
> disks it saw the volumegroup and the volumes several times (probably due to 
> the multipath and mirroring md devices pointing to the same data) and this 
> lead to a complete loss of the logical volumes with all the data inside.

Yes, LVM1 copes with 1 MD (eg, RAID1) stacked below it quite well.
It hasn't been engineered to cope with more levels (eg, your RAID1+multipath)
though.

LVM2 as you pointed out, is capable to set up device name filters to
cope with any such multi-level stacks avoiding access to device nodes
you don't like it to access.

Regards,
Heinz    -- The LVM Guy --

> 
> The filesystem in use on the local volumes is xfs. 
> 
> The system is running about 6 months now, and we did not have any trouble with 
> it.
> 
> Have a nice day
> Rainer
> -- 
> ---------------------------------------------------------------------------
> Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
> Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
> Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
> Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
> ---------------------------------------------------------------------------

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
