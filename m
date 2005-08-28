Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7S0lTV13864
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 20:47:29 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7S0lM1c031116
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 20:47:22 -0400
Received: by wproxy.gmail.com with SMTP id i2so565488wra
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 17:47:16 -0700 (PDT)
Message-ID: <fa61edfd050827174765d2f3ae@mail.gmail.com>
Date: Sun, 28 Aug 2005 10:47:16 +1000
From: Chris Jensen <cjensen@gmail.com>
Subject: Re: [linux-lvm] Saving files from full failing volume
In-Reply-To: <1125154737.2225.54.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <fa61edfd0508200022235af787@mail.gmail.com>
	<1124806695.17889.22.camel@bats.omnifarious.org>
	<fa61edfd05082706007d36d221@mail.gmail.com>
	<1125154737.2225.54.camel@pc7.dolda2000.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> With a larger budget, you could buy double disk space and mirror the
> volume (similar to RAID10). Depending on your budget, though, I guess
> that may well not be possible.

It's for personal use, so I don't have that budget - if I did, then I
wouldn't be scrounging for recovery space in the first place :-)

So it seems, unless the data on the partition is without value, or you
can afford enough disks to setup mirroring, I'd be better off just
paritioning the two disks sepeartely and using a sym link farm!

Damn, I was looking forward to playing with LVM.

Chris
