Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM, lilo and MBR?
References: <m2g0fzsghb.fsf@isnogud.escape.de> <20010327110158.A2403@tykepenguin.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Mar 2001 15:43:07 +0200
In-Reply-To: <20010327110158.A2403@tykepenguin.com>; from Patrick Caulfield on Tue, 27 Mar 2001 11:01:58 +0100
Message-ID: <m2ae67s4yc.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Patrick Caulfield <caulfield@sistina.com> writes:

> Yes it is. Don't run LILO on /dev/sda if it's a PV because it will
> destroy it.  You should partition the disk into /dev/sda1 (that way
> the PV will start further in and leave space for LILO)

Hm, I hoped I could get rid of the broken partitioning scheme of the
PC and C/H/S addressing used in the partition table.

Are there objections to change LVM so that the VGDA is placed at some
fixed offset (say 1 sector or 1 block (1K)) from the beginning of the
PV?  This is how many file systems also use block devices to avoid
conflicts with MBR, boot sectors and so on.

BTW, are the other partitioning schemes that I could use than the one
that the standard MBR and MSDOS use?  Can the linux kernel recognize
other partition tables which only use absolut, linear sector numbers?


urs
