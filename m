Subject: Re: [linux-lvm] [Patch] Latest device-mapper snapshot
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20021023102503.GA25925@fib011235813.fsnet.co.uk>
References: <20021023102503.GA25925@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <1035395934.14726.12.camel@ubergeek>
Mime-Version: 1.0
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
Date: Wed Oct 23 13:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Linux Mailing List <linux-kernel@vger.kernel.org>, Alan Cox <alan@redhat.com>

YAY!!! :) I will try asap. :-D I will also try with qla2200's and see if
I can break it! :)

On Wed, 2002-10-23 at 05:25, Joe Thornber wrote:
> New patchballs are available here:
> 
> http://people.sistina.com/~thornber/patches/2.5-stable/
> 
> Including a diff against 2.5.44-ac1.  There are a lot of changes in
> here compared to the last release, however most of these are due to
> code refactoring rather than bug fixes.  Highlights include:
> 
> o) Make the changes recommended by Christoph Hellwig and others:
>    http://marc.theaimsgroup.com/?l=linux-kernel&m=103462345119681&w=2
> 
> o) Add reference count to struct mapped_device, and struct dm_table.
> 
> o) Hide the above two structs in their respective .c file
> 
> o) Move all locking of struct mapped_device into dm.c (we can do this
> now because
>    of the reference counting).
> 
> o) Remove the name and uuid field from struct mapped device, these are
> really
>    only used by the interface as a way of refering to devices.
> 
> o) Nobody needs to lookup from kdev_t -> struct mapped_device, so remove
>    that hash table (thanks to Al Viros recent bdev->bd_disk stuff).
> 
> o) dm.c has no need of the dm-hash.c file any more, so merge dm-hash.c
> into
>    dm-ioctl.c (the fs interface uses the dcache for lookups).
> 
> 
> There are still open issues that prevent things working perfectly:
> 
> o) The gendisk hash table is getting confused when removing a device.
> eg, if
>    I create 3 devices with minors (1, 2, 3).  Then remove minor 2,
> get_gendisk 
>    will remove minor == 3. (Or I've done something really stupid).
> 
> o) Splitting pages still doesn't work, this is a generic block layer
>    thing rather than dm.  In practise I can only trigger this with
>    striped targets.  So stick to linear targets for now.
> 
> 
> Filesystem interface to follow before the end of the week.
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
