Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011280045.eAS0jVu12766@webber.adilger.net>
Subject: Re: [linux-lvm] vgscan question
In-Reply-To: <Pine.LNX.4.21.0011271803590.7077-100000@zeke.goatskin.org>
 "from Shane Shrybman at Nov 27, 2000 06:14:01 pm"
Date: Mon, 27 Nov 2000 17:45:31 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-lvm mailing list <linux-lvm@msede.com>

Shane writes:
> I have three ide disks on my machine, hda, hdb, hdd. I
> am using LVM 0.8 on hdb and hdd, (actually on partitions on
> those disks).
> If I remove hda and hdc(cdrom) from the machine will vgscan
> still find all my volume groups on the remaining disks
> that are now hda and hdc?

It _should_ work, but why not simply unplug the drives, reboot, and
see what happens when you run vgscan again...

> If not what is the correct procedure for this type of thing?

Failing that, you should be able to vgexport the volume group, and vgimport
it again, unless it is your root partition.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
