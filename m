From: jarausch@igpm.rwth-aachen.de
Message-Id: <200202231207.NAA34732@numa1.igpm.rwth-aachen.de>
MIME-Version: 1.0
Subject: [linux-lvm] vgcreate looks at devices it shouldn't
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
Date: Sat Feb 23 06:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

on the second machine where I would like to create LVM volumes
I have the following problem

The ZIP drive and the CDROM drive are mapped to
hdd (hdc resp.)  BUT due to a kernel parameter
hdc=ide-scsi hdd=ide-scsi
these are no more accessible as  /dev/hdd /dev/hdc

Now pvcreate /dev/sdb1 works fine but
vgcreate home /dev/sdb1
produces error messages like
ide-scsi: hdd unsupported command in request queue (0)
  ....
and after some such messages
vgcreate -- ERROR "pv_read(): read" reading physical volumes.

AND the desired volume group on my  scsi drive /dev/sdb1
is NOT created.

What can one do about this. How to tell the utilities
to never look at /dev/hd?

I am using lvm-1.0.2

Does this problem vanish with 2.0 ?

Many thanks for a hint,

Helmut Jarausch

Lehrstuhl fuer Numerische Mathematik
Institute of Technology, RWTH Aachen
D 52056 Aachen, Germany
