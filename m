From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011026091007.A587@tykepenguin.com>
References: <20011024101331.A2271@tykepenguin.com> <011101c15ded$a59767c0$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <011101c15ded$a59767c0$0300000a@pacbell.net>; from e@arix.com on Fri, Oct 26, 2001 at 12:13:00AM -0700
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
Date: Fri Oct 26 03:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 12:13:00AM -0700, Erick Calder wrote:
> Patrick,
> 
> looking over the man page on lvreduce it states:
> 
> > lvreduce allows you to reduce the size of a  logical  volume.
> > Be  careful  when reducing a logical volume's size,
> > because data in the reduced part is lost!!!
> 
> the above warning is not conclusive as to whether data loss occurs only when
> the LV is full i.e. it has no choice but to lose data, of if data loss may
> occur regardless i.e. there's no smarts in lvreduce to move data around...
> 
> can you clarify this point and perhaps reword the above for a next release
> of that man page?


What it's warning you about is reducing the size of the LV without first changing
the size of the filesystem that is using it. eg (for reiserfs) you *must*

# resize_reiserfs <blah>
# lvreduce <blah>

Otherwise the filesystem will still think it is the same size as before and try
to read/write off the end of the block device. This is almost guaranteed to
cause problems.
 
> anyhow, I understand what you're suggesting... however it's not clear to me
> what "a little" means... would 1K do? 1M?
> 
> with the above, would I do:
> 
> # lvreduce -l -1 /dev/LVM/mp3z
> 
> to test this theory?

You should reduce it by at least 1 Physical Extent (default is 4Meg), if you
use the lower-case l to lvreduce it will do that for you (Capital L is for
K/Meg/Gigabyes, lowercase l is for PEs) so

# lvreduce -l 1 /dev/LVM/mp3z

Will do the job *BUT YOU MUST RESIZE THE FILESYSTEM FIRST*

If you are using an ext2 filesystem then you can use the e2fsadm command:

# e2fsadm -l -1 /dev/LVM/mp3z



patrick
