From: "Tom Parker" <tom@carrott.org>
Message-ID: <1293.435T2650T11474321tom@carrott.org>
MIME-Version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Overlapping logical volumes
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
Date: Sat Nov  1 00:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I have just experianced a rather nasty bug in lvextend. I grew a logical
volume and it used extents that were already in use for another logical
volume.

I'm using Debian Woody and Linux 2.4.22 (unpatched Linus kernel.org sources)

amislave:/# lvextend --help

Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)

Luckily I noticed the corrupting filesystems fairly quickly and was able to
mostly recover the situation with minimal losses. Currently I still have the
two overlapping logical volumes and a lot less trust in the LVM than I had
before.

Is there a program that can validate the logical volume configuration and
ensure that no physical extent is allocated to more the one logical volume?

When extending a logical volume, or creating a new one, is anything written to
the newly allocated extents? If this were to happen again, and I discovered
the problem before I made use of the extra space or a new logical volume,
would I have any corruption of the first logical volume to use the extents in
question?

To finish my data recovery, I would like to allocate another large logical
volume, I'm somewhat wary of doing this without a tool to ensure that the
group is valid.

--
Tom Parker - tom@carrott.org
           - http://www.carrott.org
