Message-ID: <OF03F74D9E.DBB3955D-ON87256AE2.006CAD58@boulder.ibm.com>
From: "Donald W Watson" <dwatson@us.ibm.com>
Date: Thu, 11 Oct 2001 12:48:06 -0700
MIME-Version: 1.0
Subject: [linux-lvm] devfs/vgchange error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Donald W Watson <dwatson@us.ibm.com>

I'm using Linux 2.4.10 and lvm 1.0.1-rc4.

Without devfs, perform the following:

1.  Create a physical volume on some LVM partition (e.g., /dev/hda7).
2.  Run pvscan--it shows the physical volume /dev/hda7.
3.  Create a volume group (vg7) using the physical volume created in step
1.  There now exists a device /dev/vg7/group.
4.  Run vgscan--it shows the active volume group vg7.
5.  Run vgchange -an.  The device /dev/vg7/group still exists.
6.  Run vgscan--it shows the inactive volume group vg7.

Rebuild the kernel with devfs and perform the following:

1.  Run pvscan--it shows the physical volume
/dev/ide/host0/bus0/target0/lun0/part7.
2.  Run vgscan--it shows the active volume group vg7.
3.  Run vgchange -an.  The device /dev/vg7/group is gone.
4.  Run vgscan--it seg faults.  In fact, any command that attempts to open
/dev/ide/host0/bus0/target0/lun0/part7 seg faults.

This does not appear to be a conversion problem from non-devfs to devfs; it
happens even if you start with devfs.
