From: Gaziz Nugmanov <lvm@betta.gaziz.ca>
Message-ID: <1872187134.20011030104808@betta.gaziz.ca>
Subject: Re: [linux-lvm] Segmentation Fault with vgextend and LVM 1.0.1rc4
In-Reply-To: <3BDE0947.7090203@gadreau.net>
References: <3BDE0947.7090203@gadreau.net>
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
Date: Tue Oct 30 09:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jean-Noel GADREAU <linux-lvm@sistina.com>

Hello Jean-Noel,

I had similar problem so I cvs'ed latest lvm code and installed it.

It works much smoother for me now...

Hope that help.




Monday, October 29, 2001, 8:58:31 PM, you wrote:

JNG> Hi.

JNG> I have a problem to extend my current volume group "vg01". I did:

JNG> # pvcreate /dev/hde1 /dev/hde2
JNG> pvcreate -- physical volume "/dev/hde1" successfully created
JNG> pvcreate -- physical volume "/dev/hde2" successfully created

JNG> # vgextend -v vg01 /dev/hde1
JNG> vgextend -- locking logical volume manager
JNG> vgextend -- checking volume group name "vg01"
JNG> vgextend -- checking volume group "vg01" existence
JNG> vgextend -- checking for inactivity of volume group
JNG> vgextend -- reading data of volume group "vg01" from lvmtab
JNG> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
JNG> vgextend -- reading data for all physical volumes from disk(s)
JNG> vgextend -- extending VGDA structures of volume group "vg01"
JNG> vgextend -- volume group "vg01" will be extended by 1 new physical volumes
JNG> vgextend -- extending volume group "vg01" by physical volume "/dev/hde1" 
JNG> in kernel
JNG> Segmentation fault (core dumped)

JNG> I am using RedHat 7.1 with a custom kernel to have LVM (2.4.9-6). I have 
JNG> 2 drives on this IDE controller (a Promise UltraDMA100DX2) and both work 
JNG> fine with linux. My secondary drive (/dev/hdf is already part of vg01).

JNG> I don't know if this is a bug or if I am not using this correctly. I 
JNG> could not find anything on the internet about this particular problem.

JNG> For more information, I am including the results of several commands. 
JNG> Let me know if you need more information.

JNG> Thanks in advance for your help.
JNG> Regards,
JNG> Jean-Noel GADREAU

JNG> ============================================

JNG> # vgdisplay -v vg01
JNG> --- Volume group ---
JNG> VG Name               vg01
JNG> VG Access             read/write
JNG> VG Status             available/resizable
JNG> VG #                  0
JNG> MAX LV                256
JNG> Cur LV                1
JNG> Open LV               1
JNG> MAX LV Size           255.99 GB
JNG> Max PV                256
JNG> Cur PV                1
JNG> Act PV                1
JNG> VG Size               37.27 GB
JNG> PE Size               4.00 MB
JNG> Total PE              9541
JNG> Alloc PE / Size       9500 / 37.11 GB
JNG> Free  PE / Size       41 / 164.00 MB
JNG> VG UUID               SCcP8o-73vj-4rCl-GbTx-A0up-5GAu-BEEgVL

JNG> --- Logical volume ---
JNG> LV Name                /dev/vg01/data
JNG> VG Name                vg01
JNG> LV Write Access        read/write
JNG> LV Status              available
JNG> LV #                   1
JNG> # open                 1
JNG> LV Size                37.11 GB
JNG> Current LE             9500
JNG> Allocated LE           9500
JNG> Allocation             next free
JNG> Read ahead sectors     120
JNG> Block device           58:0


JNG> --- Physical volumes ---
JNG> PV Name (#)           /dev/hdf1 (1)
JNG> PV Status             available / allocatable
JNG> Total PE / Free PE    9541 / 41

JNG> =============================================
JNG> # vgscan -v
JNG> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
JNG> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
JNG> vgscan -- reading all physical volumes (this may take a while...)
JNG> vgscan -- scanning for all active volume group(s) first
JNG> vgscan -- found active volume group "vg01"
JNG> vgscan -- reading data of volume group "vg01" from physical volume(s)
JNG> vgscan -- inserting "vg01" into lvmtab
JNG> vgscan -- backing up volume group "vg01"
JNG> vgscan -- checking volume group name "vg01"
JNG> vgscan -- checking volume group consistency of "vg01"
JNG> vgscan -- checking existence of "/etc/lvmtab.d"
JNG> vgscan -- storing volume group data of "vg01" in "/etc/lvmtab.d/vg01.tmp"
JNG> vgscan -- storing physical volume data of "vg01" in "/etc/lvmtab.d/vg01.tmp"
JNG> vgscan -- storing logical volume data of volume group "vg01" in 
JNG> "/etc/lvmtab.d/v
JNG> g01.tmp"
JNG> vgscan -- renaming "/etc/lvmtab.d/vg01.tmp" to "/etc/lvmtab.d/vg01"
JNG> vgscan -- removing special files and directory for volume group "vg01"
JNG> vgscan -- creating directory and group character special file for "vg01"
JNG> vgscan -- creating block device special files for vg01
JNG> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
JNG> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
JNG> group

JNG> =============================================
JNG> # pvscan -v
JNG> pvscan -- reading all physical volumes (this may take a while...)
JNG> pvscan -- walking through all physical volumes found
JNG> pvscan -- inactive PV "/dev/hde1" is in no VG  [18.64 GB]
JNG> pvscan -- inactive PV "/dev/hde2" is in no VG  [18.64 GB]
JNG> pvscan -- ACTIVE   PV "/dev/hdf1" of VG "vg01" [37.27 GB / 164.00 MB free]
JNG> pvscan -- total: 3 [74.56 GB] / in use: 1 [37.27 GB] / in no VG: 2 
JNG> [37.29 GB]





JNG> _______________________________________________
JNG> linux-lvm mailing list
JNG> linux-lvm@sistina.com
JNG> http://lists.sistina.com/mailman/listinfo/linux-lvm
JNG> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html



-- 
Best regards,
 Gaziz                            mailto:lvm@betta.gaziz.ca
