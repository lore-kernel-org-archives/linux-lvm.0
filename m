From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008241858.e7OIwIZ12336@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
In-Reply-To: <20000823224300.E8398@gospelcom.net> "from Peter Green at Aug 23,
 2000 10:43:00 pm"
Date: Thu, 24 Aug 2000 12:58:18 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Green <pcg@gospelcom.net>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Peter writes:
> The problem occurs in pv_get_size() starting around line 87. The device name
> is looked up in the cache. If found, it is tested to be a partitioned device
> or not. This call returns false for the /dev/md? devices; MD_MAJOR is not
> listed as a valid major number for partitioned devices (rightly so, I
> think).

I _think_ it would be possible to replace all of this partition-reading crap
with a much simpler solution - read /proc/partitions, or do BLKGETSIZE ioctl,
or failing that do a binary search of the device trying to read data - code
exists in mke2fs and ext2resize.  The below is half of Andrea Arcangeli's
Alpha code, and half code from ext2resize.  Give it a try for pv_get_size.c.

I also don't see much use for lvm_check_dev(), which seems to be very high
maintenance (it needs to track all new devices added to the kernel), and
pv_check_name() also really relies on specific names for specific devices.
Can't lvm_check_dev() simply check if we are dealing with a rw block device,
and get rid of pv_check_name() entirely?  Granted that some people will try
to make PVs on /dev/ram0 or /dev/fd0, but maybe they should be allowed to
try, and maybe they have a good reason to do so (e.g. /dev/fd0 is really a
100MB zip disk or something).  I suppose it shouldn't be possible to make
a PV on an LV...

The only remaining difficulty lies in checking the partition type.  This could
be done by a shell command out to fdisk or cfdisk, or by simply trusting the
user to do the right thing.  None of the other tools like mke2fs check if the
partition type is correct - they simply go ahead and do what you ask.  I can
see checking if the partition is mounted but that's about it...

Cheers, Andreas
--- cut here ---
int valid_off(int fd, __loff_t offset)
{
	char c;

	/* should probably use lseek64 if available */
	return (llseek(fd, offset, SEEK_SET) < 0 || read(fd, &c, 1) < 1)? 0 : 1;  
}

unsigned long pv_get_size(char *dev_name, struct partition *dummy)
{
	loff_t low, high;
	int pv_fd;
	unsigned long size;

	pv_fd = open(dev_name, O_RDONLY);
	if (pv_fd < 0)
		return -LVM_EPV_GET_SIZE_OPEN;

	if (ioctl(pv_fd, BLKGETSIZE, &size) < 0) {
		for (low = 0, high = 1024; valid_off(pv_fd, high); high *= 2)
			low = high;

		while (low < high - 1) {
			loff_t mid = (low + high) / 2;

			if (valid_off(pv_fd, mid))
				low = mid;
			else
				high = mid;
		}

		size = high >> 9;
	}
	close(pv_fd);
	return size;
}
--- cut here ---


-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
