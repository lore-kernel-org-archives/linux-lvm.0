From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] moving single LVM disk from one system to another
Message-ID: <20020817125058.B10405@zealot.blacknet.de>
References: <20020817070901.GA5022@linux.interlinx.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020817070901.GA5022@linux.interlinx.bc.ca>; from lvm@interlinx.bc.ca on Sat, Aug 17, 2002 at 03:09:02AM -0400
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
Date: Sat Aug 17 05:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 17 '02 at 03:09, lvm@interlinx.bc.ca wrote:
> My workstation died (the MB, not the disk).  :-(
> [ ... ]
> On the dead machine, where the disk was built and last running, the
> disk was device /dev/hde on a Promise ATA100 bus.  I want to move it
> to another (working) machine on the primary ATA bus so it will be
> /dev/hda.
Just a poke in the dark, but maybe your kernel get's the disks CHS
information wrong on bootup. But hopefully you can force this on the
mobo's BIOS.
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
