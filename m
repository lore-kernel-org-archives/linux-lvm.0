Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <200104111949.f3BJnFHt014761@webber.adilger.int> <m2n18eygvs.fsf@isnogud.escape.de> <20010515131357.D524@tykepenguin.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 26 May 2001 13:17:26 +0200
In-Reply-To: <20010515131357.D524@tykepenguin.com>; from Patrick Caulfield on Tue, 15 May 2001 13:13:57 +0100
Message-ID: <m2ofsguzp5.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Patrick Caulfield <caulfield@sistina.com> writes:

> I think one problem is that your "benchmarks" are not very realistic. In 
> real world use the overhead of LVM is very small. I would respectfully suggest
> that you try something like bonnie++ before getting too worried about the 
> performance of LVM on your machine - unless you spend most of your day doing
> "dd" to your disks :-)

The reason I tested dd on the partition and on the LV is that I
thought when the performance of the block device is bad (like it is on
my LV) this will have an impact on a mounted file system on that LV.
If also thought, the performance of dd if=/dev/vg0/test will be
approximately equal to dd if=/mnt/foo od md5sum foo where foo is large
file on the LV.

I've done some tests with a file system on /dev/sda5 and the on
/dev/vg0/test (which is a LV on /dev/sda5) and I am really surprised:

First, I repeated my previous tests:

						         $dev

                                                /dev/sda5    /dev/vg0/test
---------------------------------------------+-------------+----------------
dd if=$dev of=/dev/null bs=512 count=1048576 |    71.2s    |   122.7s
dd if=$dev of=/dev/null bs=64k count=8192    |    71.5s    |    71.7s

Then I made a ext2 filesystem with 1K blocksize on /dev/sda5, mounted
it to /mnt, copied a 512MB random file to it, md5sum'med that fie and
dd'ed that file to /dev/null.  Then I recreated /dev/vg0/test and did
the same tests and that block device:

---------------------------------------------+-------------+----------------
cp -a /usr/local/foo /mnt                    |    96.6s    |   123.4s
md5sum /mnt/foo                              |    89.8s    |    92.4s
dd if=/mnt/bar of=/dev/null bs=512           |    71.8s    |    72.1s
dd if=/mnt/bar of=/dev/null bs=64k           |    71.7s    |    72.5s


When I use a 4K blocksize on the ext2 filesystem the times for
/dev/sda5 and /dev/vg0/test are even closer.

Result: Although the block device /dev/vg0/test is significantly
slower than /dev/sda5 (where /dev/vg0/test is located on /dev/sda5)
the *read* performance of the file system on top the block device is
roughly the same.  This is probably not some effect of buffer caching
since I did a blockdev --flushbufs $dev before each test, and
/usr/local/bar is 512MB in size which is twice as large as the main
memory size on that machine.

However, writing to an LV is still much slower than to a normal
partition.


urs
