Return-Path: <root@srv.sistina.com>
Date: Thu, 8 Feb 2001 21:35:53 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] questions
Message-ID: <20010208213553.A19468@srv.sistina.com>
References: <20010208205551.C21949@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010208205551.C21949@vestdata.no>; from lvm@ragnark.vestdata.no on Thu, Feb 08, 2001 at 08:55:51PM +0100
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, Feb 08, 2001 at 08:55:51PM +0100, Ragnar Kj�rstad wrote:
> Hi
> 
> Is there a limit for the maximum size of a LVM diskgroup?
> (internally in LVM-code, or because of other limits in the kernel)
> The 2TB (1 TB) maximum devicesize in the linux-kernel doesn't apply, does
> it?

256 (which is limited to 128 SCSI disks and 20? IDE discs) * maximum PV size
which is limited to 2 TB --> 296 TB in case you'll find 2 TB IDE disks ;-)

> 
> How does LVM handle that one of it's devices changes size? E.g. if one
> of the physical disks is a RAIDset, and more disks are added to it?
> Is there any way to tell LVM to use more or less of the disk?

LVM can't handle size changes directly today.
You need to go with

   a. additional partitions on the size increased device
   b. additional LUNs exposing the added capacity (typical with some
      HW RAID device models)

and create additional PVs on them.

Basically we could implement an enhancement to pvchange(8) in order
to support growing of PVs.

> 
> 
> Thanks.
> 
> 
> -- 
> Ragnar Kj�rstad
> BigStorage
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
