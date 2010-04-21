Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LEDa6K012545
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 10:13:37 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LEDQA6026163
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 10:13:27 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1O4ag7-0003kc-UX
	for linux-lvm@redhat.com; Wed, 21 Apr 2010 07:13:24 -0700
Date: Wed, 21 Apr 2010 09:18:08 -0500
From: Ray Morris <support@bettercgi.com>
References: <4BCE79B5.9070600@cajuninc.com>
In-Reply-To: <4BCE79B5.9070600@cajuninc.com> (from cajun@cajuninc.com on Tue
	Apr 20 23:06:13 2010)
Message-Id: <1271859488.23509.3@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Migrating LVM
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

    pvmove is good for when you have to keep the machine
live during the copy.  dd is about 10 times as fast if you
can be down during the copy.  This specific dd invocation
is the fastest I've found for the purpose, running 2-3 times
faster than a simple dd without arguments:

dd if=/dev/old_vg/$1 bs=64M iflag=direct | dd of=/dev/new_vg/$1 bs=64M  
oflag=direct
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 04/20/2010 11:06:13 PM, M.Lewis wrote:
> 
> I'm building a new machine with RAID1+LVM2. I plan to migrate the  
> data from the old machine HD to the new machine.
> 
> Is it better to make the new VG the same name as the existing VG on  
> the old box? Or should I make it different.
> 
> Is there an easy way to do this that I've not yet found? I was  
> thinking to make the new VG the same name as the old, add the old  
> drives to the machine then pvmove the data.
> 
> Thanks for any pointers!
> Mike
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
