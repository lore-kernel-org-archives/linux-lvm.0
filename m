Return-Path: <mits@xenotrope.com>
Message-ID: <3A4D0C25.A4BB534B@xenotrope.com>
Date: Fri, 29 Dec 2000 17:11:49 -0500
From: Mits Yanagihashi <mits@xenotrope.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] OK to backup physical volume to tape?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'm a LVM newbie with a question.  I haven't managed to find an answer
yet, so I'm posting my question here.

I have a hardware RAID 5 volume on my server; Linux sees this as one 130
GB disk (/dev/sda).

I have one tape drive that can store 33 GB (uncompressed).  I want to
backup 130 GB over a 5 day week.  I want my users to see two directories
"/dir1" and "/dir2", but my tape cannot fit a full dump of either one
directory.

This is what I want to do:

1. Divide /dev/sda into 5 partitions of 26 GB each.  Make each partition
a physical volume.  

2. Make one volume group.  Add two logical volumes (that together use
the 5 physical volumes) to the volume group.

3. My users can use the two logical volumes (dir1 and /dir2, which may
be 52 and 78 GB respectively).  Each night a full backup of one physical
volume, and incrementals of the other four physical volumes are written
to tape.  One tape can store 26 GB, and still have space for incremental
backups of the other physical volumes.

My question is, is it safe to backup the physical volume (i.e. dump
/dev/sda1 to tape)?  Or are there complications with file system
state/meta information?

Thank you,
Mits


-- 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
 Mits Yanagihashi, Consultant, Xenotrope, Inc.
 55 John Street, New York, NY 10038
 Phone:(212)964-4242  Fax:(212)964-5522
 mits@xenotrope.com   http://www.xenotrope.com
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
