Subject: Re: [linux-lvm] LVM2 setup notes and questions
From: "Nathan G. Grennan" <ngrennan@okcforum.org>
In-Reply-To: <1028495668.1455.44.camel@cygnusx-1.okcforum.org>
References: <1028495668.1455.44.camel@cygnusx-1.okcforum.org>
Content-Transfer-Encoding: 7bit
Message-Id: <1028508427.1702.10.camel@cygnusx-1.okcforum.org>
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
Date: Sun Aug  4 19:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2002-08-04 at 16:14, Nathan G. Grennan wrote:
>   Just got finished making device-mapper 0.96.03 work with RedHat Limbo
> beta2, LVM tools 2.1.95.10, kernel 2.4.19-r7 from gentoo, and raw two
> drives as one physical volume and one logical volume. Ran into a few
> gotchas, but I was able to workaround them all.

  I said this wrong. I meant two physical volumes, one volume group, and
one logical volume.

>   The first problem was with make apply-patches not finding the patches
> because I told it I was using 2.4.19 during configure instead of
> 2.4.19-rc1. I fixed this by changing the version line in the Makefile.
> The second problem was simple rejects during running make apply-patches.
> They were caused by small differences in the gentoo kernel. It only
> required changing a few words on 3 lines. After that I recompiled the
> kernel with device-mapper support. I built a rpm of the device-mapper
> library with checkinstall. Then I moved on to LVM2 tools which gave me a
> number of hassles. After compiling it I used checkinstall to make an rpm
> of it. The first was vgscan and vgchange being linked to readline and
> the readline libraries being in /usr/lib, but rc.sysinit was trying to
> run them before /usr was mounted. At first I didn't read closely and
> staticly linked libdevmapper thinking it would make the whole program
> staticly linked. That didn't help, so I checked ./configure --help again
> and find the option to disable readline. In the middle of this I ran
> devmap_mknod.sh once to setup whatever devices vgscan and vgchange
> wanted. I would suggest a mention in the README about
> --disable-readline. I used --disable-readline and it fixed the library
> problem. Then I had a problem with "setlocale failed". I did a Google
> search and found mention that other programs worked when LANG was LANG=C
> instead of LANG=en_US so I added a workaround to the rc.sysinit. 
> 
> TLANG='$LANG'
> LANG='C'
> 
> before the vgscan and vgchange and
> 
> LANG='$TLANG'
> 
> after.
> 
> I think this may relate to RedHat switching to UTF-8 in Limbo betas and
> at that point in the boot process all of the environment isn't setup.
> The next problem I ran into was a common one of vgscan trying to scan
> cdrom drives at hda and hdc. After reading the man page for lvm.conf and
> doing a little Google searching I figure out the correct format to
> filter both. I think the man page could use some additional examples to
> show the format for more than one filter. The final problem I ran into
> once the volume group was being activated was the device name change
> from /dev/vg/data to /dev/device-mapper/vg-data   So I had to modify it
> in /etc/fstab   I like the change so that all volume devices will be in
> the same directory, it adds consistency.
> 
>   The reason I converted from LVM1 to LVM2 is so that I could recover
> data if one of the drives failed. Since I only don't plan to snapshot or
> move I don't forsee many problems. I do think that the LVM project
> should make the statement of LVM1's lack of recovery of a logical volume
> if one of the drives fails more known and obvious.
> 
>   Now I have some questions. What are the steps involved in recovering
> should either of my drives fail? How do I convert the metadata from LVM1
> format to LVM2 format? Is there a reason I would want to or not want to?


> If I wanted to add a partition on a third drive would it be as simple as
> adding it to the physical volume group and then used parted resize the
> filesystem? Is there a tool in the LVM2 packages that will do the same
> thing that parted does for ext3? 

  I did setup that third partition as a physical volume and added it to
the volume group and the added to to the logical volume. I then tried
using e2fsadm, but it told me it wasn't implemented. So then I tried
resize2fs and it told me to run e2fsck. I ran fsck and it fixed a few
problems. Then I ran resize2fs /dev/device-mapper/vg-data to tell it to
expand to fit. It seems to be working fine. The logical volume is now
104gb :)

> Any bugs known in device-mapper 0.96.03 that would make it a good idea
> to upgrade to the CVS version? Any other things any of you think I should
> know about LVM2?
