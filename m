Return-Path: <tack@linux.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
From: Jason Tackaberry <tack@linux.com>
In-Reply-To: <20010726232453.A1209@btconnect.com>
References: <20010726131928.D1779@linux.com> 
	<20010726232453.A1209@btconnect.com>
Content-Transfer-Encoding: 7bit
Date: 26 Jul 2001 17:44:35 -0400
Message-Id: <996183877.5581.3.camel@andromeda>
Mime-Version: 1.0
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

> This was a stupid thing to do; and yes we should probably check to see

Indeed.  I didn't realize the partition was still mounted (I had left
the system and come back to it some time later).  Of course it should
fail, but not that bad. :)

> pvcreate would have stamped it's own metadata over md's metadata, so
> I'm not surprised md had trouble.  This is not a bug in md or
> reiserfs, just user error that LVM should have caught.

With respect to the problem I had with /etc/mtab: the root partition is
not handled by LVM at all.  It is strictly a md device.  I assume
/etc/mtab got hosed when umount segfaulted (because of the ReiserFS
bug).  But the root partition (and /etc on the root partition) is
md/raid1 with ext2.  This seems to me to be a real md bug.  What do you
think?

Thanks,
Jason.
