Message-Id: <20020417013928.I27907@progsoc.uts.edu.au>
MIME-Version: 1.0
Content-Disposition: inline
From: Anand Kumria <wildfire@progsoc.uts.edu.au>
Subject: [linux-lvm] pecopy or lecopy
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
Date: Tue Apr 16 10:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi there,

Quite some time ago, Heinz assisted me with a partial recovery of
data from one of my LVM volumes. In the meantime I've managed to
reconstruct a lot of it but have discovered there are one or two
items I need to get back from the original.

I'm using LVM tool 1.1rc1 reports:
caliban:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "caliban"
vgscan -- only found 11364 of 11520 LEs for LV /dev/caliban/h2
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

If I try and mount the h2 filesystem my kernel opps as the first 150
PE<->LE mappings don't exist. Has anyone written a tool that copies
either PEs or LEs from disk without mounting the affected partition?

That would allow me to salvage more of the data. I'm at the point where
writing the code myself is an option if only I got some pointers. I'm
unclear on where the mapping from LE<->PE<->disk blocks is stored. Plus
I'm finding it confusing trying to see which version of the on-disk metadata
LVM is using.

Thanks,
Anand

-- 
 `` We are shaped by our thoughts, we become what we think.
 When the mind is pure, joy follows like a shadow that never
 leaves. '' -- Buddha, The Dhammapada
