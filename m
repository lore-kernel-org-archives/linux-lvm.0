Return-Path: <mike@marxmeier.com>
Date: Tue, 28 Nov 2000 23:24:01 -0500 (EST)
From: Shane Shrybman <shane@zeke.yi.org>
Subject: Re: [linux-lvm] vgscan question
In-Reply-To: <200011280045.eAS0jVu12766@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0011282321170.7077-100000@zeke.goatskin.org>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-lvm mailing list <linux-lvm@msede.com>

On Mon, 27 Nov 2000, Andreas Dilger wrote:

> Shane writes:
> > I have three ide disks on my machine, hda, hdb, hdd. I
> > am using LVM 0.8 on hdb and hdd, (actually on partitions on
> > those disks).
> > If I remove hda and hdc(cdrom) from the machine will vgscan
> > still find all my volume groups on the remaining disks
> > that are now hda and hdc?
> 
> It _should_ work, but why not simply unplug the drives, reboot, and
> see what happens when you run vgscan again...
> 
> > If not what is the correct procedure for this type of thing?
> 
> Failing that, you should be able to vgexport the volume group, and vgimport
> it again, unless it is your root partition.

This is what I thought too, thanks for your answer.

> 
> Cheers, Andreas

Regards,

shane
