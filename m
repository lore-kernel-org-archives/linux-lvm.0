Return-Path: <tack@orion.dok.org>
Date: Fri, 27 Jul 2001 09:02:45 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010727090245.A4262@linux.com>
References: <20010726131928.D1779@linux.com> <20010726134732.A27706@sistina.com> <20010726160701.H1779@linux.com> <20010726151725.A28574@sistina.com> <15201.4293.260605.275782@rigel.oswf.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15201.4293.260605.275782@rigel.oswf.de>; from john@oswf.de on Fri, Jul 27, 2001 at 08:57:09AM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> I cannot comment on reiserfs, because I only use it on my equipment for
> test reasons, but I have LVM on top of a RAID-5 and a RAID-0 up and running

I guess you mean software RAID using md? 

> for more than 140 days on one of our machines. No problems so far, although
> it is still 0.9.1-beta5 and a "rather old" kernel ;-). Maybe it is time to
> upgrade this one, too.

I guess this is the concern: md clearly works when all is going well,
but when somethings goes awry (like, for example, in my case where a
kernel bug in reiserfs caused umount to segfault while it had a lock on
/etc/mtab), is it robust enough?

Are there others on this list who can share their md/lvm experiences use
with me?

Thanks,
Jason.
