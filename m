Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6A0cBVw032530
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 20:38:11 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6A0c3RU014566
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 20:38:03 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OXO4w-0003Nd-57
	for linux-lvm@redhat.com; Fri, 09 Jul 2010 17:38:02 -0700
Date: Fri, 09 Jul 2010 19:38:01 -0500
From: Ray Morris <support@bettercgi.com>
References: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
In-Reply-To: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
	(from closms@gmail.com on Fri Jul  9 18:47:12 2010)
Message-Id: <1278722281.8612.37@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] efficiently copying snapshot data.
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

> How can I efficiently copy only the snapshot?

rsync.  Mount the snapshot, mount the copy of the source LV
on the other machine, and rsync from the snapshot to the copy.
You'll probably need to use "kpartx" to make the partitions
with the LVs visible.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 07/09/2010 06:47:12 PM, Michael Closson wrote:
> Say I am using lvm to store VM disks.  I have a logical volume with  
> the
> master image and the vms are snapshots created from the master LV.
> 
> I want to save this VM, copy the memory and snapshot data to a  
> different
> machine with the same master LV, and then restore the VM.
> 
> Is it possible?  How can I efficiently copy only the snapshot?
> 
> Thanks,
> Mike C
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
