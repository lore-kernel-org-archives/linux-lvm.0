Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rA6MDM3c005280
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 17:13:22 -0500
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA6MDJln028542
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 17:13:20 -0500
Received: by mail-ea0-f181.google.com with SMTP id d10so68480eaj.12
	for <linux-lvm@redhat.com>; Wed, 06 Nov 2013 14:13:19 -0800 (PST)
MIME-Version: 1.0
Sender: jinzishuai@gmail.com
In-Reply-To: <CAFp1kvMfpKvfuS1Vp5X6i5vGrEUHip=9WViuqHvzxkiHd+09iA@mail.gmail.com>
References: <CAFp1kvMoWy8okmvqXOg5uPCUcnRWbr9y_de4JDcCmLRk=6vLnQ@mail.gmail.com>
	<5269021B.5040205@redhat.com>
	<CAFp1kvMfpKvfuS1Vp5X6i5vGrEUHip=9WViuqHvzxkiHd+09iA@mail.gmail.com>
Date: Wed, 6 Nov 2013 15:13:18 -0700
Message-ID: <CAFp1kvM9JXi2V_DAtrGv3tKz-dnj3CRKWf2Nh7KgmqOymD5VOA@mail.gmail.com>
From: Shi Jin <sjin@datagardens.com>
Subject: Re: [linux-lvm] Unable to convert a broken LVM2 RAID1 to Linear
	volume
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Unfortunately, the --repair option is not working for my other case:

[root@shi-rhel63 ~]# lvs -a -o +seg_pe_ranges|grep lv_root
  Couldn't find device with uuid LoT3ad-7S1N-l1SZ-22EZ-ZStL-7gTY-1kxFrr.
  lv_root             vg_root      rwi-aom-   2.00g
         100.00         lv_root_rimage_0:0-63 lv_root_rimage_1:0-63
  [lv_root_rimage_0]  vg_root      iwi-a-r-   2.00g
                        unknown device:0-63
  [lv_root_rimage_1]  vg_root      iwi-aor-   2.00g
                        /dev/sdb2:165-228
  [lv_root_rmeta_0]   vg_root      ewi-a-r-  32.00m
                        unknown device:180-180
  [lv_root_rmeta_1]   vg_root      ewi-aor-  32.00m
                        /dev/sdb2:164-164
[root@shi-rhel63 ~]# pvs -v
    Scanning for physical volume names
  Couldn't find device with uuid LoT3ad-7S1N-l1SZ-22EZ-ZStL-7gTY-1kxFrr.
    There are 1 physical volumes missing.
    There are 1 physical volumes missing.
  PV             VG           Fmt  Attr PSize  PFree   DevSize PV UUID
  /dev/sda5      voffice-base lvm2 a--   4.76g      0    4.76g
iskp4u-CQE6-FKRF-E3bg-PlU4-RfTf-9Ir4MQ
  /dev/sdb2      vg_root      lvm2 a--  18.84g   1.22g  18.88g
pnsMYs-Ce4t-9KYR-3Zfs-GItC-k5SZ-VidQ30
  unknown device vg_root      lvm2 a-m  17.84g 224.00m      0
LoT3ad-7S1N-l1SZ-22EZ-ZStL-7gTY-1kxFrr
[root@shi-rhel63 ~]# lvconvert -m 0  --repair /dev/vg_root/lv_root
  Couldn't find device with uuid LoT3ad-7S1N-l1SZ-22EZ-ZStL-7gTY-1kxFrr.
  Aborting.  LV lv_root is now incomplete and --partial was not specified.
  Failed to suspend vg_root/lv_root before committing changes
  Device '/dev/sdb2' has been left open.
  Device '/dev/sdb2' has been left open.
  Device '/dev/sdb2' has been left open.
  Device '/dev/sdb2' has been left open.


Does anyone know how to fix it?

Thanks a lot,
Shi

On Thu, Oct 24, 2013 at 11:30 AM, Shi Jin <sjin@datagardens.com> wrote:
> thank you very much.
>
> when i run your command, my machine froze but after reset,  the virtual
> volumes undet the raid1 are now showing as regular volumes and i was able to
> lvremove them and original volume keeps on working.
>
> thanks a lot
>
> Shi
>
> On 2013-10-24 5:23 AM, "Marian Csontos" <mcsontos@redhat.com> wrote:
>>
>> On 10/23/2013 06:50 PM, Shi Jin wrote:
>>>
>>> Hi there,
>>>
>>> I have setup a LVM2 raid1 mirror with
>>>     lvconvert  -m 1 --type raid1 /dev/vg_data/lv_test /dev/sdd
>>> and then after I remove one of its legs, the remaining leg keeps on
>>> working just fine. However, I then want to convert this to a simple
>>> Linux volume.
>>>
>>> it would fail:
>>>
>>> [root@shi-rhel63 ~]# lvconvert -m 0 /dev/vg_data/lv_test
>>>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
>>>    Cannot change VG vg_data while PVs are missing.
>>>    Consider vgreduce --removemissing.
>>
>>
>> Following worked for me except I ended up with unclean FS:
>>
>>     lvconvert -m 0 --repair -f vg_data/lv_test
>>
>> -- Marian
>>
>>>
>>> removemissing not working either
>>>
>>> [root@shi-rhel63 ~]# vgreduce  --removemissing vg_data
>>>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
>>>    WARNING: Partial LV lv_test needs to be repaired or removed.
>>>    WARNING: Partial LV lv_test_rmeta_1 needs to be repaired or removed.
>>>    WARNING: Partial LV lv_test_rimage_1 needs to be repaired or removed.
>>>    There are still partial LVs in VG vg_data.
>>>    To remove them unconditionally use: vgreduce --removemissing --force.
>>>    Proceeding to remove empty missing PVs.
>>>
>>> What should I do in my case to convert the LV to linear?
>>>
>>> My OS information:
>>>
>>> [root@shi-rhel63 ~]#  cat /etc/redhat-release
>>> Red Hat Enterprise Linux Server release 6.3 (Santiago)
>>> [root@shi-rhel63 ~]# uname -a
>>> Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT
>>> 2012 x86_64 x86_64 x86_64 GNU/Linux
>>> [root@shi-rhel63 ~]# lvm version
>>>    LVM version:     2.02.95(2)-RHEL6 (2012-05-16)
>>>    Library version: 1.02.74-RHEL6 (2012-05-16)
>>>    Driver version:  4.22.6
>>>
>>>
>>> Thanks a lot.
>>>
>>> Shi
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Shi Jin, PhD | Vice President, Product Development | DataGardens Inc.
| T: 780-784-5011 | M: 780-964-8778| E: sjin@datagardens.com
