Return-Path: <root@srv.sistina.com>
Date: Tue, 8 May 2001 09:36:06 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Question about LVM
Message-ID: <20010508093606.A31443@sistina.com>
References: <200105080129.f481TB104985@mail5.dreamwiz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <200105080129.f481TB104985@mail5.dreamwiz.com>; from juspeace@dreamwiz.com on Tue, May 08, 2001 at 10:29:06AM +0900
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tue, May 08, 2001 at 10:29:06AM +0900, ��ȫ�� wrote:
> HI! Heinz Manelshagen
> 
> I am hongseok Lee.
> I am a student working on sungkyunkwan Univ. in korea.
> I tried to construct Logical Volume Management (LVM) in my PC,
>  but I don't know how I can't do anymore.
> 

Hi,

the output shows that you were able to create a volume group.

It looks like you don't have the LVM driver set up properly though
which is necessary to activate your volume group in order to proceed
and make logical volumes.


Did you follow the instructions in PATCHES/README contained in the LVM
tarball to patch your kernel and build the driver?

Did you activate the LVM driver in the kernel configuration?

It doesn't matter in principle if you choose driver or module during
kernel configuration.

If you choosed module: did you load the module or configured the module
                       loader to do it?


BTW: I recommend that you get the actual LVM software 0.9.1 Beta 7 from
     www.sistina.com/lvm before you retry, because it fixes some bugs
     you otherwise would still have with 0.9.1 Beta 5.

Regards,
Heinz    -- The LVM Guy --


> First I pactched Linux-version 2.4.0 and uploaded LVM 0.9.1-Beta5.
> It is successfully.
> So I maked 3 Physical volume. (/dev/hdb1, /dev/hdb2, /dev/hdb3)
> And I tried to make VG, But it is not available.
> I think PV's state are inactive is primary problem.
> Therfore I can't do any progress.
> How can I change this PV state is active and VG state is available?
> Plz, check next text result and give me some advice.
> I red LVM HOWTO. But there is no describe this problem.
> 
> - RESULT
> 
> pvscan.txt
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdb1" of VG "group1" [3.84 GB / 3.84 GB free]
> pvscan -- inactive PV "/dev/hdb2" of VG "group1" [3.84 GB / 3.84 GB free]
> pvscan -- inactive PV "/dev/hdb3" of VG "group1" [5.03 GB / 5.03 GB free]
> pvscan -- total: 3 [12.72 GB] / in use: 3 [12.72 GB] / in no VG: 0 [0]
> 
> 
> pvdisplay_hdb1.txt
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               group1
> PV Size               3.85 GB / NOT usable 1.47 MB [LVM: 124 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              984
> Free PE               984
> Allocated PE          0
> PV UUID               FSebAC-CooV-3wl2-bAcm-k17y-vUFD-zbByTu
> 
> 
> vgscan.txt
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "group1"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> 
> vgdisplay.txt
> --- Volume group ---
> VG Name               group1
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               12.72 GB
> PE Size               4 MB
> Total PE              3256
> Alloc PE / Size       0 / 0
> Free  PE / Size       3256 / 12.72 GB
> VG UUID               3i0sjU-p0iT-azB5-FKeI-lNss-AB6G-uDmolp
> 
> 
> 
> 
> 
> 
> -------------------------------------------------
> DreamWiz Free Mail @ http://www.dreamwiz.com/
> DreamSearch Click the world!!! http://search.dreamwiz.com/
> 


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
