Return-Path: <bluca@comedia.it>
Date: Tue, 30 Jan 2001 09:51:04 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device /dev/hdc1 doesn'texist
Message-ID: <20010130095104.D4740@colombina.comedia.it>
References: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au> <20010129163432.J8567@srv.sistina.com> <002601c08a3a$20d57450$0a01a8c0@valhalla>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002601c08a3a$20d57450$0a01a8c0@valhalla>; from dparrish@excido.com on Tue, Jan 30, 2001 at 08:26:22AM +1100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 30, 2001 at 08:26:22AM +1100, David Parrish wrote:
> I did patch the kernel (re Lewis), and the /dev entries are correct. However pvcreate *did* eventually work if I use 
> 
> pvcreate /dev/ide/host0/bus1/target0/lun0/part1

uhm devfs....
yess this is expected, lvm tools read /proc/partitions to find which disks are available
and /proc/partitions only contains looong device names with devfs.

use lvmdiskscan to have lvm idea of what you have.

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
