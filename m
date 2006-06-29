Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TFrnVO028259
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 11:53:49 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TFrksI026592
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 11:53:46 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 62CED1F4218
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 17:53:35 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24388-03 for <linux-lvm@redhat.com>;
	Thu, 29 Jun 2006 17:53:26 +0200 (CEST)
Message-ID: <44A3F773.5040800@conterra.de>
Date: Thu, 29 Jun 2006 17:53:23 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and fstab
References: <44A3DF57.4080003@gmail.com>
In-Reply-To: <44A3DF57.4080003@gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

ThomasC. wrote:
> I am using RHEL3.
> I have been reading the LVM howto and it is very clear but i am missing
> something anyways.
> During the setup with DiskDruid i created a Volume group and two logical
> volumes.
> One LV for /opt and another one for /stage.
> After rebooting the OS i don't have any /stage partition.

initializing LVM is a multi stage process.

1. create the volume

2. create LVs within the volume.

3. format the LVs i.e. with "mke2fs"

4. copy data to the LVs

5. register the LVs with /etc/fstab to have them
   available by default after each boot.

Don't know what "DiskDruid" is, but it seems it did not
perform steps 4 and 5 automatically. May be you have to
perform them by hand.

Todo:

Verify step 2) by entering "lvs" to get a list of all your
LVs created. Try to mount one of your LVs manually.
i.E. try "mount /dev/Volume00/LogVol00 /mnt" (if your
LV is named "LogVol00", else choose the name the "lvs"
command told you). If you get an error, you should try to
format the LV by "mke2fs". Else you may look into /mnt
if there is already some data (you should find an empty
lost+found directory).

If there is no data, you may copy all your /opt to /mnt.
Use: "cp -av /opt/* /mnt". Now you may umount /mnt.
You may rename your current /opt into /opt-old and
create a new empty /opt directory, then try:
"mount /dev/Volume00/LogVol00 /opt".

If all looks good, you should add a line to your /etc/fstab
to get /opt mounted by default. Test the entry by umounting
your /opt again ("umount /opt") and try a "mount -a", which
mounts all entries from /etc/fstab. If all works well, you will
find /opt mounted again without any error messages.

Now you may try to reboot.

Same for /stage...

Tip:

If your "DiskDruid" named your volumes /dev/Volume00/LogVol00
this is OK, but a big feature of LVM is, that the LV may have
expressive names. So it may find it useful to "rename" your 
/dev/Volume00/LogVol00 into "/dev/Volume00/OPT".

See: "man lvrename". 

Dieter
