From: Chip McArtor <mcm262@psu.edu>
Message-Id: <20030711192842.10c78393.mcm262@psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Safely removing a phantom disc-wide PV
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
Date: Fri Jul 11 18:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, I feel sort of dumb for answering my own problem, but since none of the lvm tools seemed to be of any use, as my VG was non-existant, I might as well tell you how I fixed my problem.

Basically, I reassigned the VG of the two corrupt PVs to some dummy VG.  In this case, the real VG was "array" and the dummy VG was "arrey".


#dd if=/dev/hdf of=hdf.head bs=1024 count=1
#sed s/array/arrey/ hdf.head > hdf.test
#dd if=hdf.test of=/dev/hdf bs=1024 count=1

Those commands are pretty self-explanatory.  Upon running vgscan after this, the hdf PV was still there, but instead of being assigned to 'array', it was assigned to 'arrey'.  This meant that 'array' had no corrupt volumes in it, and as such could be loaded without incident.

There's probably a cleaner way of fixing the problem of a bad device-level PV, but this method seems to work pretty well.

-Chip

>In my current setup, I have 4 PVs forming my VG.  Initially, two of the PVs took up only single partitions on separate discs [/dev/hdk2 and /dev/hdi2], while the other two PVs spanned the entirety of another two discs [/dev/hdf and /dev/hdj].
>
>At some point, I installed windows on an entirely different drive, and it must have recognized hdf and hdj as being empty (since they didnt' contain a partition table) and overwrote a bit here and there, corrupting both of those PVs.  Realizing the problem with a device-wide PV, I built the VG again from scratch, this time creating partitions hdf1 and hdj1 which spanned the entire space of those drives.
>
>VG creation was successfully done with the following command:
>vgcreate array /dev/hdk2 /dev/hdi2 /dev/hdf1 and /dev/hdj
>
>The VG creation was a success, and soon I had created an LV and a filesystem on top of that.  After I rebooted, however, I got the following error message:
>
>
>bash-2.05b# vgscan 
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "array" from physical volume(s)
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of your volume group
>
>
>Running pvscan showed me that /dev/hdk2, /dev/hdi2, /dev/hdf1, and /dev/hdj1 were all indeed shown belonging to my VG "array".  However, the old PVs /dev/hdf and /dev/hdj were also present, also pointing to group "array".  Because /dev/hdf and /dev/hdj were corrupt, the VG is now unloadable.  How could I safely remove/disable hdf and hdj, without harming the valid PVs hdf1 and hdj1?  vgremove is inoperable, since my VG "array" in unloadable.  One possibility I was considering was running dd from /dev/zero to certain blocks on hdf and hdj, but I'm afraid to try something like that, since it might very well wipe out the partition tables and destroy hdf1 and hdj1 if I write to the wrong blocks.
>
>Any ideas?
>
>
>-Chip
