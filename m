From: Nathan Hunsperger <nathan@munchnet.com>
Message-ID: <20030708230524.GE17584@munchnet.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] PV issues with LVM on 2.4.21
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
Date: Tue Jul  8 18:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello -

I'm experiencing an error when trying to scan my volume groups after a
reboot.  When running vgscan, I get:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "pv_read_all_pv_of_vg(): no PV" can't get data of volume group "storage" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

I am running lvm 1.0.7 on top of software raid 5 on 2.4.21.  I grabbed a
fresh copy of 2.4.21 from kernel.org, configured lvm, made the patchset,
patched the kernel, configed the kernel, and then made the kernel...so I
think I'm following all the directions.

As the raid array is running without problems (all drives online, and
array is clean), I suspect a problem with lvm.

Also, just for clarification, on a reboot (after I load the disk
controller module, but before I run any lvm commands) if I dd /dev/zero
over /dev/md/0, I am able to pvcreate, vgcreate, lvcreate, mkfs, and
mount just fine.  After a reboot, however, I get the above error.

Any ideas?  I don't particularly like the idea of a 1/2TB of volatile
storage.

- Nathan
