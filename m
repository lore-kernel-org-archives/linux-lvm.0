Return-Path: <markj@reading.sgi.com>
Message-ID: <3A24CB9C.4E44EC03@reading.sgi.com>
Date: Wed, 29 Nov 2000 09:25:49 +0000
From: Mark Jeffery <markj@reading.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RE: pvcreate fails with invalid partition type.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I work for SGI, so I have to use XFS! (only joking)

In reality, we have a leftover PC Server and 2 disk vaults one with a
bunch of 8 disks, and the other with a raid controller, which we wanted
to use as a file server and CD ROM burning machine.

In both of them, we wanted to use XFS to minimise fsck time. I got the
RAID one working OK, and decided to use LVM to create a stripe across
all 8 disks, and to use that as a scratch area.

In order to get XFS to work with LVM, you need to apply a patch to LVM.
Have a look at http://oss.sgi.com/projects/xfs/

It seems to work fine. My test loading has just been to copy lots of
small files to both, but we are starting to use it in anger.

XFS is still in beta on Linux, my confidence in it is based on the
performance under IRIX.

Mark.


--
Mark Jeffery                Tel: +44 118 925 7666
Presales Analyst            Mob: +44 410 579828
SGI                         Fax: +44 118 925 7699
Email: markj@sgi.com        http://www.sgi.com
