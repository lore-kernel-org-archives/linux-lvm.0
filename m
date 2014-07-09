Received: from [10.13.215.64] (unused [10.13.215.64] (may be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s69GkID5024688
	for <linux-lvm@redhat.com>; Wed, 9 Jul 2014 12:46:18 -0400
Message-ID: <53BD71DA.7000801@redhat.com>
Date: Wed, 09 Jul 2014 12:46:18 -0400
From: Jack Waterworth <jack@redhat.com>
MIME-Version: 1.0
References: <CAAWpFTHEnzeC_K5WGwbUjaw8JE54AF8NAbfnQkHF0k=PysS=rw@mail.gmail.com>
In-Reply-To: <CAAWpFTHEnzeC_K5WGwbUjaw8JE54AF8NAbfnQkHF0k=PysS=rw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2 conf on boot disk
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

There is no way to do an in-place convert from a partitioned device to 
LVM without losing data. I would recommend adding a new disk, reinstall 
the OS on the new disk with LVM, and then moving over any data that was 
required after installation.

You may be able to do this in rescue mode within a chrooted environment, 
but things could get messy. Add the new device, build the lvm stack, 
copy over the data then chroot into the NEW lvm root. Mount everything 
appropriately, recreate the initrd and re-install grub onto the new 
disk.  Go in with the expectation that you may be fixing things after 
the reboot from rescue mode.

   Jack Waterworth, RHCE
   Senior Technical Support Engineer
   Red Hat Global Support Services
   919.610.2024 -- jack@redhat.com

On 07/08/2014 05:56 AM, Alfredo De Luca wrote:
> Hi all.
> I have red hat 5.7 with no lvm2 installed. Now I want to configure
> lvm2 on the root and swap partition then later on adding a couple of
> LUNs to create a VG
> What's the best practice/procedure to install lvm2 on the boot disk?
> Is it possible? I guess I have to run Linux CD in rescue mode
>
> Regards
>
>
