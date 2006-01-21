Received: from o.ww.redhat.com (vpn-4-1.stuttgart.redhat.com [10.32.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	k0LH8K4W010128
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 18:08:20 +0100
Date: Sat, 21 Jan 2006 18:08:20 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
Message-ID: <20060121170820.GA2797@redhat.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B423CE6@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B423CE6@pmi00exf00.us.packetmotion.com>
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

On Fri, Jan 20, 2006 at 05:54:12PM -0800, Alex Chen wrote:
> Greetings,

Hi.

> 
>   I am tasked to investigate the differences between LVM and LVM2.  I am
> new to LVM so it would be greatly appreciated if someone can explain or
> point me to the right direction for the following questions:
> 
>  
> 
> 1.	What does LVM2 have that is not available in LVM?

It has command line extensions beyond lvm (eg, vgs, lvs, pvs commands).

It's configurable in various regards (eg, device name filters)

The limits of 256 grand total logical volumes and ~64k extents per logical
volume are gone.

Logical volume snapshots are asynchronous rather than synchronuous
and gain better performance.

pvmove (online data relocation) is based on temporary, restartable mirrors
which wasn't the case in LVM1.


> Or is it a
> only better architectured implementation of LVM?

I'ld not say 'only', but yes, it is :)


> 2.	Which version of Red Hat enterprise system uses which LVM?  And
> does the user need to do any configuration during installation?

RHEL3 comes with LVM, RHEL4 with LVM2.

> 3.	If LVM2 is definitely better than LVM, how stable is it?

It is stable with the exception of rare snapshot issues,
we're fixing right now.

> 
>  
> 
> Thanks.
> 
> Alex
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
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
