From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030223181304.V14285@zealot.blacknet.de>
References: <3E58E03E.3020401@machturtle.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E58E03E.3020401@machturtle.com>; from dcorbin@machturtle.com on Sun, Feb 23, 2003 at 09:52:46AM -0500
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
Date: Sun Feb 23 11:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@sistina.com>

On Sun, Feb 23 '03 at 09:52, David Corbin wrote:
> [ ... ]  What is the correct way to "unmount" all the LVM stuff so
> that nothing is currently running on top of /dev/md0, without
> permanently changing any of my LVM configuration?
What about

vgchange -a n 

not?
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
