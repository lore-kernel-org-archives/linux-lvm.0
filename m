Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBMKd4Cd005329
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 15:39:04 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBMKcsXU003094
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 15:38:54 -0500
Received: by qwa26 with SMTP id 26so5393204qwa.33
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 12:38:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1293047716.10784.28.camel@corn.betterworld.us>
References: <1293047716.10784.28.camel@corn.betterworld.us>
Date: Wed, 22 Dec 2010 14:38:53 -0600
Message-ID: <AANLkTi=5Y0a+i89SwwgbzKVMDLjRg-nEoCYqtpH1zH3b@mail.gmail.com>
From: Richard Shaw <hobbes1069@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] dealing with a failing drive (esp pvmove)
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Dec 22, 2010 at 1:55 PM, Ross Boylan <ross@biostat.ucsf.edu> wrote:
> I have a volume group made from 3 partitions on 2 different physical
> disks. �One of the disks is failing. �I have a new disk connected via
> USB; it is large but a bit slow (5400RPM, though the USB might be
> temporary). �It is large enough to hold the entire contents of the
> existing VG.
>
> I am looking for suggestions about how to �approach this. �The pvmove
> command looks promising, but the docs warn that things are in a delicate
> state during the migration (and advise backups). �Since it seems almost
> certain there will be I/O errors on the old drive, I'm not sure if
> pvmove is a good idea. �Is it?

I can't find consistent information but I think you're on the right
path. It will try to copy all the data. I'm not sure how it deals with
errors. If you can get it to continue through errors you should get
all the files/extents possible.You'll definitely need to fsck it
afterwards.

Using this link[1] as a guide, I think the general process would be
something like this:
vgextend /dev/<new_disk>
pvmove /dev/<old_disk>
vgreduce <vol_group> /dev/<old_disk>


> Alternately, I could do a file system level rsync, but I would probably
> need to boot into an alternate system for the last step and there are
> quite a few LVs.

This would keep the existing data on the old drive so you could get
more than one go at it, but I think that's about it.

The only other option I can think of would be to do a clone of your
old drive/partition (i.e. Clonezilla or similar). I haven't used it
though so I don't know if it can resize a LV on restore or not.

I'm not sure how LVM will handle that though. The disk UUID will be
different but the partition (PV) UUID will be the same as the old PV.
I'm not sure if LVM uses both or just the partition UUID.


> BTW, any advice on partitioning the new drive? �I know I could just use
> the whole physical device, but I'm concerned that if I want to boot
> using the disk, or install another (non-Linux) OS that I'll need more
> traditional partitions on the drive. �My first cut was to create a GPT
> partitioning scheme with a 1G blank paritition and partition 2 holding
> the rest of the 2TB for LVM. �Linux is my primary OS.

That should be fine as long as everything you plan to use with it
supports GPT partitions. Also keep in mind that if you use GPT w/ dos
compatibility you're limited to 4 partitions total.

Richard
