Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7S1ljV19729
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 21:47:45 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7S1lXI2006665
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 21:47:38 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j7S1lW8g009427
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 03:47:32 +0200
Subject: Re: [linux-lvm] Saving files from full failing volume
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <fa61edfd050827174765d2f3ae@mail.gmail.com>
References: <fa61edfd0508200022235af787@mail.gmail.com>
	<1124806695.17889.22.camel@bats.omnifarious.org>
	<fa61edfd05082706007d36d221@mail.gmail.com>
	<1125154737.2225.54.camel@pc7.dolda2000.com>
	<fa61edfd050827174765d2f3ae@mail.gmail.com>
Date: Sun, 28 Aug 2005 03:47:31 +0200
Message-Id: <1125193651.2225.60.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sun, 2005-08-28 at 10:47 +1000, Chris Jensen wrote:
> > With a larger budget, you could buy double disk space and mirror the
> > volume (similar to RAID10). Depending on your budget, though, I guess
> > that may well not be possible.
> 
> It's for personal use, so I don't have that budget - if I did, then I
> wouldn't be scrounging for recovery space in the first place :-)

I guessed that. :)

> So it seems, unless the data on the partition is without value, or you
> can afford enough disks to setup mirroring, I'd be better off just
> paritioning the two disks sepeartely and using a sym link farm!

You may at least want to look into software RAID. The disadvantage is
that you cannot change the configuration of a S/W RAID array once you
have created it, and all the disks need to be the same size, but you can
get much cheap redundancy by using RAID 5. The end line is, of course,
that to get redundancy, you will always need at least one extra disk,
but RAID 5 at least only requires _one_ extra disk, and no more.

I have the same problem myself, though. To the LVM devs: Could there
possibly not be a way to create the like of RAID 5 in LVM, and also make
it extensible (i.e. that it has the ability to be extended by more
disks) as LVM already is?

Fredrik Tolf
