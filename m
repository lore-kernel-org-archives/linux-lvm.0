Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2V7cJO16642
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 02:38:19 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2V7cIqs004922
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 02:38:19 -0500
Date: Thu, 31 Mar 2005 09:38:17 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Message-ID: <20050331073816.GD3879@percy.comedia.it>
References: <mailman.11694.1112144246.19557.linux-lvm@redhat.com>
	<c23be1c305032917022b076064@mail.gmail.com>
	<20050330065236.GA18365@percy.comedia.it>
	<c23be1c30503300738690039d8@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c23be1c30503300738690039d8@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 30, 2005 at 11:38:16PM +0800, Andy Sy wrote:
>Luca Berra wrote:
>
>> >Just like the kernel is now able to autodetect and
>> >autoenable md RAID arrays, are there plans to make
>
>> kernel autodetection of md arrays is almost always a 
>> bad idea, it is far better to use mdadm in user space for that.
>
>Why is this necessarily so?   RAID autodetect seems to 
>avoid a lot of configuration hassles especially when your 
>root partition is involved.  Any horror stories to tell?

yes, read the linux-raid mailing list for those, i am tired of beating
the same dead horse.

>> >lvm do the same?  (i.e integrate the functionality
>> >of vgscan / vgchange -ay,-an into the kernel)
>
>> no, it is an user space task, there is no reason to
>> burden the kernel with this.
>
>People have recommended against using an LVM
>volume for your root partition citing the hassle of
>a rescue disk as being the main reason.  If lvm volume
this is just ridicolous fud.
in what cases you would need a rescue disk?
are those really different from the cases you'd need a rescue disk for a
normal partition-table based system.
besides, every live distro on earth now supports lvm and can be used as
a recovery tool.

>autodetect and enabling were in the kernel, then
>this would no longer be the case.
why?

>I have a good reason for wanting my root partition
>to be a logical volume: this is because I can
i have been using my root partition as a logical volume for several
years now.

>Unless lvm detect/enable functionality were built into
>the kernel though, you will always have to live with a 
>physical partition holding /boot - the case today
>with LVM and RAID0, but not RAID1 (from which it is
>possible to boot directly off of).
i don't have a separate partition for /boot on my lvm systems.
the only reason i needed a separate boot partition was when i had a
system using raid5, so i had to have a separate raid1 partition for
booting.
Reading your arguments it appeare you are mis-informed and make a lot of
confusion between a boot loader (which is the only limitation we have in
loading a kernel/initrd/initramfs) and what the kernel can do.

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
