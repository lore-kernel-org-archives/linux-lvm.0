Date: Mon, 8 Nov 1999 09:13:04 +0100
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] Booting
Message-ID: <19991108091304.A22527@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <199911080537.AAA29555@e35.msede.com> <3826689B.FB07190E@kent.myip.org>
Mime-Version: 1.0
In-Reply-To: <3826689B.FB07190E@kent.myip.org>; from kent@kent.myip.org on Sun, Nov 07, 1999 at 09:07:23PM -0900
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kent Overstreet <kent@kent.myip.org>
Cc: linux-lvm@msede.com

Kent Overstreet (kent@kent.myip.org) wrote :

> I just subscribed to the list, so this may have been thought of, but I
> didn't see it in the archives.
> 
> From reading the archives, the biggest (long-term) problem with booting
> straight of the LVM is having lilo find the kernel. So how about this:
> dedicate the first extant or three for kernel images. Have regular block
> files in dev, maybe ex0 etc. When you install a new kernel, just dd the
> image to the extant. It would probably take minimal hacking for lilo to

this is the way e.g. Alpha boots from SRM loader. You have some part (preferrably in the beginning) of the disk dedicated for kernel and loader boots from there. But I'm definitely not sure whether this is a good idea. if you run 'file' on kernel image you find out that it's an x86 (e.g.) bootsector so taken pure theoretically you can boot from the disk if you change root device accordingly. But the problem is not kernel but root partition.

Two solutions appear in my mind (I guess it's official solutions for using LVM):
1) use initrd with minimal support (modules, LVM utils and basic libs)
2) use some small (20MB) partition with content as above.

Decide and read HOWTOs

> find it. Then, we just move the vgscan and vgchange stuff into the
> kernel. Besides, the idea of user-mode utilities being required to find
> partitions *REALLY* bugs me. I don't know how i.e. AIX does it, but it
> would probably have to have kernel level support for all the basic
> scanning stuff. This would also port well to platforms where the kernel
> is stored in flashrom or whatever it is (is alpha this way?). Also, we
> could keep a compressed root fs image on one of the extants, and use it
> like the slackware boot/root disks if something goes wrong (very
> useful). We might do something like 2 kernels to an extant (chop it in
> half), but it doesn't even really matter that much - 12 meg total out of
> an 18 gig drive isn't going to be missed. This also makes it easy to
> boot from any root fs you want to, provided a beginning of a pv is where
> the bios can get to it. Well, how does it sound? Can it be done? Is it
> worth it? This isn't my area of greatest expertise, but this sounds like
> it could be a great multi-purpose solution, especially once md and
> striping become common (make your root fs a raid 5!).

-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
