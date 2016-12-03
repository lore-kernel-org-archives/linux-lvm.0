Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB3I3TXT027837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 3 Dec 2016 13:03:29 -0500
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C31C80086
	for <linux-lvm@redhat.com>; Sat,  3 Dec 2016 18:03:28 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id o141so215915539lff.1
	for <linux-lvm@redhat.com>; Sat, 03 Dec 2016 10:03:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5386C99C33554A469B5039A08D6430D0116BA4A5@ottsvw202.gdcan.com>
References: <5386C99C33554A469B5039A08D6430D0116BA4A5@ottsvw202.gdcan.com>
From: emmanuel segura <emi2fast@gmail.com>
Date: Sat, 3 Dec 2016 19:03:25 +0100
Message-ID: <CAE7pJ3BhNHM+tOUUDCr0g=tUKPCkmV834_UK9jpzBbUk=4RgCw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Writes to LV not updating the mapped PV's disk
	cache?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

try to use IO direct when you use the dd command, man dd and look oflag option

2016-12-01 17:29 GMT+01:00 Kipper, Matthew <Matthew.Kipper@gd-ms.ca>:
> Hi,
>
>
>
> I ran into a strange (to me) issue while testing something in LVM – I wanted
> to check that zeroing a Logical Volume would really zero the mapped Physical
> Extents. My setup was simple – I had a single Volume Group (vg0) containing
> a single Physical Volume (/dev/mmcblk0p2) and a few Logical Volumes. Nothing
> fancy.
>
>
>
> The test itself was also simple:
>
> 1.       Write a test pattern to an LV using ‘dd’
>
> 2.      Check how the LV is mapped with ‘pvdisplay -m’
>
> 3.      Read back the mapped PEs from the PVs block device with ‘dd’,
> checking that they match the test pattern written to the LV
>
>
>
> It seems like Linux’s disk cache doesn’t like this test. If I follow the
> steps, the readback from the PV’s block device returns stale data. But if I
> empty my cache (‘echo 3 > /proc/sys/vm/drop_caches’) and do the readback
> again, I can see the pattern that was written to the LV.
>
>
>
> Is this the expected behavior? I don’t know much about Linux subsystems, but
> I’d assume that when LVM maps LV -> PV and does a write, Linux would get the
> memo and update its disk cache accordingly. The results I’m seeing suggest
> that Linux doesn’t update the cache or flag it as dirty, because I can
> repeatedly read back stale data prior to emptying my cache.
>
>
>
> Here are a few details about my setup:
>
> ·         Platform: Zynq 7000 (Dual-Core ARM Cortex-A9)
>
> ·         Linux: 4.0.0 (built from Xilinx repo)
>
> ·         LVM Version: 2.02.162(2) (2016-07-28)
>
> ·         LVM Library Version: 1.02.132 (2016-07-28)
>
> ·         LVM Driver Version: 4.30.0
>
> ·         Test Media: eMMC device
>
>
>
> I don’t know if I’m misunderstanding how LVM/Linux are supposed to mingle or
> if this is an actual issue.
>
> Matthew Kipper
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
  .~.
  /V\
 //  \\
/(   )\
^`~'^
