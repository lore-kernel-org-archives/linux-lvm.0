Return-Path: <wilson@visi.com>
Date: Wed, 21 Feb 2001 12:34:19 -0600 (CST)
From: Timothy Wilson <wilson@visi.com>
Message-ID: <Pine.GSO.4.21.0102211227040.17882-100000@isis.visi.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvm on a brand-new server
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi everyone,

I'm just starting out learning about lvm and I have a couple questions.

First, a description of the machine:

Compaq DL380 933 MHz PIII (rack-mount) w/ 640 MB RAM and (2) 18 GB SCSI
disks. The machine has Compaq's built-in hardware RAID controller. My plan
is to mirror the two disks using RAID.

I'd like to use LVM (and likely ReiserFS) on this box, but I'm not sure how
to get it installed on a bare system. I'll likely be using Debian on this
system.

Can anyone suggest a basic outline of the process? I'm certain there's a lot
more reading to do, but I'm not sure where to start. (I have looked over the
LVM How-to and the FAQ.)

-Tim

--
Tim Wilson      | Visit Sibley online:         | Check out:
Henry Sibley HS | http://www.isd197.k12.mn.us/ | http://www.zope.org/
W. St. Paul, MN |                              | http://slashdot.org/
wilson@visi.com |   <dtml-var pithy_quote>     | http://linux.com/
