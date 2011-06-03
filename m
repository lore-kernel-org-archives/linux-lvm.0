Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p533JZeT030034
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 23:19:35 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p533JYcL032132
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 23:19:34 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=[10.0.2.103])
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QSKuY-0000Ek-Uw
	for linux-lvm@redhat.com; Thu, 02 Jun 2011 20:19:11 -0700
References: <20110602235621.GL14222@vinvin.dyndns.org>
In-Reply-To: <20110602235621.GL14222@vinvin.dyndns.org>
MIME-Version: 1.0
From: Ray Morris <support@bettercgi.com>
Date: Thu, 02 Jun 2011 22:18:50 -0500
Message-ID: <76225b17-ed28-4432-82c1-ea117ed3581b@email.android.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Mirror: write operations and consistency checking
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

It is safe to use a flash drive. The first generation flash drives had an endurance of only about 50,000 writes, but current devices test better than magnetic disks, lasting for about 51 years of continuous writes. Part of that is better chips. Part is that even inexpensive flash devices now have wear leveling, so it rotates blocks, not writing to the same physical block even if you write to the same logical block.
-- 
Ray Morris
Http://bettercgi.com

vincent <lvmml@vinvin.dyndns.org> wrote:

>Greeting LVM developers and users,
>
>I've been using the LVM mirror on several LVs and for some time now,
>using a core log. I'm tired of the resource intensive initialization on
>each boot, and I'm considering using a flash device as the third disk
>for the mirror's log.
>
>My question is thus: are there some write operations happening onto the
>log while there is no activity on the mirror's files? Is there some
>kind
>of periodic background thread checking for the consistency of the
>mirror
>and writing the status to the log, or is it safe to use a flash disk
>for
>low activity mirrors?
>
>>From what I understood, a bit is used on the log for each region
>(512k-default) on the mirror. Does It means that if a 100M file is
>written on the mirror, the log will be written 200 times on the same
>block? Or is there a queue that holds log write operations and syncs
>them to the log disk periodically to prevent that? That would be nice,
>and even nicer if it was adjustable.
>
>Thanks,
>
>Vincent
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
