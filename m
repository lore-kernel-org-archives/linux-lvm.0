Return-Path: <andrew@lvadp.fc.hp.com>
Message-Id: <200104161649.f3GGnOu02530@lvadp.fc.hp.com>
Subject: Re: [linux-lvm] What is the the maximum logical volume size? 
In-Reply-To: Message from Andreas Dilger <adilger@turbolinux.com> 
   of "Fri, 13 Apr 2001 18:28:23 MDT." <200104140028.f3E0SNqE014656@webber.adilger.int> 
Mime-Version: 1.0
Date: Mon, 16 Apr 2001 10:49:24 -0600
From: Andrew Patterson <andrew@lvadp.fc.hp.com>
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
Cc: andrew@lvadp.fc.hp.com

In your message on you write:
> Andrew PAtterson writes:
> > I am tring to figure out what the maximum logical volume size is.
> 
> It may be 1 TB or it may be 2TB.  Depends on whether all of the code
> in use use uses unsigned longs for block numbers, or if some use signed
> longs.  2TB is the outer limit for now (unless you start playing games
> inside LVM, to have 4kB hard sector size, and remap to the disk 512 byte
> sector size).
> 
> Does it really matter?  This is PER LV, 

What does "PER" mean?

so if you really need to have an
> LV that large, give it a try and let us know what works.  I've seen a
> report of someone with a 1 TB device (some kind of HW RAID, not LVM)
> under Linux, so I know that works, but I haven't seen larger yet.

Okay, I'll give it a try.  

> 
> I wouldn't want to be keeping all of my eggs in such a large basket.  I'd
> much rather have several smaller filesystems, especially since you STILL
> need to fsck on occasion (don't let reiserfs journaling fool you, you can
> still have SW/HW problems that will corrupt the filesystem).

I agree with you, but I am not the sys-admin for the person who wants
this capability.

Thanks,

Andrew
