From: "B. J. Zolp" <bjzolp@wisc.edu>
Message-id: <200305100135.50292.bjzolp@wisc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: [linux-lvm] Help with restoring missing VG
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
Date: Sat May 10 01:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Today my file server was acting up and I had to reboot it.  Apon reboot the 
system would lock up while mounting local file systems.  I took the line that 
mounted my logical volume out of fstab and the machine booted fine, but 
manually mounting the volume also caused lockups.  

I had a hunch that the most recent drive I added to the volume group was 
dying, so I ran  vgreduce vg0 /dev/hdf to remove that disk and hopeed to  
still be able to access what was on the remainder of the volume.  (I can live 
with loosing what might be on the newer drive, but I absolutely need what is 
on the other drives).

In any case the vgreduce command did not seem to be removing the pv, I cannot 
remember the exact error however.  I then ran a pvscan, which locked up, so I 
rebooted again and now my vg0 volume group is not there.  I can run pvscan 
and get this:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc"   is associated 
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/disc"   is associated 
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part4"  is associated 
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/disc"   is associated 
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part7"  is associated 
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"   is associated 
to an unknown VG (run vgscan)
pvscan -- total: 6 [565.71 GB] / in use: 6 [565.71 GB] / in no VG: 0 [0]

***^^^^ NOTE: the failing drive is no longer listed as a pv, so apparently 
that drive has atleast been removed

but vgscan gives me:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


I was going to try to recreate the VG, but wanted to do somemore research and 
check this list before doing so, I do not want to loose any data.  

My layout is pretty simple  one logical volume using 100% of the volume group 
spanned over 6-7 drives.

So basically I would atleast like to get the drives listed in pvscan above 
added back to a VG that I can mount and access the data from.


thanks for any help you can spare,

bjz
