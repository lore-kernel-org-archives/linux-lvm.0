Date: Wed, 14 Apr 2004 10:39:19 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] quota command does not work
Message-ID: <20040414083919.GA22343@redhat.com>
References: <20040413151723.GB19598@oddprocess.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040413151723.GB19598@oddprocess.org>
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
To: Matthew Daubenspeck <matt@oddprocess.org>
Cc: linux-lvm@redhat.com

On Tue, Apr 13, 2004 at 11:17:23AM -0400, Matthew Daubenspeck wrote:
> I am using lvm2 with the following logical volume:
> 
>   --- Logical volume ---
>   LV Name                /dev/nwlsd_vg/nwlsd_lv
>   VG Name                nwlsd_vg
>   LV UUID                jKXS7Q-2Bda-JpVG-Ba4I-Ocfr-6UyO-182Mek
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                55.91 GB
>   Current LE             14312
>   Segments               2
>   Allocation             next free (default)
>   Read ahead sectors     0
>   Block device           254:0
> 
> I am trying to get quota's working on the system. The quotas themselves
> are working, however, standard users cannot issue the quota command to
> inspect their own specific information:
> 
> $ quota
> quota: Can't stat() mounted device /dev/nwlsd_vg/nwlsd_lv: Permission
> denied
> Disk quotas for user mellofone (uid 1000): none
> 
> However, it does work for root:
> 
> $ quota mellofone
> Disk quotas for user mellofone (uid 1000): 
>      Filesystem  blocks   quota   limit   grace   files   quota   limit   grace
> /dev/nwlsd_vg/nwlsd_lv
>                 19364268*      0  100000            2019       0       0    0
> 
> This setup works on other volumes that do not use lvm. Any ideas what I
> screwed up? Just as an FYI:

chgrp disk /dev/mapper/*
chmod g=rw /dev/mapper/*

We need to fix that in dmlib (if not already done ;)

> 
> $ lvm version
>   LVM version:     2.00.09 (2004-03-31)
>   Library version: 1.00.08-ioctl (2004-02-27)
>   Driver version:  4.1.0
> 
> Thanks.
> -- 
>   Matthew Daubenspeck
>   http://www.oddprocess.org
> 
> 11:09:30 up 23 days, 1:21, 1 user, load average: 0.02, 0.03, 0.00
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
