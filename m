Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Wed, 24 Jan 2001 19:28:58 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] vgextend segfaults
Message-ID: <20010124192858.A1295@srv.sistina.com>
References: <web-8135952@comned.com>
Mime-Version: 1.0
In-Reply-To: <web-8135952@comned.com>; from wim@comned.com on Wed, Jan 24, 2001 at 03:35:30PM +0100
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

Looks like you didn't patch the kernel with the patch contained
in the LVM distribution.

Did you follow PATCHES/README in order to do that?

On Wed, Jan 24, 2001 at 03:35:30PM +0100, wim bakker wrote:
> Hai,
> setup: RH7 with all updates applied
> kernel: 2.4.0 and 2.4.1-pre10
> LVM: tried 0.9, 0.9.1-beta1 and 0.9.1-beta2
> with fdisk I created 4 primary partitions on a testdrive all
> 8e.
> After that I do a pvcreate for those 4 partitiions:

<SNIP>

> Then I do a vgextend:
> --------------------------------------
>  vgextend -v testl /dev/sdb2
> vgextend -- locking logical volume manager
> vgextend -- checking volume group name "testl"
> vgextend -- checking volume group "testl" existence
> vgextend -- checking for inactivity of volume group
> vgextend -- reading data of volume group "testl" from lvmtab
> vgextend -- INFO: maximum logical volume size is 255.99
> Gigabyte
> vgextend -- reading data for all physical volumes from
> disk(s)
> vgextend -- extending VGDA structures of volume group
> "testl"
> vgextend -- volume group "testl" will be extended by 1 new
> physical volumes
> vgextend -- extending volume group "testl" by physical
> volume "/dev/sdb2" in kernel
> Segmentation fault
> ----------------------------------------
> It segfaults , it segfaults whatever 2.4.0 or 2.4.1-prexxx
> I use, I tried this with the above mentioned lvm's
> and allways the same result. a segfault .
> Now what am I doink wrong???
> I tried this on two different machine one dual processor
> with
> adaptec 29160 adapter and one with 53c875 adapter 
> both with the same disks quantum 9Gb u2w disks
> TIA 
> 
> wim bakker
> ComNed Netwerken BV
> 31 20 4350025
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
