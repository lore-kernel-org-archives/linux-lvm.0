Return-Path: <darren_young@yahoo.com>
Message-ID: <20010508032320.75000.qmail@web10802.mail.yahoo.com>
Date: Mon, 7 May 2001 20:23:20 -0700 (PDT)
From: Darren Young <darren_young@yahoo.com>
Subject: RE: [linux-lvm] Can't pvcreate second partition...
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130BEE3@es04snlnt>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

If it helps. Fdisk to a disk that had no other
partitions on it. Create an extended, then a logical
inside it of 12G. Mark it as type 8e. Run pvcreate on
/dev/hdb5 (the logical) and had the doesn't exist
message. Reboot, create the physical, group and
logical then an ext2 fs on it and all is well.

Kernel 2.4.2
fdisk 2.10s
LVM 0.9.1_beta6

Hop over to a machine with:
Kernel 2.4.2
fdisk 2.10s
_NO LVM_

Same steps, except no change of type to 8e on the
logical partition. Create ext2 on it and mount away.

Maybe this helps...

Darren Young



__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - buy the things you want at great prices
http://auctions.yahoo.com/
