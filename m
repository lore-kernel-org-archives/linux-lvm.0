From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] striping efficiency
Message-ID: <20030218224059.M14285@zealot.blacknet.de>
References: <20030218195731.GA3934@angle.setup.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030218195731.GA3934@angle.setup.org>; from braver@pobox.com on Tue, Feb 18, 2003 at 02:57:32PM -0500
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
Date: Tue Feb 18 15:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 18 '03 at 14:57, Alexy Khrabrov wrote:
> I'm using a SCSI enclosure with 4 drives to store large files
> and wonder whether to stripe a single LV spanning them and
> how to choose the size of the stripe?
Don't. Use RAID5 and just don't bother to use striping. Otherwise, when
one drive fails all your data will be lost, with no hope to recover it.

OTOH if you insist on striping, than use a stripe size, that fits a few
times (3-4) into the cache of your disks. That would allow the SCSI
system to issue a "disk 1: get chunk A", "d2: cB", "d3: cC", "d4: cD"
and than read the chunks fro the disk's cache while the other drives are
still busy fatching the chunks from disk (and there is still space in
the cach to request the next chunk before getting the last, and don't
forget some space for writing and the disks' house keeping). 

If you use XFS just use the chunk size your XFS uses. (and replace chunk
with strip size ;-))
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
