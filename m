Message-ID: <3D2A0976.5020108@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] df reporting incorrect size?
References: <3D29FD25.5050902@jumpline.com> <20020708211350.GI11345@kluge.net>
Content-Transfer-Encoding: 7bit
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
Date: Mon Jul  8 16:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

	My only advice is that you might want to reserve a small number of blocks 
for root on the filesystem, read up on -r for tune2fs.  The percentage 
as nearly as I can tell is only in integers.

	If you are using ext3 (which isn't a bad idea for a filesystem this 
large), I've used ReiserFS on filesystems this big.  The journal will 
take up something between 1024 Blocks and 10240 blocks depends on how 
you set it up, which can use up an additional 400M.  Read up on the -J 
option to tune2fs.  This can be reset after the filesystem is configured.

	If you're going to all that trouble, you should consider how many files 
you might put on the filesystem, and adjust the number of inodes to be 
reasonable.  Look at -i and -N for ext2/3 (this can only be done at 
filesystem creation time).  df -i will report on inodes.

	Finally, adding more space to the filesystem:

pvcreate /dev/device
vgextend VolGroupName /dev/device
lvextend --size +60G LogicalVolumePath

	Then depending on the filesystem you have to resize it.  To do that on 
ext2/3, you have to unmount the filesystem.  For reiserFS, you can do it 
online.

	If all you really wanted was a huge filesystem of a known (fixed) size, 
and you aren't planning on adding any drives, the md tools and software 
RAID will do the job (either linear append or RAID 0).  They aren't 
nearly as flexible, and aren't half as cool in my opinion, but they do 
get it done.

	It can save you a lot of trouble w/ LVM to not use it.  LVM if you need 
it is a godsend, if you don't I wouldn't bother with it, it's can be a 
hassle.  I play with it, so I get used to it.  It has caused problems in 
the past on my personal boxes.  I haven't had catastrophic stuff happen 
to me, and the guys here appear to work miracles on data recovery.  So, 
I wouldn't be paranoid about my data, but downtime is a problem for me, 
so I skip all the features I can do without on my production machines at 
work.

	Thanks,
		Kirby


	

Theo Van Dinter wrote:
> On Mon, Jul 08, 2002 at 04:59:17PM -0400, Ben Snyder wrote:
> 
>>Filesystem            Size  Used Avail Use% Mounted on
>>/dev/spheravg/spheralv
>>                             59G   20k   56G   0% /test
>>
>>
>>WTF?!?!  Where'd that 3G go?  Does LVM mess with things so that the OS 
>>cant read volumes correctly?  Or is there another issue that I might be 
>>running into?
> 
> 
> This isn't a LVM question, it's a filesystem question....  Specifically:
> 
> $ man mke2fs
> ...
>        -m reserved-blocks-percentage
>               Specify the percentage of the filesystem blocks reserved for the super-user.
>               This value defaults to 5%.
> ...
> 
> So 5% of 59GB is ~3GB.  59-3 = 56GB available.
> 
> As you can tell, 5% is huge.  For non-root/OS filesystems, I almost
> always set that to 0.  Look at tune2fs to see how to do that without
> recreating the FS.
> 
