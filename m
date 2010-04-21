Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LGuIQ9028690
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:56:18 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LGu9BP028851
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:56:09 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1O4dDW-0003GL-3C
	for linux-lvm@redhat.com; Wed, 21 Apr 2010 09:56:03 -0700
Date: Wed, 21 Apr 2010 12:00:46 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4BCF276A.1040907@cfl.rr.com> (from psusi@cfl.rr.com on Wed Apr
	21 11:27:22 2010)
Message-Id: <1271869246.10836.0@raydesk1.bettercgi.com>
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

> Oops, my eyes missed the pipe and second dd when I made my previous
> comments.  That is pretty good for different disks then yes... not
> so good for same physical disk.

    Indeed my tests were done copying from the "old" disk
to the "new" disk, as the OP is doing, I believe.

> I actually have some old hacked up dd code I made once to use 16
> concurrent aio requests with O_DIRECT.  I need to clean it up a
> bit but it showed great promise.

    Considering how often "dd" is used for copying large amounts
of data, even a modest improvement could save many thousands of
hours of admin time.  I would like to encourage you to do any
needed cleanup and make it available, preferably integrated with
GNU dd - it could save hundreds of thousands of dollars worth of
time.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 04/21/2010 11:27:22 AM, Phillip Susi wrote:
> On 4/21/2010 11:36 AM, malahal@us.ibm.com wrote:
> > Interesting! You are doing direct I/O to avoid copying from cache  
> to user
> > buffer for read and vice-versa for write, but you are losing the  
> ability
> > to do them parallel! You are doing the next best, that is creating  
> two
> > "dd" threads -- one for reading and another for writing. Since the  
> pipe
> > is really implemented in memory, why should this be faster than  
> normal
> > "dd" that uses page cache? Likely that kswapd is not kicking early
> > enough?
> 
> Oops, my eyes missed the pipe and second dd when I made my previous
> comments.  That is pretty good for different disks then yes... not so
> good for same physical disk.
> 
> > Enhancing "dd" to create a reader and a writer thread would really
> > help, I believe.
> 
> I actually have some old hacked up dd code I made once to use 16
> concurrent aio requests with O_DIRECT.  I need to clean it up a bit  
> but
> it showed great promise.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
