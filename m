Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3A23D34E.E2A45E2@ednet.ns.ca>
Date: Tue, 28 Nov 2000 11:46:22 -0400
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan question
References: <Pine.LNX.4.21.0011271803590.7077-100000@zeke.goatskin.org>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I did something similar with SCSI drives (sda and sdb became sdb and
sdc) and it worked fine.

Shane Shrybman wrote:

> Hi,
>
> I have three ide disks on my machine, hda, hdb, hdd. I
> am using LVM 0.8 on hdb and hdd, (actually on partitions on
> those disks).
> If I remove hda and hdc(cdrom) from the machine will vgscan
> still find all my volume groups on the remaining disks
> that are now hda and hdc?
>
> If not what is the correct procedure for this type of thing?
>
> TIA,
>
> shane
>
> --
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
