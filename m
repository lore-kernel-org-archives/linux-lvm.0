From: Michael Lausch <mla@1012surf.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14801.35603.881485.66498@loki.1012internet.at>
Date: Wed, 27 Sep 2000 07:52:19 +0200 (CEST)
Subject: Re: [linux-lvm] lvm and fibre channel
In-Reply-To: <200009261746.e8QHksg25808@webber.adilger.net>
References: <39D093AC.54E9D40A@rds.ro>
	<200009261746.e8QHksg25808@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

Andreas Dilger writes:
 > Florin writes:
 > > We have a big Web project, involving several disk arrays (over 3 TB total
 > > storage space) and around 24 Linux servers.
 > > 
 > > On the disk arrays, we need to create aprox. 2600 partitions, which may be
 > > mounted by the Linux servers (but no server can mount more than 16 partitions
 > > at any given moment).
 > > 
 > > So here is the problem: the Fibre Channel devices are seen as SCSI devices,
 > > but Linux doesn't support more than 2048 partitions on SCSI disks (max 128
 > > disks, max 16 partitions each).
 > > 
 > > Does LVM works over Fibre Channel?
 > 
 > Someone on the list was trying to get LVM to work on FC, but they were
 > having problems.  I don't know if they got it working at the end.
 > 
 > LVM will not help you here either, because it currently limits you to
 > 255 LVs, regardless of how many VGs you have, because there is only 1
 > block major for LVM.

is using devfs an option? We are planing to attach a PC to a storage
array (HP XP256) using LVM and devfs over fibre channel next week and
doing some tests (performance, ease of use, etc....)
