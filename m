Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LIJEa05506
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:19:14 -0400
Received: from atl-ms1.megatrends.com (mail2.megatrends.com [155.229.80.16])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6LIJDe1026826
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:19:13 -0400
Message-ID: <8CCBDD5583C50E4196F012E79439B45C04C9A467@atl-ms1.megatrends.com>
From: Vinesh Christopher <vineshc@ami.com>
Subject: RE: [linux-lvm] Raid 0+1
Date: Wed, 21 Jul 2004 14:19:24 -0400
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

http://evms.sourceforge.net/


-----Original Message-----
From: Wayne Pascoe [mailto:lists-june2004@penguinpowered.org] 
Sent: Wednesday, July 21, 2004 11:12 AM
To: LVM general discussion and development
Subject: RE: [linux-lvm] Raid 0+1


> The softraid comes with linux does not support resize.
>
> Try DM + EVMS. This is much simpler and powerful. You can create Raid
> over
> Raid (Any raid level not limited to 0 and 1)
> The next EVMS release 2.4 scheduled for Aug 2004, has features to
> resize
> RAID 1 and 4/5.

Thanks. I'm replying privately, as I'm not sure if this is relevant to
the lvm-list :)

Is there any beta stuff that I can play with now ? If so, where can I
get hold of it ?

I'm very keen to win this comparison and remove VxVM and possibly VxFS
from the Linux environment.

Regards,

-- 
Wayne Pascoe
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
