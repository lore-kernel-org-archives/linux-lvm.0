Return-Path: <071cc796a61a0f17b230a60d353903bb@interlinx.bc.ca>
Date: Tue, 12 Jun 2001 21:28:04 -0700
Message-ID: <20010612212804.P1658@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
Subject: [linux-lvm] expanding physical disks
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

How does LVM deal with physical disks that can get bigger or smaller,
such as a hardware RAID device?  What happens to a PV on a hardware
RAID-5 device that is presented to the system as a single (say scsci)
target when you put a few more disks in it and tell the hardware raid
device to add them to the given (scsi) target that a PV was created
on?  (what a mouthful).

Is this really possible or can one only expand a hardware raid array
for LVM usage by adding additional raid targets and then adding the
raid targets as PVs to a VG?

b.
