Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1PEWva5005239
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 15:32:57 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Kernel Patch for LVm-1.0.8
Message-ID: <20040225143257.GC11757@redhat.com>
References: <E1AtfOX-0007TZ-00@jade.ima.umn.edu>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1AtfOX-0007TZ-00@jade.ima.umn.edu>
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
Date: Wed Feb 25 09:31:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Kumsup,

you can use actual 2.4 kernels fine with the LVM 1.0.8 tools.
Your problem seems to be related to on-disk metadata.

Can you see all Physical Volumes fine with pvscan ?
What does vgck display ?

On Wed, Feb 18, 2004 at 10:02:37PM -0600, Kumsup Lee wrote:
> Hi There,
> 
>   I used to have kernel 2.8.18 with LVM-1.0.4 on my machine.  After I
> upgraded kernel to 2.4.22 because of security problem, I couldn't 
> make any snapshot.  So, I tried to use LVM-1.0.8 on kernel 2.4.22.  Then 
> it complains about inconsistency.  Is there any LVM patch for 2.4.22+ ?
> 
> sys:/# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "mailspool"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "mailspool" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> sys:/#
> 
> Thanks,
> 
> -- 
> 
> =============================================================================
>  Kumsup Lee (ÀÌ±ÝŒ·) 				 System/Network Manager 
>  Institute for Mathematics and its Applications, University of Minnesota 
>  400 Lind Hall,   207 Church Street S.E.,   Minneapolis, MN 55455   USA
>  Tel : 612-624-4353	FAX : 612-626-7370	PAGE : 952-608-0112
>  klee@ima.umn.edu	www.ima.umn.edu/~klee
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

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
