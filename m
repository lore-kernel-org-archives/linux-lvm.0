Subject: Re: [linux-lvm] Re: [patch] make device mapper compile on 2.5.4x
Message-ID: <20021112085808.GB1308@reti>
References: <20021111225340.GA3587@lina.inka.de> <Pine.GSO.4.21.0211111821210.29617-100000@steklov.math.psu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0211111821210.29617-100000@steklov.math.psu.edu>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Tue Nov 12 02:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Bernd Eckenfels <ecki@lina.inka.de>, dm@uk.sistina.com, linux-kernel@vger.kernel.org

On Mon, Nov 11, 2002 at 06:23:00PM -0500, Alexander Viro wrote:
> 
> 
> On Mon, 11 Nov 2002, Bernd Eckenfels wrote:
> 
> > -	set_device_ro(dm_kdev(md), 0/*(param->flags & DM_READONLY_FLAG)*/);
> > +	bdev = bdget(kdev_t_to_nr(dm_kdev(md)));
> > +	if (!bdev)
> > +		return -ENXIO;
> > +	set_device_ro(bdev, (param->flags & DM_READONLY_FLAG));
> > +	bdput(bdev);
> 
> That is simply wrong.  set_device_ro() works only on opened block_device.
> Correct fix is to use set_disk_ro() and it's already in the tree (1.830
> on bkbits).

And I have sent the patch for this 3 times now.

- Joe
