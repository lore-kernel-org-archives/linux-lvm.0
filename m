From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031220123023.H21022@uk.sistina.com>
References: <1071881237.1464.14.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1071881237.1464.14.camel@rich>; from rich@storix.com on Fri, Dec 19, 2003 at 04:47:18PM -0800
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
Date: Sat Dec 20 06:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 19, 2003 at 04:47:18PM -0800, Rich Turner wrote:
> lvm2:
> look for "vgcreate" command and
Better to check for the new 'lvm' base command: other commands are
links to it: check that running 'lvm version' produces complete output.
That will also confirm that device-mapper is available in the live
kernel and that /dev/mapper/control is set up correctly.
(See device-mapper/scripts/devmap_mknod.sh)

> look for "device-mapper" in /proc/devices or
It's better to check for that in /proc/misc, which will tell you whether
or not device-mapper support is present in the running kernel.

> look for "dm-mod" in /lib/modules/[release]/kernel/drivers/md/*
Better to attempt to load the module with modprobe and then do the
tests above to check it worked.
 
Alasdair
-- 
agk@uk.sistina.com
