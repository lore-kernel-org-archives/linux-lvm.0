Received: from o.ww.redhat.com (vpn50-23.rdu.redhat.com [172.16.50.23])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i3UB3XNv029084
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 13:03:33 +0200
Date: Fri, 30 Apr 2004 12:59:56 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Extending LVM and SomeQuestion ..
Message-ID: <20040430105956.GC15691@redhat.com>
References: <200404270720.i3R7Ko0c016764@smtp.doruk.net.tr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200404270720.i3R7Ko0c016764@smtp.doruk.net.tr>
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

On Tue, Apr 27, 2004 at 10:17:22AM +0300, Vahric MUHTARYAN wrote:
> Hi Everybody , 
> 
> I created Volume Group and I added 2 disk into VG. That's ok problem is; 
> 
> I checked Howto http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html 
> 
> it's using only vgextend ( not lvextend ) to extend size of Volume Group and
> file system ?! Does it true ?! Do I have to use lvextend ?! don't I ?! 

With vgextend you grow a Volume Group (think about it like a resizable disk),
with lvextend you grow a Logical Volume (like a resizable partition).

> 
> and 
> 
> it's look like ext3 not good choise for resizing filesystem because ext2,
> ReiserFS , xfs , jfs have more tools for extending ?! 

You can resize an unmounted ext3 with resize2fs (the ext2 resize tool).

The steps you need to carry out for growing your VG and LV(s) are:

# vgextend YourVGName /dev/dsk1 /dev/dsk2 # You did that already, right ?
# lvextend -L+WhateverGrowths /dev/YourVGName/YourLVName
# resize2fs /dev/YourVGName/YourLVName # Presumably this is ext2/3

Use the respective tools to resize any other filesystem type
(eg, resize_reiserfs).

> 
> 
> 
> 
> Best Regards ..
> Vahric MUHTARYAN 
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
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
