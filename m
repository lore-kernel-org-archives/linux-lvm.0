Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3G8u0Is005516
	for <linux-lvm@redhat.com>; Fri, 16 Apr 2010 04:56:00 -0400
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3G8to5V005356
	for <linux-lvm@redhat.com>; Fri, 16 Apr 2010 04:55:51 -0400
Received: from fela.liber4e.com (fela.liber4e.com [127.0.0.1])
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id o3G8tdfS028139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Apr 2010 09:55:49 +0100
Message-ID: <c3ddeadaff6c2abaf928cf7636469164.squirrel@fela.liber4e.com>
In-Reply-To: <t2qf4f537b51004150541q7259aa0bl8f17a303d053e4c0@mail.gmail.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
	<20100225161112.GA14691@us.ibm.com>
	<230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
	<a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
	<1271286129.2462.0.camel@localhost>
	<dfcfa84ce3699e54c9fd46ec9513ec78.squirrel@fela.liber4e.com>
	<84a79d88f5a51620ee2f8349696c3377.squirrel@fela.liber4e.com>
	<t2qf4f537b51004150541q7259aa0bl8f17a303d053e4c0@mail.gmail.com>
Date: Fri, 16 Apr 2010 08:55:39 -0000 (GMT)
From: "jose nuno neto" <jose.neto@liber4e.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Lvm hangs on San fail
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi


> Can you show us a pvdisplay or verbose vgdisplay ?
>

Here goes the vgdisplay -v of one of the vgs with mirrors

###########################################################

--- Volume group ---
  VG Name               vg_ora_jura
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  705
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               52.79 GB
  PE Size               4.00 MB
  Total PE              13515
  Alloc PE / Size       12292 / 48.02 GB
  Free  PE / Size       1223 / 4.78 GB
  VG UUID               nttQ3x-4ecP-Q6ms-jt2u-UIs4-texj-Q9Nxdt

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_arch
  VG Name                vg_ora_jura
  LV UUID                8oUfYn-2TrP-yS6K-pcS2-cgI4-tcv1-33dSdX
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:28

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_export
  VG Name                vg_ora_jura
  LV UUID                NLfQT6-36TS-DRHq-PJRf-9UDv-L8mz-HjPea2
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:32

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_data
  VG Name                vg_ora_jura
  LV UUID                VtSBIL-XvCw-23xK-NVAH-DvYn-P2sE-OkZJro
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                12.00 GB
  Current LE             3072
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:40

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_redo
  VG Name                vg_ora_jura
  LV UUID                KRHKBG-71Qv-YBsA-oJDt-igzP-EYaI-gPwcBX
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:48

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_arch_mimage_0
  VG Name                vg_ora_jura
  LV UUID                lQCOAt-aoK3-HBp1-xrQW-eh7L-6t94-CyAg5c
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:26

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_arch_mimage_1
  VG Name                vg_ora_jura
  LV UUID                snrnPc-8FxY-ekAk-ooNe-sBws-tuI0-cTFfj3
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:27

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_arch_mlog
  VG Name                vg_ora_jura
  LV UUID                ouqaCQ-Deex-iArv-xLe9-jg8b-5cLf-3SChQ1
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 MB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:25

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_data_mlog
  VG Name                vg_ora_jura
  LV UUID                TmE2S0-r8ST-v624-RxUn-Qppw-2l8p-jM9EC9
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 MB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:37

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_data_mimage_0
  VG Name                vg_ora_jura
  LV UUID                8hR0bP-g9mR-OSXS-KdUM-ouZ6-KVdS-sfz51c
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                12.00 GB
  Current LE             3072
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:38

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_data_mimage_1
  VG Name                vg_ora_jura
  LV UUID                fzdzrD-7p6d-XFkA-UHyr-CPad-F2nV-6QIU9p
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                12.00 GB
  Current LE             3072
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:39

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_export_mlog
  VG Name                vg_ora_jura
  LV UUID                29yLY8-N3Lv-46pN-1jze-50A2-wlhu-quuoMa
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 MB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:29

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_export_mimage_0
  VG Name                vg_ora_jura
  LV UUID                1uMTsf-wPaQ-ItTy-rpma-m2La-TGZl-C4KIU4
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:30

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_export_mimage_1
  VG Name                vg_ora_jura
  LV UUID                cm8Kn7-knL3-mUPL-XFvU-geMm-Wxff-32x2va
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:31

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_redo_mlog
  VG Name                vg_ora_jura
  LV UUID                811tNy-eaC5-zfZQ-1QVf-cbYP-1MIM-v6waJF
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 MB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:45

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_redo_mimage_0
  VG Name                vg_ora_jura
  LV UUID                aUZAer-f5rl-1f2X-9jgY-f8CJ-jdwe-F5Pmao
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:46

  --- Logical volume ---
  LV Name                /dev/vg_ora_jura/lv_ora_jura_redo_mimage_1
  VG Name                vg_ora_jura
  LV UUID                gAEJym-sSbq-rC4P-AjpI-OibV-k3yI-lDx1I6
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:47

  --- Physical volumes ---
  PV Name               /dev/mapper/mpath-dc1-b
  PV UUID               hgjXU1-2qjo-RsmS-1XJI-d0kZ-oc4A-ZKCza8
  PV Status             allocatable
  Total PE / Free PE    6749 / 605

  PV Name               /dev/mapper/mpath-dc2-b
  PV UUID               hcANwN-aeJT-PIAq-bPsf-9d3e-ylkS-GDjAGR
  PV Status             allocatable
  Total PE / Free PE    6749 / 605

  PV Name               /dev/mapper/mpath-dc2-mlog1p1
  PV UUID               4l9Qvo-SaAV-Ojlk-D1YB-Tkud-Yjg0-e5RkgJ
  PV Status             allocatable
  Total PE / Free PE    17 / 13



> On 4/15/10, jose nuno neto <jose.neto@liber4e.com> wrote:
>> hellos
>>
>> I spent more time on this and it seems since LVM cant write to any pv on
>> the  volumes it has lost, it cannot write the failure of the devices and
>> update the metadata on other PVs. So it hangs forever
>>
>> Is this right?
>>
>>> GoodMornings
>>>
>>> This is what I have on multipath.conf
>>>
>>> blacklist {
>>>         wwid SSun_VOL0_266DCF4A
>>>         wwid SSun_VOL0_5875CF4A
>>>         devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st)[0-9]*"
>>>         devnode "^hd[a-z]"
>>> }
>>> defaults {
>>>                 user_friendly_names             yes
>>> }
>>> devices {
>>>        device {
>>>                 vendor                          "HITACHI"
>>>                 product                         "OPEN-V"
>>>                 path_grouping_policy            group_by_node_name
>>>                 failback                        immediate
>>>                 no_path_retry                   fail
>>>        }
>>>        device {
>>>                 vendor                          "IET"
>>>                 product                         "VIRTUAL-DISK"
>>>                 path_checker                    tur
>>>                 path_grouping_policy            failover
>>>                 failback                        immediate
>>>                 no_path_retry                   fail
>>>        }
>>> }
>>>
>>> As an example this is one LUN. It shoes [features=0] so I'd say it
>>> should
>>> fail right way
>>>
>>> mpath-dc2-a (360060e8004f240000000f24000000502) dm-15 HITACHI,OPEN-V
>>> -SU
>>> [size=26G][features=0][hwhandler=0][rw]
>>> \_ round-robin 0 [prio=4][active]
>>>  \_ 5:0:1:0     sdu  65:64  [active][ready]
>>>  \_ 5:0:1:16384 sdac 65:192 [active][ready]
>>>  \_ 5:0:1:32768 sdas 66:192 [active][ready]
>>>  \_ 5:0:1:49152 sdba 67:64  [active][ready]
>>> \_ round-robin 0 [prio=4][enabled]
>>>  \_ 3:0:1:0     sdaw 67:0   [active][ready]
>>>  \_ 3:0:1:16384 sdbe 67:128 [active][ready]
>>>  \_ 3:0:1:32768 sdbi 67:192 [active][ready]
>>>  \_ 3:0:1:49152 sdbm 68:0   [active][ready]
>>>
>>> It think they fail since I see this messages from LVM:
>>> Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
>>> vg_syb_roger-lv_syb_roger_admin
>>> Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty devices
>>> in
>>> vg_syb_roger-lv_syb_roger_admin
>>>
>>> But from some reason LVM cant remove them, any option I should have on
>>> lvm.conf?
>>>
>>> BestRegards
>>> Jose
>>>> post your multipath.conf file, you may be queuing forever ?
>>>>
>>>>
>>>>
>>>> On Wed, 2010-04-14 at 15:03 +0000, jose nuno neto wrote:
>>>>> Hi2all
>>>>>
>>>>> I'm on RHEL 5.4 with
>>>>> lvm2-2.02.46-8.el5_4.1
>>>>> 2.6.18-164.2.1.el5
>>>>>
>>>>> I have a multipathed SAN connection with what Im builing LVs
>>>>> Its a Cluster system, and I want LVs to switch on failure
>>>>>
>>>>> If I simulate a fail through the OS via
>>>>> /sys/bus/scsi/devices/$DEVICE/delete
>>>>> I get a LV fail and the service switch to other node
>>>>>
>>>>> But if I do it "real" portdown on the SAN Switch, multipath reports
>>>>> path
>>>>> down, but LVM commands hang forever and nothing gets switched
>>>>>
>>>>> from the logs i see multipath failing paths, and lvm Failed to remove
>>>>> faulty
>>>>> "devices"
>>>>>
>>>>> Any ideas how I should  "fix" it?
>>>>>
>>>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Log device, 253:53, has
>>>>> failed.
>>>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Device failure in
>>>>> vg_ora_scapa-lv_ora_scapa_redo
>>>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Another thread is handling an
>>>>> event.  Waiting...
>>>>>
>>>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
>>>>> paths: 0
>>>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
>>>>> paths: 0
>>>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
>>>>> paths: 0
>>>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
>>>>> paths: 0
>>>>>
>>>>> Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
>>>>> vg_syb_roger-lv_syb_roger_admin
>>>>> Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty
>>>>> devices
>>>>> in
>>>>> vg_syb_roger-lv_syb_roger_admin
>>>>>
>>>>> Much Thanks
>>>>> Jose
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> --
> Sent from my mobile device
>
> Regards,
> Eugene Vilensky
> evilensky@gmail.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
