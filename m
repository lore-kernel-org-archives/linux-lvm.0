From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Whole Disk Usage with LVM in what multiples?
Message-ID: <20021117030634.H1167@zealot.blacknet.de>
References: <200211162245.PRT26051@vmms4.verisignmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200211162245.PRT26051@vmms4.verisignmail.com>; from david@lownoisefloor.com on Sat, Nov 16, 2002 at 02:46:05PM -0800
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
Date: Sat Nov 16 20:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Sat, Nov 16 '02 at 14:46, david@lownoisefloor.com wrote:
> I am using entire disks.  
Bad idea, why don't you want to at last put a partition table on it,
with one big partition, that uses the whole disk ... or is this what you
had in mind?

> I want to use 6 disks rather than 4.
I'm using 1, 2, 4, 6, 8, 12 disks partially with hard- and soft-raid
with LVM. no problems.

So, what again was your question?

There is no minimal number of disks/physical volumes for LVM. IIRC a
Volume Group can not be bigger than about 2T, but that seams to be a
kernel limmit and you will not each it with 1 - 6 of this "little"
disks. :-)
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
