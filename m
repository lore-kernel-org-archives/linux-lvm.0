Message-ID: <3826689B.FB07190E@kent.myip.org>
Date: Sun, 07 Nov 1999 21:07:23 -0900
From: Kent Overstreet <kent@kent.myip.org>
MIME-Version: 1.0
Subject: [linux-lvm] Booting
References: <199911080537.AAA29555@e35.msede.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I just subscribed to the list, so this may have been thought of, but I
didn't see it in the archives.

From reading the archives, the biggest (long-term) problem with booting
straight of the LVM is having lilo find the kernel. So how about this:
dedicate the first extant or three for kernel images. Have regular block
files in dev, maybe ex0 etc. When you install a new kernel, just dd the
image to the extant. It would probably take minimal hacking for lilo to
find it. Then, we just move the vgscan and vgchange stuff into the
kernel. Besides, the idea of user-mode utilities being required to find
partitions *REALLY* bugs me. I don't know how i.e. AIX does it, but it
would probably have to have kernel level support for all the basic
scanning stuff. This would also port well to platforms where the kernel
is stored in flashrom or whatever it is (is alpha this way?). Also, we
could keep a compressed root fs image on one of the extants, and use it
like the slackware boot/root disks if something goes wrong (very
useful). We might do something like 2 kernels to an extant (chop it in
half), but it doesn't even really matter that much - 12 meg total out of
an 18 gig drive isn't going to be missed. This also makes it easy to
boot from any root fs you want to, provided a beginning of a pv is where
the bios can get to it. Well, how does it sound? Can it be done? Is it
worth it? This isn't my area of greatest expertise, but this sounds like
it could be a great multi-purpose solution, especially once md and
striping become common (make your root fs a raid 5!).
