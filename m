Return-Path: <urs@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 26 Feb 2001 17:04:41 +0100
Message-ID: <m2pug5ph0m.fsf@isnogud.escape.de>
Subject: [linux-lvm] LVM and striping, defragmentation
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

I'd like to experiment with LVM and striping.  The HOWTO at
www.linuxdoc.org says in section 8.3 LVM native striping

    Performance notices

    The performance 'gain' may well be very negative if you stripe over 2
    partitions of the same disk - take care to prevent that.


How can I take care of it?  I've seen no option in lvcreate to specify
where the PE should be taken from.  If I have a VG with only two PVs on
two different disks, will LVM automatically choose PEs from the two
PVs instead of one PV?  And what if I have a VG with several PVs on
disk A and several PVs on disk B.  How can I "take care to prevent"
that LVM does not choose two PEs from the same disk for striping?


When I resize my LVs in a VG multiple times, I can get some
fragmentation, i.e. LVs in the VG are not contiguous.  Is there a tool
to defragment LVs, i.e. to swap PEs so that all LVs in the VG are
contiguous again.  I read in the man page that the allocation policy
can be set to "contiguous", but how can I make LVs contiguous after
some creating, removing, and resizing of LVs?

How much performance loss is to be expected in case of non-contiguous LVs?


urs
