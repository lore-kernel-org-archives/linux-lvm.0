Message-ID: <EA753F4887A6ED449866D7F307ABBFDB4DB68E@mailserver.e-r-solutions.com>
From: ERG@e-r-solutions.com
MIME-Version: 1.0
Subject: [linux-lvm] Error - "device-mapper: request is larger than block size b_size"
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
Date: Tue Aug 20 11:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Greetings,

I'm running two XFS 1.1 filesystems on top of a pair of LVM 2 volumes.  My
version info is:

tapemaster:/# uname -r && lvm version
2.4.19-xfs
  LVM version:     1.95.10 (2002-05-31)
  Library version: 0.96.03-ioctl (2002-06-27)
  Driver version:  1.0.3

What I'm seeing is thousands of lines of this:

device-mapper: request is larger than block size b_size (2048), block size
(512)
device-mapper: request is larger than block size b_size (2048), block size
(512)
device-mapper: request is larger than block size b_size (1024), block size
(512)
device-mapper: request is larger than block size b_size (4096), block size
(512)
device-mapper: request is larger than block size b_size (4096), block size
(512)

I'm thinking that this is not a critical error, as I've been seeing it
whenever there's disk activity on the LVs ever since I got LVM2 up & running
(a few days).  I found the error in the code on line 4586 of
../patches/linux-2.4.19-devmapper-ioctl.patch (and also on line 570 of my
patched ../linux-2.4.19/drivers/md/dm.c), but my knowledge of C is terrible.

Another point to note is that I created the filesystems (1 on each LV) with
the defaults (i.e., 'mkfs -t xfs /dev/vg1/lv1'), which seems to default to a
4096 byte block size.  However, I'm confused, because I would expect that
all the requests would be for 4096 bytes if that were the cause.

Does anyone have any information on the severity of this message?  Even
better, does anyone have any clues as to how I might resolve or suppress
this warning?

Thanks,
Manuel Gomez
