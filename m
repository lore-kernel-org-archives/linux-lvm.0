From: "B. J. Zolp" <bjzolp@wisc.edu>
Message-id: <3FF9C191.5090006@wisc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] vgck seg faulting
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
Date: Mon Jan  5 13:56:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@sistina.com

I recently replaced a failing drive in my lvm1 volume group by doing a 
dd from the bad drive to a new drive.  However after a few days I can no 
longer mount the logical volume.  When I try to the mount the volume I 
get this output:

mount: wrong fs type, bad option, bad superblock on /dev/vg0/logical0,
       or too many mounted file systems

I have a feeling that the superblock is corrupt. 

I tried running vgck, but it seg faults after a point:

vgck -v
vgck -- locking logical volume manager
vgck -- finding all volume group(s)
vgck -- checking volume group name "vg0"
vgck -- checking existence of volume group "vg0"
vgck -- reading volume group data for "vg0" from lvmtab
vgck -- checking volume group consistency  of "vg0" in lvmtab
vgck -- VGDA of "vg0" in lvmtab is consistent
vgck -- reading volume group data for "vg0" from physical volume(s)
Segmentation fault (core dumped)


Can anyone help me get this mounted again?

thanks,

Bernard Zolp
