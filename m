Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4L7jn5M008347
	for <linux-lvm@redhat.com>; Tue, 21 May 2013 03:45:49 -0400
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4L7jlZN004364
	for <linux-lvm@redhat.com>; Tue, 21 May 2013 03:45:47 -0400
Received: by mail-we0-f175.google.com with SMTP id p60so157446wes.20
	for <linux-lvm@redhat.com>; Tue, 21 May 2013 00:45:47 -0700 (PDT)
Message-ID: <519B2628.1030400@gmail.com>
Date: Tue, 21 May 2013 09:45:44 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CABT_HjprCj1yby3NabrMjrebL-fuhVJQUWKFaJvoLV9Pb5aRag@mail.gmail.com>
In-Reply-To: <CABT_HjprCj1yby3NabrMjrebL-fuhVJQUWKFaJvoLV9Pb5aRag@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM2 Recovery after Filesystem Code Change
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: meLon <earthmelon@gmail.com>

Dne 20.5.2013 19:09, meLon napsal(a):
>
> After noticing warnings saying "Incorrect metadata area header checksum" when
> using pv/lv commands I looked into what could be causing the issue and
> attempted to fix the issue.  I had a HDD with an ext2 /boot partition and an
> LVM containing an encrypted volume.  I ran sfdisk to change the second
> partition's filesystem code to 8e and rebooted.

I think you've made a lot a of mistakes - and probably you've not started with 
the first one you've made here.

"Incorrect metadata area header checksum" usually happens (at least what I've 
seen so far) when multiple machines are playing with LVM2 metadata - i.e.
you export disk into virtual guest - and both - guest and host have the full 
access to metadata (no locking daemon, no clvmd....)

You cannot fix lvm2 reported bug with non-lvm tools i.e. sfdisk.
The 'easy' way for recovery (if you know what you are doing, and you've 
analysed the fault) is to use  vgcfgrestore.


> After rebooting, I was shown an error when I would normally type in my
> encrypted volume's passphrase.  I cannot remember the exact error, but I was
> unable to recover.  I pulled the HDD and installed Linux onto another HDD.
>
> I put the old HDD containing data I would like to recover in another machine
> and tried to see what I could do.  pvscan and lvscan would show a pv, but
> would report the Incorrect metadata area header checksum warning.  I tried to
> mount my /boot partition, but it said something along the lines of "Unknown
> filesystem type LVM.....".  However, if I used *-t ext2*, the /boot partition
> would mount without a problem.  I ran fsck.ext4 (big mistake) on the /boot
> partition which destroyed all of the data on that partition.  The destruction
> of /boot is not important to me, but the steps I took to do it may give some
> insight on my LVM issue.

Running such tools is really bad idea if you do not know what happened.

> At this point, I believe that I accidentally told sfdisk that my /boot was an
> LVM partition which was why I was unable to boot into my os.

The partition type is not really important here for recovery.

> Now I have the HDD  set up and when running pvdisplay I see the HDD, but it
> does not show a VG name and reports it as a "new physical volume".  Because
> it's not assigned to a VG, it does not get placed in /dev/mapper, which means
> I cannot run cryptsetup to unlock the drive.
>
> Any recovery/backup information that I see being used by other people to
> rectify similar situations resided on the drive I am having problems with,
> which makes it impossible for me to use such data for recovery.

I'm not sure how your cryptosetup has looked before - but for 'PV' - you 
always could access metadata are (typically <1MB partition header).
For lvm2 recovery you have to be able to access you PV in unencrypted form,
thus the following suggestion is not handling your encrypted disk.


Metadata are stored in the plain text form - so you could just 'dd' the first 
1MB and then look for the last valid metadata you could find there.
( vgname {  seqno = highest_you_could_find .... }  )
(If the PV would be encrypted you will not be able to find readable text in 
the partition header, so you will know, you need to setup your decryption 
properly first)

If you could find there 'valid' text for reasonable metadata, you could cut 
valid piece i.e. in 'vi' and you may try to use this for:

pvcreate --restorefile mdafile --uuid  pv_uuid_in_mda   /dev/your_hdd
vgcfgrestore --file  mdafile   vgname_you_want_to_restore

However before you start to do this recovery - you should be sure, you know
what you are doing and what you are trying to recover -
so think twice, cut once....

Zdenek

PS: you could try to reach for more interactive help on  freenode  #lvm
