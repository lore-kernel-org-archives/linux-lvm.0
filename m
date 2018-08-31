References: <83AC2A1B573A1341BD85C441C9109F591D927D6A@desktoptdc.desktop.local>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <04cad5d3-e60f-3ddb-ea0f-7ffe3786c1a6@redhat.com>
Date: Fri, 31 Aug 2018 12:44:30 +0200
MIME-Version: 1.0
In-Reply-To: <83AC2A1B573A1341BD85C441C9109F591D927D6A@desktoptdc.desktop.local>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Volume/Logic group failed to start - Pacemaker
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Jaco van Niekerk <jaco@desktop.co.za>

Dne 27.8.2018 v 12:25 Jaco van Niekerk napsal(a):
> Hi
> 
> I am receiving the following error when Pacemaker tries to start the LVM 
> volume/logical groups:
> 
> pcs resource debug-start r_lvm
> Operation start for r_lvm (ocf:heartbeat:LVM) returned: 'unknown error' (1)
>  �>� stdout: volume_list=["centos","vg_drbd"]
>  �>� stderr:�� WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers 
> device /dev/vg_drbd/lv_drbd because device is in dm subsystem.
>  �>� stderr: mkdir: cannot create directory 
> '/run/systemd/system/resource-agents-deps.target.d': File exists
>  �>� stderr: INFO: Activating volume group vg_iscsi
>  �>� stderr: INFO: Reading all physical volumes. This may take a while... 
> Found volume group "vg_iscsi" using metadata type lvm2 Found volume group 
> "centos" using metadata type lvm2 Found volume group "vg_drbd" using metadata 
> type lvm2
>  �>� stderr: WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers device 
> /dev/vg_drbd/lv_drbd because device is in dm subsystem. device-mapper: reload 
> ioctl on (253:3) failed: Device or resource busy 0 logical volume(s) in volume 
> group "vg_iscsi" now active
> 
> vgchange -a y vg_iscsi -v
>  � WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs on /dev/vg_drbd/lv_drbd 
> was already found on /dev/drbd0.
>  � WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers device 
> /dev/vg_drbd/lv_drbd because device is in dm subsystem.
>  ��� Activating logical volume vg_iscsi/lv_iscsi_lun0.
>  ��� activation/volume_list configuration setting not defined: Checking only 
> host tags for vg_iscsi/lv_iscsi_lun0.
>  ��� Creating vg_iscsi-lv_iscsi_lun0
>  ��� Loading table for vg_iscsi-lv_iscsi_lun0 (253:3).
>  � device-mapper: reload ioctl on� (253:3) failed: Device or resource busy
>  ��� Removing vg_iscsi-lv_iscsi_lun0 (253:3)
>  ��� Activated 0 logical volumes in volume group vg_iscsi
>  � 0 logical volume(s) in volume group "vg_iscsi" now active
> 
> I can't find any were, were the this resource is being used?
> 



Hi

Your question does look a bit confusing to me - since it's not really clear to 
me what kind of problem you want to solve.

lvm2 tool is reporting to you that you do have problem with seeing duplicated 
devices on your system  (1 PV is visible on multiple different devices -
/dev/drbd0  and  /dev/vg_drbd/lv_drbd   have same signature.

You should probably solve this by setting correct lvm.conf filter - I'd 
suggest to set devices you want to 'accept' as PVs  first and reject 
everything else (see doc around this setting in lvm.conf file - should be easy 
to read and follow).


Then you have there another error reported from DM kernel subsystem - my best 
guess is that you already do have a device with same name but different UUID 
already active and you get a failure when lvm2 tries to create a same device 
with different UUID - but that only my best guess from this short report.

I'd suggest to attach  '-vvvv' trace of failing command and
'dmsetup table'  & 'dmsetup status'  & 'dmsetup info -c'  output listed
if you still have the same problem.

Last but not least - eventually try with clear DM table setting (after reboot).

Regards

Zdenek
