Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Mon, 15 Jan 2001 17:22:00 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] hard-lock seems to have caused serious LVM problems
Message-ID: <20010115172200.A31217@srv.t-online.de>
References: <20010115110358.A3757@jhereg.dmeyer.net>
Mime-Version: 1.0
In-Reply-To: <20010115110358.A3757@jhereg.dmeyer.net>; from dmeyer@dmeyer.net on Mon, Jan 15, 2001 at 11:03:58AM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 15, 2001 at 11:03:58AM -0500, dmeyer@dmeyer.net wrote:
> In article <20010115162523.A31019@srv.t-online.de> you write:
> > Every PV is assumed to hold all the PV UUIDs of all PVs in the volume group
> > the PV belongs to.
> 
> The PVs and VGs were created with 0.8final - I migrated to 0.9 tools
> when I upgraded to linux-2.4.0.  Could it be related to that somehow?

No, it shouldn't.
0.9 created PV UUIDs automagically in case there were none before.

> 
> Interestingly enough, something seems to have fixed my PVs in the
> meantime - now they all have every UUID.  Either activating the VG or
> running vgck must have done it.

No, it doesn't happen while activating VGs or checking them.

The following tools call vg_write_with_pv_and_lv() in the library
which in turn calls pv_write_uuidlist() to do the UUID list update:

lvcreate
lvextend
lvreduce
lvremove
lvrename
vgcfgrestore
vgchange (in case you change the max LV property)
vgcreate
vgexport
vgextend
vgimport
vgmerge
vgreduce
vgrename
vgscan
vgsplit

You must have run one of those tools in order to update the UUID list.
It is still rather interesting what caused the mess you reported in the first
place.

> 
> -- 
> David M. Meyer
> dmeyer@dmeyer.net
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
