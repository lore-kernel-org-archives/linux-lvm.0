Received: from o.ww.redhat.com (vpn50-3.rdu.redhat.com [172.16.50.3])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1EACNi10261
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 05:12:23 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] lvm pvscan or vgscan very slow
Message-ID: <20040214101222.GB22753@redhat.com>
References: <402C0D65.80905@caltech.edu> <20040212180824.O10533@homer.msp.redhat.com> <402D5D93.7040802@caltech.edu> <20040213173423.C14206@homer.msp.redhat.com> <402D66C6.5090906@caltech.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402D66C6.5090906@caltech.edu>
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
Date: Sat Feb 14 05:11:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 13, 2004 at 04:07:34PM -0800, Ling Li wrote:
> 
> 
> Alasdair G Kergon wrote:
> >On Fri, Feb 13, 2004 at 03:28:19PM -0800, Ling Li wrote:
> >
> >>I guess the number of devices to be scanned is just too large (and my 
> >>computer is also a very slow one). Is there some way to specify a 
> >>narrower range of devices to be scanned in LVM2?
> >
> > 
> >The filter lines in lvm.conf.  See doc/example.conf and man lvm.conf.
> 
> Got it. The man page says lvm.conf is only loaded during the 
> "initialization phase of LVM." Does this mean I have to reboot the 
> computer for the new lvm.conf to be in effect? Can I just send some 
> signal to some process?

No, just run vgscan after setting up your filter in lvm.conf.

> 
> --Ling
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
