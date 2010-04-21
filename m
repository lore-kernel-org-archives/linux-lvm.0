Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LFaWam006298
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 11:36:32 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LFaMlc014610
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 11:36:22 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e33.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o3LFWTrc026185
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 09:32:29 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	o3LFa6Es134816
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 09:36:18 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o3L8a117030751
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 02:36:01 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o3L8a0jg030697
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 02:36:01 -0600
Date: Wed, 21 Apr 2010 08:36:00 -0700
From: malahal@us.ibm.com
Message-ID: <20100421153600.GA28675@us.ibm.com>
References: <4BCE79B5.9070600@cajuninc.com>
	<1271859488.23509.3@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1271859488.23509.3@raydesk1.bettercgi.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ray Morris [support@bettercgi.com] wrote:
>     pvmove is good for when you have to keep the machine
> live during the copy.  dd is about 10 times as fast if you
> can be down during the copy.  This specific dd invocation
> is the fastest I've found for the purpose, running 2-3 times
> faster than a simple dd without arguments:
> 
> dd if=/dev/old_vg/$1 bs=64M iflag=direct | dd of=/dev/new_vg/$1 bs=64M  
> oflag=direct

Interesting! You are doing direct I/O to avoid copying from cache to user
buffer for read and vice-versa for write, but you are losing the ability
to do them parallel! You are doing the next best, that is creating two
"dd" threads -- one for reading and another for writing. Since the pipe
is really implemented in memory, why should this be faster than normal
"dd" that uses page cache? Likely that kswapd is not kicking early
enough?

Enhancing "dd" to create a reader and a writer thread would really
help, I believe.

Thanks, Malahal.
