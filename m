Message-ID: <383928ED.A75F5144@mchp.siemens.de>
Date: Mon, 22 Nov 1999 12:28:45 +0100
From: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
MIME-Version: 1.0
Subject: [linux-lvm] Q: active/inactive/imported/exported group ?
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


Recently I've made my first steps with LVM and
I think I really like it. I've just a few questions:

I'm wondering, what's the actual difference betweent
an inactive, imported and an exported group?

My impression was, that exported groups are ignored
by "vgscan" and therefore cannot be activated later.
Is this merely the only difference?

Furthermore I tried to move an inactive but *imported*
group to another host:

   on host A:
   vgchange -an <group>

   move disks to host B
   on host B:
   vgscan
   vgchange -ay <group>

... and it seemed to work.

Is there anything wrong, if I transport disks
in this way? Can there be any bad side effects,
if I do *not* export on host A and then import on host B,
but only deactivate on host A and then scan and activate
the group on host B?

Is there a reason why I have to specify phys. disks for
the "vgimport" command? Would'nt it also be possible to
scan all disks for the group that is to be imported?

And one last question:
When does LVM assign minor device numbers to a volume?
Will the minor number of a volume remain constant as long
as the volume exists in the group or does LVM assign new
minor numbers each time a group or volume gets activated?


Thank you very much in advance,
Gerhard
