Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Is now: Resizing & LVM shutdown
Date: Thu, 24 May 2001 19:01:53 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJAENPIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200105240346.f4O3knD02189@dixie.dyndns.org>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of S. Michael Denton
>
> Yes, the docs say that online ext2 resizing is dangerous, but I think
> it's just that the docs haven't been updated in some time :)
> I've done several online ext2 resizes (before going to reiser) and they've
> all been successful.  The only real danger lies in a crash during a resize
> in progress (not a whole lot you can do with ANY filesystem there... just
> hope everything is journaled properly and can be recovered).  Personally,
> I just ignore the warning that it's 'dangerous' :)

Yes, and the phrase "everything is journaled properly" is important.
I know for sure that ReiserFS *only* journals metadata.
I've *heard* that ext3 journals "everything" including data blocks.
Anyone know about XFS?

Personally, I think that only journalling metadata is *dangerous*...
after all, the filesystem *looks* just dandy but data in files
could well be corrupted and you'll never know until things
start crashing in an apparent attempt to imitate Windoze...
