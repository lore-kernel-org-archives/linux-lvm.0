From: Chip McArtor <mcm262@psu.edu>
Message-Id: <20030711171930.68fbc490.mcm262@psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Safely removing a phantom disc-wide PV
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
Date: Fri Jul 11 16:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

In my current setup, I have 4 PVs forming my VG.  Initially, two of the PVs took up only single partitions on separate discs [/dev/hdk2 and /dev/hdi2], while the other two PVs spanned the entirety of another two discs [/dev/hdf and /dev/hdj].

At some point, I installed windows on an entirely different drive, and it must have recognized hdf and hdj as being empty (since they didnt' contain a partition table) and overwrote a bit here and there, corrupting both of those PVs.  Realizing the problem with a device-wide PV, I built the VG again from scratch, this time creating partitions hdf1 and hdj1 which spanned the entire space of those drives.

VG creation was successfully done with the following command:
vgcreate array /dev/hdk2 /dev/hdi2 /dev/hdf1 and /dev/hdj

The VG creation was a success, and soon I had created an LV and a filesystem on top of that.  After I rebooted, however, I got the following error message:


bash-2.05b# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "array" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


Running pvscan showed me that /dev/hdk2, /dev/hdi2, /dev/hdf1, and /dev/hdj1 were all indeed shown belonging to my VG "array".  However, the old PVs /dev/hdf and /dev/hdj were also present, also pointing to group "array".  Because /dev/hdf and /dev/hdj were corrupt, the VG is now unloadable.  How could I safely remove/disable hdf and hdj, without harming the valid PVs hdf1 and hdj1?  vgremove is inoperable, since my VG "array" in unloadable.  One possibility I was considering was running dd from /dev/zero to certain blocks on hdf and hdj, but I'm afraid to try something like that, since it might very well wipe out the partition tables and destroy hdf1 and hdj1 if I write to the wrong blocks.

Any ideas?


-Chip
