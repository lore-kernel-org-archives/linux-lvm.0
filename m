Received: from o.ww.redhat.com (vpn50-50.rdu.redhat.com [172.16.50.50])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i46BT7t1010913
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 13:29:07 +0200
Date: Thu, 6 May 2004 13:29:07 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Problem with EXT filesystem on LVM2
Message-ID: <20040506112907.GE1719@redhat.com>
References: <408F7FF9.5020603@naturalsciences.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <408F7FF9.5020603@naturalsciences.be>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Paul,

looks like the heavier io load mkfs.ext3/resize2fs exposes a problem
with your system (hw) which isn't the case with the leighter load
mkreiserfs causes. A bunch of changes to device-mapper were needed because
of block device changes by Andrew Morton in the early 2.6 series which are
missing and likely causing your problem.

Could you try Linux 2.6.6, apply
http://people.sistina.com/~thornber/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.tar.bz2 and test again, please.

Regards,
Heinz    -- The LVM Guy --



On Wed, Apr 28, 2004 at 11:57:13AM +0200, Paul Libert wrote:
> Dears,
> 
> I'm facing the following problem :
> When I try to create an EXT3 filesystem on a LVM2 logical volume, the 
> system end up frozen, in 100% wio state.
> Accessing already existing EXT3 FS gives no problem.
> If  I try to resize a EXT3 FS via 'resize2fs', I got the same behaviour.
> Creating a EXT3 FS on a raw partition works without problem.
> Creating a Reiser3 or Reiser4 or XFS FS on a LVM2 logical volume also works.
> fsck of an existing EXT3 partition on LVM2 also works
> 
> System is a HP DL380 with a external diska array also from HP. SCSI 
> controller is a HP5xxx using hardware RAID (configured for the RAID5 ADG 
> mode)
> Distribution is Debian/Testing with 2.6.3 stock kernel. All packages are 
> also from Debian/Testing (nothing external, nothing recompiled)
> LVM version:     2.00.08 (2003-11-14)
> Library version: 1.00.07-ioctl (2003-11-21)
> Driver version:  4.0.0
> mke2fs 1.35 (28-Feb-2004), Using EXT2FS Library version 1.35
> 
> I can provide strace of :
> mkfs.ext3 (failed)
> resize2fs (failed)
> mkfs.resierfs (successfull)
> mkfs.reiser4 (successfull)
> 
> Quick look at the starce seems to show that it blocks in a 'fsync' call.
> 
> Actually, I've succeded in creating a new EXT3 FS on LVM2 using 
> following trick :
> - dd an existing, smaller EXT3 FS to the LVM2 logical volume
> - resize2fs this FS -> it stuck the system in frozen, 100% wio state
> - reboot the system
> - do a fsck on the problematic FS
> This seems to work without bad effect but, hell, it's not very elegant ...
> 
> Any hint or information will be greatly apreciated.
> 
> Best regards.
> 
> Paul
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
