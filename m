Message-ID: <216066D1A4083A48BAD8651A0A2CF6A0E11E0F@ausx2kmpc104.aus.amer.dell.com>
From: Dan_Caulfield@Dell.com
Subject: RE: [linux-lvm] removed disk without using vgreduce
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan 14 14:10:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Even with the original disk being reformatted, you can use vgcfgrestore to
restore the LVM metadata.  I'm not sure of the exact syntax, so check the
man page.  You should be able to use vgscan followed by vgchange --partial
-a -y to mount the volume group read-only.  This might allow the vgreduce
command to work.



-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Trond Michelsen
Sent: Wednesday, January 14, 2004 12:44 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] removed disk without using vgreduce

Hi.

I've just screwed up my volume group, and I hope there's a way to fix it.

I recently had to change one of the disks in my system, so I added a new
disk, and used pvmove to move all PEs from the old disk to the new. Then I
mounted the LV to make sure that everything was fine. Then I shut down the
system, removed the disk and gave it away. Completely forgetting about
vgreduce. Obviously, now vgscan can't find all PVs belonging to the VG, so
it refuses to make it available. vgreduce can't remove a PV from a VG that
isn't available, so I'm a bit stuck now.

The original disk is now gone and reformatted, so sticking it back into the
system for a couple of minutes is not an option, unfortunately :( Is there a
way to let LVM know that this disk is no longer part of the VG, without
having it? 

--
  // Trond Michelsen
\X/  mike@crusaders.no

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
