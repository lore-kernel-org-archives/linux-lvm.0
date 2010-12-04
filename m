Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB4JSsbP014108
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:28:55 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB4JSkoK011230
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:28:46 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1POxmm-0003TH-Ce
	for linux-lvm@redhat.com; Sat, 04 Dec 2010 11:28:44 -0800
Date: Sat, 04 Dec 2010 13:28:43 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <201012042006.46803.d_baron@012.net.il> (from
	d_baron@012.net.il on Sat Dec  4 12:06:46 2010)
Message-Id: <1291490923.8066.12@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] "Condensing" Physical Volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> However, not enough extents are available.
> 
> Is there any way to "condense" physical volumes to
> recover/expose empty extents in order to make use of them?

   You say there are few free extents, then you say there
are many "empty" extents.  It sounds like we need to get very
clear on exactly what is free, what is empty, what is
sparse, etc.

> The disk is very sparsely populated.

The disk is probably the PV, which is full of extents.
Therefore, the disk is fully populated (with extents).
Perhaps the disk is a component of a RAID array and
the array is the PV.  Either way, the disk is probably
full of something (RAID blocks, LVM extents, whatever).


    Is your situation actually the following?:

The volume group is nearly full, meaning that most all
of the extents are used by logical volumes.

On those logical volumes you have file systems.

Those file systems have free space.

If the above three conditions hold, you'd need to:

reduce the size of the file systems, perhaps using ex2resize.

Once each file system is reduced, you would then be able to reduce
the logical volume which contains that filesystem.

That will mean there are free extents in the volume group, so you can
then use pvmove to move the extents off of the chosen physical
volumes.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 12/04/2010 12:06:46 PM, David Baron wrote:
> I need more extents to move stuff off older, possibly failing IDE  
> disks to my
> new SATA terrabyter. However, not enough extents are available. The  
> disk is
> very sparsely populated.
> 
> Is there any way to "condense" physical volumes to recover/expose  
> empty
> extents in order to make use of them?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
