Received: from o.ww.redhat.com (vpn50-3.rdu.redhat.com [172.16.50.3])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1EAImi11239
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 05:18:48 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM Problems :)
Message-ID: <20040214101848.GE22753@redhat.com>
References: <402CD9E4.8070402@demonlord.de> <20040213143846.GB10943@redhat.com> <200402132123.i1DLNfS26985@ecstasy.winternet.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200402132123.i1DLNfS26985@ecstasy.winternet.com>
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
Date: Sat Feb 14 05:18:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ken,

the missing task was to shrink the LV.

On Fri, Feb 13, 2004 at 03:23:41PM -0600, Ken Fuchs wrote:
> Heinz Mauelshagen wrote:
> 
> >the size of your filesystem and logical volume differs already.
> >That's why e2fsadm fails.
> >Did you eventually run resize2fs in order to shrink the filesystem ?
> 
> >Your logical volume size is 1091456MB (32MB/PE * 34108 PE) but your
> >filesystem size is 963584GB (941GB * 1024MB/GB; check with
> >"tune2fs -l" and look for the block count and block size to calculate
> >this correctly).
> 
> >In case the result shows, that your filesystem is already smaller than the LV,
> >lvreduce the logical volume appropriately.
> 
> >Use the block count * block size result and round it up to the next PE!
> 
> To avoid an error in calculating the correct number of logical extents,
> and possibly doing an lvreduce(8) to a size smaller than the filesystem:
> 
> Use resize_ext2(8) without a size argument.  This will resize the ext2
> or ext3 filesystem to be the same size as the logical volume containing
> it.  After doing this, e2fsadm(8) can be used to resize the filesystem
> and logical volume "simultaneously" to any desired size (that can
> contain the filesystem's data).
> 
> Sincerely,
> 
> Ken Fuchs <kfuchs@winternet.com>
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
