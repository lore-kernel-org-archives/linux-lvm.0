Message-Id: <A76258F91728D211882A0008C7280E0C05E1F9A0@nzwnm202.nz.eds.com>
From: "Jones, Steven" <sjones08@eds.com>
Subject: RE: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard dri
    ves!
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
Date: Tue Feb 19 21:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

striping or concatination?

striping means yes same size spaces, but you can just concatinate which
simply means adding together. So 12+5+4= 21, you could then mirror against
the 20 gig in software and only loose 1 gig. Whether the controller is
bright enough to tell the difference is another matter.

Thing

-----Original Message-----
From: Steve Wray [mailto:steve.wray@paradise.net.nz]
Sent: Wednesday, 20 February 2002 3:54 
To: linux-lvm@sistina.com
Subject: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard
drives!


Hmmmm,
Ok so I have 4 hard drives of very varying capacity
(20G,12G,5G,4G)
I have an off-board IDE controller (Promise 66)

I think 'maybe I can take advantage of the IDE
system and put a drive on each master and stripe them.'
A hardware RAID card would be suboptimal because
(as I understand it) the striped volume could
only be as big as the smallest drive.

So, I set up the drives as;
hda = 20G
	hda1 = 64M and is /boot
	hda2 = 1G
hdc = 12G
	hdc1 = 1G
hde = 5G
	hde1 = 1G
hdg = 4G
	hdg1 = 1G

The other partitions are set up for various other volume
groups and non LVM system partitions.

hda2, hdc1, hde1, hdg1 are added to a VG 'fast'

The other LVM partitions on hdc-g are in a volume group that
doesn't see much traffic, just storage.

I make logical volumes on fast striped across 4 drives.
So thats 4 partitions at the beginning of the drives,
with volumes striped across them.

I expected some performance improvements.

So I get the iozone benchmark and start running it on the system.
I compare performance of striped volumes with performance of a volume
purely on hda.

Interestingly, the performance improvement is not dramatic,
I expected better. The main improvement seems to be that the
striped volumes do better with larger file sizes and as file size
increases the striped volume keeps its performance up better.

I'm a newbie at this benchmarking lark, so if anyone wants
the excel spreadsheets generated from iozone just ask,
I'd like a second opinion! There are some strange things,
like when file size gets above 16M performance drops dramatically
regardless of striped or linear volumes... Maybe its something
to do with extents?






_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
