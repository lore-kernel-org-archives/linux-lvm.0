Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 12:39:24 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate doesn't work for me
Message-ID: <20010502123924.E30791@sistina.com>
References: <20010430161149.K19810@sistina.com> <20010430165842.A6326@ikar.t17.ds.pwr.wroc.pl>
Mime-Version: 1.0
In-Reply-To: <20010430165842.A6326@ikar.t17.ds.pwr.wroc.pl>; from misiek@pld.ORG.PL on Mon, Apr 30, 2001 at 04:58:42PM +0200
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

Arkadiusz,

the debug output shows, that LVM allocates 3 devfs device nodes.

Have you tried running:

vgcreate test /dev/ide/host0/bus0/target0/lun0/part[1-3]

instead of "vgcreate test /dev/hdd[1-3]".

If that works, there's a flaw in vgcreate.

On Mon, Apr 30, 2001 at 04:58:42PM +0200, Arkadiusz Miskiewicz wrote:
> On/Dnia Mon, Apr 30, 2001 at 04:11:49PM +0000, Heinz J. Mauelshagen wrote/napisa?(a)
> > $ fdisk -l /dev/hdd
> [root@arm misiek]# fdisk -l /dev/hdd
> 
> Disk /dev/hdd: 32 heads, 63 sectors, 827 cylinders
<SNIP>
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> 
> > Warning: if you create a VG containing PVs in multiple partitions of the
> >          same disk, you will likely run into trouble if you want to
> >          test striped LVs.
> What kind of trouble?
> 
> > Heinz    -- The LVM Guy --
> 
> -- 
> Arkadiusz Mi?kiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
> http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]
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
