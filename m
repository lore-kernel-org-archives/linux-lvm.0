Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5L9xSj2032686
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 10:59:28 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BcLaL-0004fU-KC
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 10:59:29 +0100
Date: Mon, 21 Jun 2004 10:59:29 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] lvm2 install problem
Message-ID: <20040621095929.GF12027@tykepenguin.com>
References: <freemail.20040521100005.60543@fm7.freemail.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <freemail.20040521100005.60543@fm7.freemail.hu>
Sender: Patrick <patrick@tykepenguin.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jun 21, 2004 at 10:00:05AM +0200, Moha Snipa1 wrote:
> hello,
> 
> i have a problem when I try to install the LVM2!
> well, I use a 2.6.7 kernel with device mapper support...
> I have installed device-mapper.1.00.07 and now i try to install LVM2.2.
> 00.16 but I get this error message!
> 
> 
> gcc -c -I. -I../include -DLVM1_INTERNAL -DSNAPSHOT_INTERNAL 
> -DMIRRORED_INTERNAL -DDEVMAPPER_SUPPORT -DO_DIRECT_SUPPORT 
> -DHAVE_LIBDL -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow 
> -Wcast-align -Wwrite-strings -Wmissing-prototypes 
> -Wmissing-declarations -Wnested-externs -Winline -O2 cache/lvmcache.
> c -o cache/lvmcache.o
> activate/activate.c: In function `target_present':
> activate/activate.c:302: `DM_DEVICE_LIST_VERSIONS' undeclared (first 
> use in this function)
> activate/activate.c:302: (Each undeclared identifier is reported only once
> activate/activate.c:302: for each function it appears in.)

Sounds like a missing or out-of-date device-mapper.

patrick
