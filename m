Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j31HfPO14358
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 12:41:25 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j31HfOTw001455
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 12:41:24 -0500
Date: Fri, 1 Apr 2005 19:41:22 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Message-ID: <20050401174122.GA26517@percy.comedia.it>
References: <424C9855.50406@nospam.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424C9855.50406@nospam.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Apr 01, 2005 at 08:39:49AM +0800, Andy Sy wrote:
>Luca Berra wrote:
>
>>> Why is this necessarily so? RAID autodetect seems
>>> to avoid a lot of configuration hassles especially
>>> when your root partition is involved. Any horror
>>> stories to tell?
>
>> yes, read the linux-raid mailing list for those, i
>> am tired of beating the same dead horse.
>
>Well, I'm new to Linux raid, perhaps you can point me
>to some of the messages referring to such incidents.
>I don't seem to see a lot of them on the raid list and
>RAID autodetect seems to work well for me (under the 2.4
>kernel).

i could quote Neil Brown back in july 2001

"autorun/autodetect just doesn't belong in the kernel.  It should be
done in user space.  The only time the kernel should assemble a raid
array itself is for the root device, and this is best done with
md=0,/dev/whatever,etc

If I could start with a clean slate, I would rip out the autodetect
stuff completely.  But lots of people are depending on it so I cannot."

anyway the major issues are:
1) raid autodetect uses only the minor number stored in the superblock
to identify the array components, move a disk from a different machine
to yours and reboot it to enjoy the show
2) raid autodetect will try to start everything it finds, it will not
scale with shared storage, or other complex configurations

>I'll start believing this when I hear that they've
>deprecated the RAID autodetect partition type.

the partition type does not need to be changed

>What I DO read about a lot are people recommending
>against using lvm on their root partition.
Informed people?

>>> People have recommended against using an LVM
>>> volume for your root partition citing the hassle of
>>> a rescue disk as being the main reason.
>
>> this is just ridicolous fud.
>
>Ehrm... just for the record... that recommendation came
>from Heinz, the LVM guy, himself:
>
>"having root on a logical volume needs an initrd which
>causes hassle in case soemthing goes wrong at boot and you
>don't have an emergency boot media with all necessary sw
>(i.e. LVM etc.) on it."

yes, since then initrd has become a standard, but i agree "if you dont'
have ...."

just make sure you do and you are set.


>Like you, though, I disagree with it - as I've explained earlier,
>if you can't use LVM on your root partition, what's the point?
>
>> in what cases you would need a rescue disk?
>> are those really different from the cases you'd need a
>> rescue disk for a normal partition-table based system.
>>
>> besides, every live distro on earth now supports lvm
>> and can be used as a recovery tool.
>
>Although when you say "every live distro on earth", which
>parallel earth would that be?
>
>I invite you to download Slax 4.2.0 (the most current
>downloadable version of this popular live CD at the time
>of your reply), burn it to CD, and let me know if you are
>able to find vgchange and vgscan on it.

never tried slax, actually, i spoke to fast.
just find one that does and you are correct.

>> i have been using my root partition as a logical volume
>> for several years now.
>
>Several years, eh?  Just curious, which distro are you
>using?
Mandrakelinux at the moment, i maintain the lvm2, mdadm and mkinitrd rpm
packages for mandrakelinux.
i used a customized redhat before this.

>>> Unless lvm detect/enable functionality were built into
>>> the kernel though, you will always have to live with a
>>> physical partition holding /boot - the case today
>>> with LVM and RAID0, but not RAID1 (from which it is
>>> possible to boot directly off of).
>
>> i don't have a separate partition for /boot on my lvm systems.
>> the only reason i needed a separate boot partition was when i
>> had a system using raid5, so i had to have a separate raid1
>> partition for booting.
>
>This sure is news to me.  Which kernel version/boot loader
>are you using?  What output do you get when you run 'mount'
>or 'cat /proc/mounts' ?
that server is no more, i still don't understand what strange things i
said.


>> Reading your arguments it appeare you are mis-informed and
>> make a lot of confusion between a boot loader (which is the
>> only limitation we have in loading a kernel/initrd/initramfs)
>> and what the kernel can do.
>
>With LILO and the lvm in the 2.4 kernel, I am **pretty sure** you
>CAN'T boot directly into a lvm root partition.  The kernel (which
>is in /boot) *has* to reside in a partition readable by LILO
>(i.e. ext2, reiser, RAID 1 md or ataraid but NOT lvm) and be
>loaded in from there.
lilo does not read a partition
all that lilo needs is to be able to create a mapping from a file to the
physical sectors on the drive, and guess the BIOS id of that drive.
LVM1 support has been integrated in lilo a long time ago, there are lvm2
patches around as well.

>Furthermore, you *have* to make an initrd from which you will have
>to run 'vgscan; vgchange -an' from, otherwise the lvm partition will
>be invisible to the kernel.  And this is exactly where the hassle
>lies and where the rationale comes from for wanting vgscan/vgchange
>_functionality_ (not necessarily the programs themselves) in the
>kernel like the case with md today.

I insist initrd is not an hassle, it is good programming practice.
this means code separation between kernel-space and user space, and the
linux kernel is moving _that_ way.

>To reiterate, if lvm incurs as little overhead as it is claimed to,
>it makes sense for people to stop using physical partitions and
>start using lvm all the time.  That would certainly make Linux more
>_friendly_ than XP in this area.

this has nothing to do with the argument you are making.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
