From: Trond Michelsen <mike@crusaders.no>
Message-ID: <20040114194411.A847@crusaders.no>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] removed disk without using vgreduce
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
Date: Wed Jan 14 13:41:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi.

I've just screwed up my volume group, and I hope there's a way to fix
it.

I recently had to change one of the disks in my system, so I added a new
disk, and used pvmove to move all PEs from the old disk to the new. Then
I mounted the LV to make sure that everything was fine. Then I shut down
the system, removed the disk and gave it away. Completely forgetting
about vgreduce. Obviously, now vgscan can't find all PVs belonging to
the VG, so it refuses to make it available. vgreduce can't remove a PV
from a VG that isn't available, so I'm a bit stuck now.

The original disk is now gone and reformatted, so sticking it back into
the system for a couple of minutes is not an option, unfortunately :(
Is there a way to let LVM know that this disk is no longer part of the
VG, without having it? 

-- 
  // Trond Michelsen
\X/  mike@crusaders.no
