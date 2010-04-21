Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LGRccW021412
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:27:38 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LGRPjQ022426
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:27:25 -0400
Message-ID: <4BCF276A.1040907@cfl.rr.com>
Date: Wed, 21 Apr 2010 12:27:22 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BCE79B5.9070600@cajuninc.com>	<1271859488.23509.3@raydesk1.bettercgi.com>
	<20100421153600.GA28675@us.ibm.com>
In-Reply-To: <20100421153600.GA28675@us.ibm.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/21/2010 11:36 AM, malahal@us.ibm.com wrote:
> Interesting! You are doing direct I/O to avoid copying from cache to user
> buffer for read and vice-versa for write, but you are losing the ability
> to do them parallel! You are doing the next best, that is creating two
> "dd" threads -- one for reading and another for writing. Since the pipe
> is really implemented in memory, why should this be faster than normal
> "dd" that uses page cache? Likely that kswapd is not kicking early
> enough?

Oops, my eyes missed the pipe and second dd when I made my previous
comments.  That is pretty good for different disks then yes... not so
good for same physical disk.

> Enhancing "dd" to create a reader and a writer thread would really
> help, I believe.

I actually have some old hacked up dd code I made once to use 16
concurrent aio requests with O_DIRECT.  I need to clean it up a bit but
it showed great promise.
