From: Matt Schillinger <mschilli@vss.fsi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1042151798.18166.271.camel@mosix>
Mime-Version: 1.0
Subject: [linux-lvm] UUID
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
Date: Thu Jan  9 16:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Can someone explain the UUID, etc  on a volume and on VGs?

Is the UUID stored on the volume, or on the host machine?

The reason I ask, is that I have a parrallel scsi raid, which is
connected to 2 machines.  If i reboot both machines, or go through a
vgexport/import procedure (while online), i can see the VGs and LVs on
both machines.. can even mount the volumes simultaneously (It was only a
test.. I understand that it is not a Shared Filesystem, and would never
do simultaneous mounts on production filesystems). 

This is what I believe to be the case:

1. The UUID is stored on the volume itself, and the VG data is stored
somewhere on the disks also.
2. The import/export/activated/deactivated status of a volume is held on
the host machine.

this allows 2 machines to see the same VG/LVs. 

Is this correct?  And is it supported as a function of LVM, or am I in
'unsupported' territory?


-- 
Matt Schillinger
mschilli@vss.fsi.com
