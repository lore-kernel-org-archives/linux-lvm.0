From: Dick Streefland <dick.streefland@altium.nl>
Message-ID: <20031123200503.GA15297@altium.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pvmove fails on 2.6.0-test9
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
Date: Sun Nov 23 14:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Is pvmove supposed to work on a 2.6.0-test9 kernel? When I try to
clear a physical volume, I get the message:

  device-mapper ioctl cmd 9 failed: Invalid argument

The kernel is compiled with CONFIG_DM_IOCTL_V4, and I'm using
lvm2-2.00.06. You should be able to reproduce this error with the
following script:

--------------------------------------------------
#!/bin/sh -x

dd bs=1024k count=20 if=/dev/zero of=/tmp/image1
dd bs=1024k count=20 if=/dev/zero of=/tmp/image2
losetup /dev/loop1 /tmp/image1
losetup /dev/loop2 /tmp/image2 
pvcreate /dev/loop[12]
vgcreate -s 1 test /dev/loop[12]
lvcreate -L 8 -n a test
lvcreate -L 8 -n b test
lvcreate -L 8 -n c test
lvremove -f /dev/test/a
lvremove -f /dev/test/b

# this fails:
pvmove -v /dev/loop2
pvmove --abort

lvremove -f /dev/test/c
vgremove test
pvremove /dev/loop[12]
losetup -d /dev/loop2
losetup -d /dev/loop1
rm -f /tmp/image[12]
--------------------------------------------------

The output from the first pvmove command is:

+ pvmove -v /dev/loop2
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'test-pvmove0'.
  ABORTING: Temporary mirror activation failed.
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'test-c'.
    Finding volume group "test"
    Archiving volume group "test" metadata.
    Creating logical volume pvmove0
    Moving 5 extents of logical volume test/c
    Found volume group "test"
    Found volume group "test"
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/test"
    Found volume group "test"
    Found volume group "test"
    Loading test-pvmove0
    Found volume group "test"
    Loading test-c

-- 
Dick Streefland                      ////                      Altium BV
dick.streefland@altium.nl           (@ @)          http://www.altium.com
--------------------------------oOO--(_)--OOo---------------------------
