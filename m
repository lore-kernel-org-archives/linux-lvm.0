From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] VFS Locking Patch for 2.4.20? 2.4.19 does not work
Message-ID: <20021222025418.P9539@zealot.blacknet.de>
References: <200212161403.gBGE3WLh023355@hni.upb.de> <20021216141212.GE869@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021216141212.GE869@tykepenguin.com>; from caulfield@sistina.com on Mon, Dec 16, 2002 at 02:12:12PM +0000
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
Date: Sat Dec 21 19:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 16 '02 at 14:12, Patrick Caulfield wrote:
> > is there anywhere a VFS locking patch for kernel version 2.4.20? The 
> > latest LVM1-release only includes the one for 2.4.19.
> The 2.4.19 one should work just fine.
As you might know 2.4.20 has a filesystem corruption bug with ext3 fs.
Unforunately the patch changes the semantic of sync_supers by adding a
parameter "wait".
I've not enough knowledge of how the VFS works to dear to update the
patch ... did anyone already do this?

BTW: the ext3 patches are available from
    http://www.zip.com.au/~akpm/linux/patches/2.4/2.4.20/
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
