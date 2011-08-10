Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7AJsaaH026565
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 15:54:36 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7AJsZOo028187
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 15:54:36 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QrErK-0004rY-Ly
	for linux-lvm@redhat.com; Wed, 10 Aug 2011 12:54:34 -0700
Date: Wed, 10 Aug 2011 14:54:33 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110810145433.4105bb6a@bettercgi.com>
In-Reply-To: <CAMN6oRmKSkiBqLwGjVyCFnoqGPbQYk=TTukFO_GdKO-M3FdcMw@mail.gmail.com>
References: <CAMN6oRmKSkiBqLwGjVyCFnoqGPbQYk=TTukFO_GdKO-M3FdcMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Securing against data lost
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
To: linux-lvm@redhat.com

Obviously the number one answer on how to prevent data loss
is PROPER back up. That means off site, with multiple time 
points, so you can go back to an earlier back up if you 
recognize  problem a couple of days later.

> What happens if I accidental destroys the LVM information?

You use vgcfgrestore.

> What happens if the first disk fails do I lose everything on the two
> second disk too?

When a disk fails (not if) you replace it and rebuild the array.

Not using any RAID _and_ don't have a proper back up? In that 
case, retrieving the files from the other two disks could be a 
pain. It would be essentially the same thing as if you ran this 
to zero the first third of a filesystem:

dd if=/dev/zero of=/dev/sda2 bs=1024 count=66000000

You could probably restore some files from the last 2/3rds 
of the filesystem, but that would be a question for people 
who know about whatever filesystem was in use.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 10 Aug 2011 13:40:05 +0200
Sun_Blood <sblood@gmail.com> wrote:

> Hi
> 
> Hope someone have time to answer this because google is not giving me
> the answers I need.
> 
> I have just started to use LVM(a few years later then everyone) and
> I'm wondering how I can protect my self from failure to the LVM setup.
> Before when I had for example 3 harddisk at 200gb each (/dev/sd[b-d])
> with one partition each and a disk failed I would maximum lose 200gb.
> Now with LVM the LV is 600gb I'm worried that I can loose all if one
> disk have a problem.
> 
> So how can I protect myself from this?
> What happens if I accidental destroys the LVM information?
> What happens if the first disk fails do I lose everything on the two
> second disk too?
> 
> Best regards
> Martin
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
