Return-Path: <markj@reading.sgi.com>
Message-ID: <3A1BC911.4B9669AA@reading.sgi.com>
Date: Wed, 22 Nov 2000 13:24:33 +0000
From: Mark Jeffery <markj@reading.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate fails with invalid partition type.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@hermes.sistina.com
Cc: Mark Jeffery <markj@reading.sgi.com>, Graham Russell <graham@reading.sgi.com>

Hi,

I am trying to use LVM on an array of 8 SCSI disks with a 2.4 kernel and
devfs.

I run fdisk on each disk, and create a new primary partition (1) for the
whole disk.

I then set the type to 0x8e

When I run pvcreate, it fails. Here is the text:

[root@kryten 0.8final]# pvcreate /dev/scsi/host1/bus0/target*/lun0/part1

pvcreate -- invalid partition type 0x42 for
"/dev/scsi/host1/bus0/target10/lun0/part1" (must be 0x8e)

I'm also showing the output from fdisk to "prove" that the disk id
really is 0x8e.

[root@kryten 0.8final]# fdisk -l
/dev/scsi/host1/bus0/target10/lun0/part1

Disk /dev/scsi/host1/bus0/target10/lun0/part1: 255 heads, 63 sectors,
2212 cylinders
Units = cylinders of 16065 * 512 bytes

                                    Device Boot    Start       End
Blocks   Id  System
/dev/scsi/host1/bus0/target10/lun0/part1p1             1      2212
17767858+  8e  Unknown

Is this a problem with devfs and lvm?

Is there a workaround?

Mark.

--
Mark Jeffery                Tel: +44 118 925 7666
Presales Analyst            Mob: +44 410 579828
SGI                         Fax: +44 118 925 7699
Email: markj@sgi.com        http://www.sgi.com
