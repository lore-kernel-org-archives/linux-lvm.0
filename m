From: Thor Kristoffersen <Thor.Kristoffersen@nr.no>
Message-Id: <yznvgd3dqbr.fsf@triumph.nr.no>
MIME-Version: 1.0
Subject: [linux-lvm] [BUG] pvmove failed on last PE in PV
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
Date: Tue Feb 12 03:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

I have been running LVM for the past six months without any problems until
last night when I migrated all PVs to a new disk.  On one particular PV
(hda2) which had all its physical extents allocated, LVM managed to move
all physical extents except the last one.  It complained about not being
able to read past the end of the device, and that it was missing the last
65536 bytes.  I eventually managed to solve the problem by adding the hda3
partition to hda2.  Only then was it able to move the last physical extent.

Hardware setup:
  Mainboard: MSI K7T266-Pro2
  Primary master: IBM DTLA-307045
  Secondary master: Seagate ST380021A

Software setup:
  Redhat 7.1
  Linux 2.4.6.
  LVM 0.9.1-beta7


Thor
