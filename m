From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] read_intr errors
Message-ID: <000e01c15e63$5e91c7f0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011026091007.A587@tykepenguin.com>
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
Date: Fri Oct 26 16:16:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> What it's warning you about is reducing the size of the LV without first
changing
> the size of the filesystem that is using it.

aha... maybe I could encourage the man page's maintainer to make that point
a little clearer?

> If you are using an ext2 filesystem then you can use the e2fsadm command:
>
> # e2fsadm -l -1 /dev/LVM/mp3z

I performed the above command expecting I would have to do an lvreduce later
but it <gasp> did it for me...  I haven't done a compare against backups to
make sure I didn't lose data ok but I still have the problem... here's the
output (but read beyond):

> # e2fsadm -l -1 /dev/LVM/mp3z
> e2fsck 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
> Pass 1: Checking inodes, blocks, and sizes
> Pass 2: Checking directory structure
> Pass 3: Checking directory connectivity
> Pass 4: Checking reference counts
> Pass 5: Checking group summary information
> /dev/LVM/mp3z: 3041/3751936 files (2.0% non-contiguous), 3450293/7502848
blocks
> resize2fs 1.18 (11-Nov-1999)
> Begin pass 3 (max = 229)
> Scanning inode table          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
> The filesystem on /dev/LVM/mp3z is now 7501824 blocks long.
>
> lvreduce -- WARNING: reducing active logical volume to 28.62 GB
> lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
> lvreduce -- doing automatic backup of volume group "LVM"
> lvreduce -- logical volume "/dev/LVM/mp3z" successfully reduced
>
> e2fsadm -- ext2fs in logical volume /dev/LVM/mp3z successfully reduced to
28.62 GB

now, in playing with this I've found that I get these error messages most
consistently while shutting down.  and analysis of /etc/init.d/halt shows
that the errors are produced by an effort to remount / in readonly mode...
the code reads like this:

> #echo "Remounting remaining filesystems (if any) readonly"
> mount | awk '/ext2/ { print $3 }' | while read line; do
>     mount -n -o ro,remount $line
> done

by the time this code is run I've already un-mounted /var/LVM/mp3z and done
a "vgchange -a n"... so in retrospect I can say that the only thing that has
changed (I wasn't having these errors before installing LVM) is that I did a
"pvcreate /dev/hdc"...

is the info above of any use and is there anything else I can try?

1k thx - e

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Patrick Caulfield
Sent:	Friday, October 26, 2001 1:10 AM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] read_intr errors

On Fri, Oct 26, 2001 at 12:13:00AM -0700, Erick Calder wrote:
> Patrick,
>
> looking over the man page on lvreduce it states:
>
> > lvreduce allows you to reduce the size of a  logical  volume.
> > Be  careful  when reducing a logical volume's size,
> > because data in the reduced part is lost!!!
>
> the above warning is not conclusive as to whether data loss occurs only
when
> the LV is full i.e. it has no choice but to lose data, of if data loss may
> occur regardless i.e. there's no smarts in lvreduce to move data around...
>
> can you clarify this point and perhaps reword the above for a next release
> of that man page?


What it's warning you about is reducing the size of the LV without first
changing
the size of the filesystem that is using it. eg (for reiserfs) you *must*

# resize_reiserfs <blah>
# lvreduce <blah>

Otherwise the filesystem will still think it is the same size as before and
try
to read/write off the end of the block device. This is almost guaranteed to
cause problems.

> anyhow, I understand what you're suggesting... however it's not clear to
me
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


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
