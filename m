From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008011704.e71H4Rv15918@webber.adilger.net>
Subject: Re: [linux-lvm] repair "lvextend-instead-of-e2fsadm" usage
Date: Tue, 1 Aug 2000 11:04:27 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Jens, writes:
> thanks to all for the last hints ... it works (sort of). Now I've done
> something stupid - I've installed a new HDD and
> 
> 	pvcreate /dev/hdb1
> 	vgextend /dev/vg01 /dev/hdb1
> 	vgdisplay /dev/vg01           -> 3737 free 4MB extents
> 	lvextend +l 3737 /dev/vg01/home
> 
> instead of using "e2fsadm" to resize the file system as well.
> 
> Is there a way to use resize2fs to get the same result, or would I have to
> (can I?) "lvreduce -l -3737 ..." the volume group first? How does the
> "reducing" work, does it just cut off the end?
> 
> The Trouble Is(tm), umounting the /home partition would include explaining
> to 200 scientists why and how long they cannot access their precious data,
> and I *really* don't want to go into details here. =;()

In either case, you will still have to unmount the filesystem in order to
do the resize, unless you have my online resize patch in your kernel
already.

If you _unmount_ your filesystem, you can simply use:

resize2fs /dev/vg01/home

(i.e. don't specify the size) and it will extend the filesystem to the
full size of the partition.  Note that using resize2fs will be much
faster than doing e2fsadm, because you don't really need an fsck before
doing the resize, but e2fsadm does it anyways.

If you have the online resize patch in your kernel already, but didn't do
a "prepare" on the filesystem for resizing, you will still be able to do
a resize to the next 16GB boundary, which may or may not be enough to use
up all of the newly allocated PEs.

I have updated e2fsadm to call either ext2online or (resize2fs or ext2resize)
depending on what is available and if the filesystem is mounted or not.
I will send a patch to linux-lvm shortly.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
