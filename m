Message-Id: <5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
Date: Tue, 16 Oct 2018 23:16:28 -0600
From: "Gang He" <ghe@suse.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
In-Reply-To: <20181015152648.GB29274@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
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
To: teigland@redhat.com
Cc: linux-lvm@redhat.com

Hello David,

>>> On 2018/10/15 at 23:26, in message <20181015152648.GB29274@redhat.com>, David
Teigland <teigland@redhat.com> wrote:
> On Sun, Oct 14, 2018 at 11:39:20PM -0600, Gang He wrote:
>> >> [  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG 
>> > vghome while PVs appear on duplicate devices.
>> > 
>> > Do these warnings only appear from "dracut-initqueue"?  Can you run and
>> > send 'vgs -vvvv' from the command line?  If they don't appear from the
>> > command line, then is "dracut-initqueue" using a different lvm.conf?
>> > lvm.conf settings can effect this (filter, md_component_detection,
>> > external_device_info_source).
>> 
>> mdadm --detail --scan -vvv
>> /dev/md/linux:0:
>>            Version : 1.0
> 
> It has the old superblock version 1.0 located at the end of the device, so
> lvm will not always see it.  (lvm will look for it when it's writing to
> new devices to ensure it doesn't clobber an md component.)
> 
> (Also keep in mind that this md superblock is no longer recommended:
> raid.wiki.kernel.org/index.php/RAID_superblock_formats)
> 
> There are various ways to make lvm handle this:
> 
> - allow_changes_with_duplicate_pvs=1
> - external_device_info_source="udev"
> - reject sda2, sdb2 in lvm filter
> 
There are some feedback as below from our user's environment (since I can not reproduce this problem in my local
environment).

I tested one by one option in the lvm.conf.

The good news - enabling 
- external_device_info_source="udev"
- reject sda2, sdb2 in lvm filter

both work! The system enables the proper lvm raid1 device again.

The first option does not work.
systemctl status lvm2-pvscan@9:126 results in:

● lvm2-pvscan@9:126.service - LVM2 PV scan on device 9:126
   Loaded: loaded (/usr/lib/systemd/system/lvm2-pvscan@.service; static; vendor preset: disabled)
   Active: failed (Result: exit-code) since Tue 2018-10-16 22:53:57 CEST; 3min 4s ago
     Docs: man:pvscan(8)
  Process: 849 ExecStart=/usr/sbin/lvm pvscan --cache --activate ay 9:126 (code=exited, status=5)
 Main PID: 849 (code=exited, status=5)

Oct 16 22:53:57 linux-dnetctw lvm[849]:   WARNING: Not using device /dev/md126 for PV
qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV.
Oct 16 22:53:57 linux-dnetctw lvm[849]:   WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2
because of previous preference.
Oct 16 22:53:57 linux-dnetctw lvm[849]:   WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2
because of previous preference.
Oct 16 22:53:57 linux-dnetctw lvm[849]:   device-mapper: reload ioctl on  (254:0) failed: Device or resource busy
Oct 16 22:53:57 linux-dnetctw lvm[849]:   device-mapper: reload ioctl on  (254:0) failed: Device or resource busy
Oct 16 22:53:57 linux-dnetctw lvm[849]:   0 logical volume(s) in volume group "vghome" now active
Oct 16 22:53:57 linux-dnetctw lvm[849]:   vghome: autoactivation failed.
Oct 16 22:53:57 linux-dnetctw systemd[1]: lvm2-pvscan@9:126.service: Main process exited, code=exited,
status=5/NOTINSTALLED
Oct 16 22:53:57 linux-dnetctw systemd[1]: lvm2-pvscan@9:126.service: Failed with result 'exit-code'.
Oct 16 22:53:57 linux-dnetctw systemd[1]: Failed to start LVM2 PV scan on device 9:126.

pvs shows:
  /dev/sde: open failed: No medium found
  WARNING: found device with duplicate /dev/sdc2
  WARNING: found device with duplicate /dev/md126
  WARNING: Disabling lvmetad cache which does not support duplicate PVs.
  WARNING: Scan found duplicate PVs.
  WARNING: Not using lvmetad because cache update failed.
  /dev/sde: open failed: No medium found
  WARNING: Not using device /dev/sdc2 for PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV.
  WARNING: Not using device /dev/md126 for PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV.
  WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2 because of previous preference.
  WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2 because of previous preference.
  PV         VG     Fmt  Attr PSize PFree  
  /dev/sdb2  vghome lvm2 a--  1.82t 202.52g

My questions are as follows,
1) why did the solution 1 not work? since the method looks more close to fix this problem. 
2) Could we back-port some code from v2.02.177 source files to keep the compatibility? to avoid modifying some items
manually. 
   or, we have to accept this problem from v2.02.180 (maybe 178?) due to by-design? 

Thanks
Gang

>> > It could be, since the new scanning changed how md detection works.  The
>> > md superblock version effects how lvm detects this.  md superblock 1.0 (at
>> > the end of the device) is not detected as easily as newer md versions
>> > (1.1, 1.2) where the superblock is at the beginning.  Do you know which
>> > this is?
