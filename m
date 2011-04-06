Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p368rBMw030002
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 04:53:11 -0400
Received: from ns.mindbit.ro (ns.mindbit.ro [80.86.127.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p368r5tP004876
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 04:53:07 -0400
Received: from [192.168.243.1] ([193.39.73.67]) (authenticated bits=0)
	by ns.mindbit.ro (8.13.8/8.13.8) with ESMTP id p368r3Uu024968
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 11:53:04 +0300
From: Radu Rendec <radu.rendec@mindbit.ro>
In-Reply-To: <4D9A9E2A.7070106@diala.gl3>
References: <4D9A9E2A.7070106@diala.gl3>
Date: Wed, 06 Apr 2011 11:53:03 +0300
Message-ID: <1302079983.27047.454.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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

On Tue, 2011-04-05 at 16:44 +1200, Jan Bakuwel wrote:
> I've used LVM2 for years without any issue. I recently diagnosed a
> problem with a Windows XP virtual machine running on a Debian Lenny Xen
> dom0. After getting reports of stability problems and unexpected
> crashes, I restored the VM from a image backup that is known to work. To
> my surprise, that image also was crashing unexpectingly. After much
> trial and error, I decided to create a new LV and restore the image to
> the new LV (rather than using the existing LV). My surprise was even
> bigger when that turned out to be the solution: the Windows XP VM has
> been running fine since.

Hi,

I can report a strikingly similar issue *but* I'm pretty sure it's not a
LVM issue - read below for the full details of what I did.

I've recently migrated a bunch of vmware machines to xen hvm. All of the
vmware machines were originally cloned from the same image, so they were
almost identical. I applied the exact same migration procedure on all of
them. All started fine on xen, except for just one.

For that machine that didn't started, I've repeatedly copied the vmware
image and converted it to raw data using qemu-img, but with no success:
the machine just wouldn't boot.

Then I saw your post, created a new LVM volume, converted *exactly the
same* vmware image to raw data in the new volume and - to my surprise -
the machine booted just fine.

So far I think this is exactly what you experienced. But I went one step
further: I zero'ed the original LVM volume (the one that didn't boot)
with dd if=/dev/zero of=... then converted the vmware image again with
qemu-img. Surprisingly, the machine booted.

So I came up with this theory:
* vmware images (vmdk) are "sparse" images (they only contain the blocks
that have been written at least once by the guest os - all other blocks
would read "0" until they are first written);
* when I used qemu-img to convert the vmware images, only the
"allocated" blocks in the sparse image were written to the LVM volume,
leaving the other blocks unchanged;
* for the guest os in xen, the "unused" blocks would no longer read "0",
they would read whatever data was previously there in the LVM volume;
* the disks in my machine *had* been used before, so I'm pretty sure
that my LVM volumes initially contained some "random junk".

Creating a new LVM volume has the side effect of being "clean". So I'm
pretty sure that the problem is not the LVM volume itself, but the data
that it contains before restoring a sparse image to it. I also believe
that "cleaning" the *same* lvm volume with dd prior to restoring the
image would have worked just as well for you.

Now the only question that's left to be answered is why the heck a
windows xp guest (yes, my guest machines are windows xp too) would crash
(or not even boot) when there is some particular data left in the
*unallocated* filesystem blocks. But since I have a "certain" opinion
about microsoft and their products, I just think that life is too short
to bother yourself with this kind of crap.

I hope this helps you debug the issue you had. It would also be
interesting if you could try to zero the *original* LVM volume (the one
that didn't work) and then restore the image once again and see if it
works. It would prove (or disprove) my theory :)

Best regards,

Radu Rendec
