Return-Path: <jay@lazy.accessus.net>
Date: Mon, 18 Dec 2000 10:12:33 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Message-ID: <Pine.OSF.4.21.0012181003480.27048-100000@lazy.accessus.net>
MIME-Version: 1.0
Subject: [linux-lvm] tools/lib/lvm_dir_cache.c -- still can't find devices
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Seems lvm_dir_cache.c still has some subtle problems in that it's not
quite proper in device detection.

In my case I'm using LVM with loopback devices for testing out,
etc.  Basically it appears that LVM scans /proc/partitions, finds some
devices listed there, adds them to the cache and increments cache_size
variable.  Next, if cache_size == 0 it will then scan /dev, unfortunately
my cache_size isn't == 0 at this point and /dev/loop devices are not
listed in /proc/partitions.

Any thoughts on how to fix this one?  Possibly add an option for the tools
that specify you want to forcefully scan /dev or such?  I'm thinking there
are times when this may be wanted since it's conceivable that some other
device or such may be used or become avail that would not get caught under
the other scanning cases.

Another thought, why even use the dircache scheme, is it vital elsewhere?  
I'm thinking if I run pvcreate /dev/loop0 it should just use the
devicename I specified to setup whatever structs, etc.  Am I missing
something?  Then the vgscan/lvscan tools and such could default to
scanning all of dev, these tools imply to me that you want to scan your
entire system's devices for LVM volumes, etc.

Thanks.
