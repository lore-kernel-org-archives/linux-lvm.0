Return-Path: <mike@marxmeier.com>
Date: Mon, 27 Nov 2000 18:14:01 -0500 (EST)
From: Shane Shrybman <shane@zeke.yi.org>
Message-ID: <Pine.LNX.4.21.0011271803590.7077-100000@zeke.goatskin.org>
MIME-Version: 1.0
Subject: [linux-lvm] vgscan question
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm mailing list <linux-lvm@msede.com>

Hi,

I have three ide disks on my machine, hda, hdb, hdd. I
am using LVM 0.8 on hdb and hdd, (actually on partitions on
those disks).
If I remove hda and hdc(cdrom) from the machine will vgscan
still find all my volume groups on the remaining disks
that are now hda and hdc?

If not what is the correct procedure for this type of thing?

TIA,

shane 

-- 
