From: Trond Michelsen <mike@crusaders.no>
Subject: Re: [linux-lvm] removed disk without using vgreduce
Message-ID: <20040115233130.H847@crusaders.no>
References: <216066D1A4083A48BAD8651A0A2CF6A0E11E0F@ausx2kmpc104.aus.amer.dell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <216066D1A4083A48BAD8651A0A2CF6A0E11E0F@ausx2kmpc104.aus.amer.dell.com>; from Dan_Caulfield@Dell.com on Wed, Jan 14, 2004 at 01:09:02PM -0600
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
Date: Thu Jan 15 17:29:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 01:09:02PM -0600, Dan_Caulfield@Dell.com wrote:
> Even with the original disk being reformatted, you can use vgcfgrestore to
> restore the LVM metadata.  I'm not sure of the exact syntax, so check the
> man page.  You should be able to use vgscan followed by vgchange --partial
> -a -y to mount the volume group read-only.  This might allow the vgreduce
> command to work.

Thank you. vgcfgrestore was all I needed.

So, in case anybody else are as stupid as me, here's what I did to
recover:

First I created a new PV on an unused partition I had.

# pvcreate /dev/hda5
pvcreate -- physical volume "/dev/hda5" successfully created

then I used vgcfgrestore with the --ignore_size argument, to have this
partition pretend to be the old disk

# vgcfgrestore --name vg1 --ignore_size --oldpath /dev/hdk --verbose /dev/hda5
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg1.conf"
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vg1" from "/etc/lvmconf/vg1.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/vg1.conf"
vgcfgrestore -- reading volume group data for "vg1" from "/etc/lvmconf/vg1.conf"
vgcfgrestore -- reading physical volume data for "vg1" from "/etc/lvmconf/vg1.conf"
vgcfgrestore -- reading logical volume data for "vg1" from "/etc/lvmconf/vg1.conf"
vgcfgrestore -- checking volume group consistency of "vg1"
vgcfgrestore -- checking volume group consistency of "vg1"
vgcfgrestore -- reading physical volume "/dev/hda5"
vgcfgrestore -- checking for new physical volume "/dev/hda5"
vgcfgrestore -- forcing write of VGDA of "vg1" to physical volume "/dev/hda5"
vgcfgrestore -- ignoring size mismatches
vgcfgrestore -- writing VGDA of "vg1" to physical volume "/dev/hda5"
vgcfgrestore -- removing any special files for "vg1"
vgcfgrestore -- VGDA for "vg1" successfully restored to physical volume "/dev/hda5"

after this, vgscan found the VG

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

I activated the VG

# vgchange -a y vg1
vgchange -- volume group "vg1" successfully activated

and I could now remove the unused PV from the VG

# vgreduce vg1 /dev/hda5
vgreduce -- doing automatic backup of volume group "vg1"
vgreduce -- volume group "vg1" successfully reduced by physical volume:
vgreduce -- /dev/hda5

Finally, everything is back to normal :-)


Again. Thank you very much. 


-- 
  // Trond Michelsen
\X/  mike@crusaders.no
