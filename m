From: Alexander Viro <viro@math.psu.edu>
In-Reply-To: <20021111225340.GA3587@lina.inka.de>
Message-ID: <Pine.GSO.4.21.0211111821210.29617-100000@steklov.math.psu.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [patch] make device mapper compile on 2.5.4x
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
Date: Mon Nov 11 17:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Eckenfels <ecki@lina.inka.de>
Cc: dm@uk.sistina.com, linux-lvm@sistina.com, linux-kernel@vger.kernel.org


On Mon, 11 Nov 2002, Bernd Eckenfels wrote:

> -	set_device_ro(dm_kdev(md), 0/*(param->flags & DM_READONLY_FLAG)*/);
> +	bdev = bdget(kdev_t_to_nr(dm_kdev(md)));
> +	if (!bdev)
> +		return -ENXIO;
> +	set_device_ro(bdev, (param->flags & DM_READONLY_FLAG));
> +	bdput(bdev);

That is simply wrong.  set_device_ro() works only on opened block_device.
Correct fix is to use set_disk_ro() and it's already in the tree (1.830
on bkbits).
