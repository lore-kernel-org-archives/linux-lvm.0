From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM backup server
Message-ID: <20031203142008.GF1833@tykepenguin.com>
References: <5EDC40261519564AB9A8760651C77A1D58581F@btiburmail01.bustech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EDC40261519564AB9A8760651C77A1D58581F@btiburmail01.bustech.com>
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
Date: Wed Dec  3 08:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 03, 2003 at 08:36:44AM -0500, George Campbell wrote:
>    Link: File-List
> 
>    I followed the LVM HOW-TO to install and configure LVM on a Linux server.
>    I defined a single volume group, a single logical volume, and about 14
>    separate physical extents on a SAN. It works fine.
> 
>    My question is, what steps need to be done beyond the initial rpm install
>    and activation to configure LVM on a second server that will only be used
>    for backup if the first server goes down. I don't want to do anything that
>    would wipe out any data on the logical volume, but I want the volume group
>    and logical volume to be defined exactly as the original server has them
>    defined.
> 
>    It seems I should NOT do any pvcreates. Can I just do the vgcreate,
>    followed by the lvcreate, skip doing the mk2fs, and do the mount of the
>    logical volume?

You don't need to do anything apart from vgscan/vgchange -ay when you need to
use the volumes, the mount them.

Don't redo vgcreate/lvcreate as that will mangle the metadata for the other
node.

-- 

patrick
