From: "Marc P." <mprov@zimage.com>
Message-Id: <1065296413.21235.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Fwd: 0x8e "Linux LVM" partitions on a PowerPC]
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
Date: Sat Oct  4 14:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
	I've looked everywhere, and i mean everywhere for this, and i can't
find the answer. It's like nobody has tried using a Mac with LVM or
something! The screwy part is.. I can't even find mailing lists, irc
channels, or web documents that even say "it doesn't work"!! 

How do I create LVM partitions on a Mac so i can subsequently create PVs
and VGs and LVs???

mac-fdisk doesn't have a facility for changing system partition types,
just apple partition types, which does no good.. 

and fdisk, cfdisk, & sfdisk, think the drive's partition table is
corrupted.. when i force it to repartition the drive, then mac-fdisk,
and the machine itself think the partition table is corrupted.. 

I'm using lvm10 and lvm-common under debian-powerpc, I'm NOT using
devfs, and I've gotten LVM to work flawlessly on my x86 and sparc
machines.. 

Help!?!!!

Signed,
Totally Lost =(
 
-- 
-M
--
If a nation values anything more than freedom, it will lose its freedom;
and the irony of it is that if it is comfort or money it values more, it
will lose that, too.
                -- W. Somerset Maugham
