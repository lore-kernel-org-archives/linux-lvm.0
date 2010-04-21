Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LGOsTw022763
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:24:54 -0400
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LGOf1N022694
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 12:24:41 -0400
Message-ID: <4BCF26C6.2000205@cfl.rr.com>
Date: Wed, 21 Apr 2010 12:24:38 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BCE79B5.9070600@cajuninc.com>
	<1271859488.23509.3@raydesk1.bettercgi.com>
In-Reply-To: <1271859488.23509.3@raydesk1.bettercgi.com>
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
Cc: Ray Morris <support@bettercgi.com>

On 4/21/2010 10:18 AM, Ray Morris wrote:
>    pvmove is good for when you have to keep the machine
> live during the copy.  dd is about 10 times as fast if you
> can be down during the copy.  This specific dd invocation
> is the fastest I've found for the purpose, running 2-3 times
> faster than a simple dd without arguments:
> 
> dd if=/dev/old_vg/$1 bs=64M iflag=direct | dd of=/dev/new_vg/$1 bs=64M
> oflag=direct

What arguments are best depend on many factors.  These particular ones
should be rather good if the src and and dest volumes are on the same
physical disk.  It would not be very good if they are on different
disks, since while dd is reading from the source, the output disk is
idle, and vice versa.  If src and dest are different disks, then you
want to not use direct, and stick with a more reasonable block size, say
64k.

Also if the fs has much free space in it then dd will waste a lot of
time on that.  You probably would save a lot of time doing something
like dump | restore.  This also does not require that the source and
destination be the same size.
