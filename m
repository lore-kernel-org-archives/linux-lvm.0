Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2VNmBO08923
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 18:48:11 -0500
Received: from seeker3.pacific.net.ph (seeker3.pacific.net.ph [210.23.235.106])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2VNm9V6023634
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 18:48:10 -0500
Received: from congo2.pacific.net.ph (congo2.pacific.net.ph [210.23.235.89])
	by seeker3.pacific.net.ph with ESMTP
	id j2VNm7b4009297 for <linux-lvm@redhat.com>;
	Fri, 1 Apr 2005 07:48:07 +0800
Received: from [210.1.105.173] (ppp173.dyn1.105.pacific.net.ph [210.1.105.173]
	(may be forged)) by congo2.pacific.net.ph with ESMTP
	id j2VNm2ko020453 for <linux-lvm@redhat.com>;
	Fri, 1 Apr 2005 07:48:03 +0800 (PHT)
Message-ID: <424C9855.50406@nospam.com>
Date: Fri, 01 Apr 2005 08:39:49 +0800
From: Andy Sy <andy@nospam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Reply-To: andy@neotitans.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Luca Berra wrote:

>> Why is this necessarily so? RAID autodetect seems
>> to avoid a lot of configuration hassles especially
>> when your root partition is involved. Any horror
>> stories to tell?

> yes, read the linux-raid mailing list for those, i
> am tired of beating the same dead horse.

Well, I'm new to Linux raid, perhaps you can point me
to some of the messages referring to such incidents.
I don't seem to see a lot of them on the raid list and
RAID autodetect seems to work well for me (under the 2.4
kernel).

I'll start believing this when I hear that they've
deprecated the RAID autodetect partition type.

What I DO read about a lot are people recommending
against using lvm on their root partition.


>> People have recommended against using an LVM
>> volume for your root partition citing the hassle of
>> a rescue disk as being the main reason.

> this is just ridicolous fud.

Ehrm... just for the record... that recommendation came
from Heinz, the LVM guy, himself:

"having root on a logical volume needs an initrd which
causes hassle in case soemthing goes wrong at boot and you
don't have an emergency boot media with all necessary sw
(i.e. LVM etc.) on it."

http://www.redhat.com/archives/linux-lvm/2003-February/msg00030.html



Like you, though, I disagree with it - as I've explained earlier,
if you can't use LVM on your root partition, what's the point?

> in what cases you would need a rescue disk?
> are those really different from the cases you'd need a
> rescue disk for a normal partition-table based system.
>
> besides, every live distro on earth now supports lvm
> and can be used as a recovery tool.

Although when you say "every live distro on earth", which
parallel earth would that be?

I invite you to download Slax 4.2.0 (the most current
downloadable version of this popular live CD at the time
of your reply), burn it to CD, and let me know if you are
able to find vgchange and vgscan on it.


> i have been using my root partition as a logical volume
> for several years now.

Several years, eh?  Just curious, which distro are you
using?


>> Unless lvm detect/enable functionality were built into
>> the kernel though, you will always have to live with a
>> physical partition holding /boot - the case today
>> with LVM and RAID0, but not RAID1 (from which it is
>> possible to boot directly off of).

> i don't have a separate partition for /boot on my lvm systems.
> the only reason i needed a separate boot partition was when i
> had a system using raid5, so i had to have a separate raid1
> partition for booting.

This sure is news to me.  Which kernel version/boot loader
are you using?  What output do you get when you run 'mount'
or 'cat /proc/mounts' ?


> Reading your arguments it appeare you are mis-informed and
> make a lot of confusion between a boot loader (which is the
> only limitation we have in loading a kernel/initrd/initramfs)
> and what the kernel can do.

With LILO and the lvm in the 2.4 kernel, I am **pretty sure** you
CAN'T boot directly into a lvm root partition.  The kernel (which
is in /boot) *has* to reside in a partition readable by LILO
(i.e. ext2, reiser, RAID 1 md or ataraid but NOT lvm) and be
loaded in from there.

Furthermore, you *have* to make an initrd from which you will have
to run 'vgscan; vgchange -an' from, otherwise the lvm partition will
be invisible to the kernel.  And this is exactly where the hassle
lies and where the rationale comes from for wanting vgscan/vgchange
_functionality_ (not necessarily the programs themselves) in the
kernel like the case with md today.

To reiterate, if lvm incurs as little overhead as it is claimed to,
it makes sense for people to stop using physical partitions and
start using lvm all the time.  That would certainly make Linux more
_friendly_ than XP in this area.



-- 
reply-to: a n d y @ n e o t i t a n s . c o m
