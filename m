From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Extending an LVM-Partition
Message-ID: <20020714212214.A22165@zealot.blacknet.de>
References: <20020714190504.GA880@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020714190504.GA880@glorybox.de>; from kai.weber@glorybox.de on Sun, Jul 14, 2002 at 09:05:04PM +0200
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
Date: Sun Jul 14 14:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 14 '02 at 21:05, Kai Weber wrote:
> Or I ask for an "you can just add the PV hda2 and it does not matter, if
> there is another PV on this disk" advice.
It's ok to do this (I do this all the time with my regular setups:
install the system to a mini ext2 partition, make the rest LVM, move
system to LVM, add former ext2 partition to LVM. As the installers
nowadays support LVM this is nolonger needed, but when I started LVM
no installer knew it).
It is only a bad idea when you want to try striping (for, I hope,
obviouse reasons)
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
