From: Daniel Sully <daniel@electricrain.com>
Message-Id: <20020109224112.GG30764@electricrain.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm snapshot fails
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
Date: Wed Jan  9 16:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm attempting to create a snapshot volume for a 50GB partition, however
the lvcreate fails with the following error:

$ lvcreate -L1G -s -n wwwsnap /dev/vg00/www
lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for "/dev/vg00/wwwsnap"
File size limit exceeded

strace shows it's getting a EFBIG error -

open("/dev/sdc1", O_WRONLY)             = 4
_llseek(4, 214756169728, [214756169728], SEEK_SET) = 0
write(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = -1 EFBIG (File too large)
--- SIGXFSZ (File size limit exceeded) ---
+++ killed by SIGXFSZ +++

This is with 2.4.17, patched with 1.0.1 and 1.0.1 userland tools.

Here's my pvscan:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "vg00" [457.98 GB / 257.98 GB free]
pvscan -- total: 1 [457.99 GB] / in use: 1 [457.99 GB] / in no VG: 0 [0]

Is there a special 64bit flag I need to set somewhere to allow the
lvmtools to deal with a device that large?

-D
--
When Hell freezes over, I'll snowboard there too.
