From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030224022433.Z14285@zealot.blacknet.de>
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de> <3E5919A3.2010404@machturtle.com> <20030224021555.Y14285@zealot.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030224021555.Y14285@zealot.blacknet.de>; from bock@blacknet.de on Mon, Feb 24, 2003 at 02:15:55AM +0100
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
Date: Sun Feb 23 19:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 24 '03 at 02:15, Goetz Bock wrote:
> > Attempts to access the logical volume I used to fail. 
> You have disabled it, it's gone. 
Don't panik :->

your LVM will reappear, once you enable it again (vgchange -a y)
still, read some docs.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
