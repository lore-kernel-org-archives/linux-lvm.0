From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvcreate problem
Message-ID: <20021206155120.A8137@sistina.com>
References: <Pine.A41.4.43.0212051720570.56072-100000@hera.itg.uiuc.edu>
Mime-Version: 1.0
In-Reply-To: <Pine.A41.4.43.0212051720570.56072-100000@hera.itg.uiuc.edu>; from alazarev@hera.itg.uiuc.edu on Thu, Dec 05, 2002 at 05:27:01PM -0600
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
Date: Fri Dec  6 08:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 05, 2002 at 05:27:01PM -0600, Alexander Lazarevich wrote:
> i just installed a fresh RH linux 7.3, with LVM 1, or whatever comes in
> the RH distribution.
> 
> ihe first thing i'm trying to do is pvcreate on my big RAID 5 array, which
> is /dev/sdb:
> 
> [root@discord root]# pvcreate /dev/sdb
> pvcreate -- ERROR: can't initialize physical volume "/dev/sdb" of volume
> group "homevg" without -ff
> 
> but there is no volume group homevg:
> 
> [root@discord root]# vgdisplay homevg
> vgdisplay -- volume group "homevg" not found
> 
> i am able to fdisk a partition onto /dev/sdb, and then do a pvcreate on
> that partition, but i want to do a pvcreate on the whole free volume, no
> partitions! i may have made a typo before, by trying to do a pvcreate
> /dev/sdb, i instead did a vgcreate /dev/sdb. and them i might have tried
> some other crap cause it was freeking out. i rebooted so i can see the
> history, unless lvm keeps some kind of log file? i couldnt find one.

No log file ITR.
In general having at least one partition per device is a good idea, because
sources like /proc/partitions or tools like fdisk find that there's something
on the device. You loose _very_ little capacity that way.

If you still want to use /dev/sdv directly "pvcreate -ff /dev/sdb;vgcreate ..."
should do it after you remove any partition table from /dev/sdb again.
Eventually you need a "dd if=/dev/zero of=/dev/sdb bs=512 count=1" _after_
you removed the partition table.

> 
> i rebooted, etc. id prefer not to have to reinstall everything. how do i
> fix this problem?
> 
> any ideas?
> 
> thanks in advance!
> 
> alex
> ---                                                        ---
>    Alex Lazarevich | Systems | Imaging Technology Group
>    alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
> ---                                                        ---
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
