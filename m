Message-ID: <005c01c2c624$2fff0680$4b66699f@win.doc.state.vt.us>
From: "Joseph Kezar" <jkezar@doc.state.vt.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] reuses an existing LV number
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
Date: Mon Jan 27 10:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have a situation here where I have to Volume groups

VolumeMailData
and
vg0

I just created 2 more Logical Volumes(LV) on VolumeMailData to make a total
of 4.
I then rebooted and got this error

vgscan - found an inactive volume group "VolumeMailData"
vgscan - found an inactive volume group "vg0"
vgscan - volume group "vg0" reuses an existing logical volume number; please
vgexport/vgimport that VG or use option -f

....

kernel panic: no init found; try passing init=

VolumeMailData gets activated.  But my root (/) is on vg0 which doesnt get
activated and I am dead in the water.

I can detach my JBOD/RAID Array which makes up VolumeMailData so I can boot.
This way it doesnt find the inactive volume group VolumeMailData and vgo is
able to come up normaly

How can I fix this problem, as it is I kinda need both volume groups
functioning simantaniously :)
Thanks,
Joe Kezar
