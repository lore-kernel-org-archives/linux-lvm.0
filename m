Message-Id: <5BCE854D020000F90003C508@prv1-mh.provo.novell.com>
Date: Mon, 22 Oct 2018 20:19:57 -0600
From: "Gang He" <ghe@suse.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
	<5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
	<20181017141025.GA9941@redhat.com> <20181017184204.GC14214@redhat.com>
	<5BC84979020000F90003B507@prv1-mh.provo.novell.com>
	<20181018160159.GA28661@redhat.com> <20181018175923.GC28661@redhat.com>
In-Reply-To: <20181018175923.GC28661@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: teigland@redhat.com
Cc: Sven Eschenberg <sven@eschenberg.eu>, linux-lvm@redhat.com

Hello David,

The user installed the lvm2 (v2.02.180) rpms with the below three patches, it looked there were still some problems in the user machine.
The feedback is as below from the user,

In a first round I installed lvm2-2.02.180-0.x86_64.rpm liblvm2cmd2_02-2.02.180-0.x86_64.rpm and liblvm2app2_2-2.02.180-0.x86_64.rpm - but no luck - after reboot still the same problem with ending up in the emergency console.
I additionally installed in the next round libdevmapper-event1_03-1.02.149-0.x86_64.rpm, ./libdevmapper1_03-1.02.149-0.x86_64.rpm and device-mapper-1.02.149-0.x86_64.rpm, again - ending up in the emergency console
systemctl status lvm2-pvscan@9:126 output: 
lvm2-pvscan@9:126.service - LVM2 PV scan on device 9:126
   Loaded: loaded (/usr/lib/systemd/system/lvm2-pvscan@.service; static; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2018-10-22 07:34:56 CEST; 5min ago
     Docs: man:pvscan(8)
  Process: 815 ExecStart=/usr/sbin/lvm pvscan --cache --activate ay 9:126 (code=exited, status=5)
 Main PID: 815 (code=exited, status=5)

Oct 22 07:34:55 linux-dnetctw lvm[815]:   WARNING: Autoactivation reading from disk instead of lvmetad.
Oct 22 07:34:56 linux-dnetctw lvm[815]:   /dev/sde: open failed: No medium found
Oct 22 07:34:56 linux-dnetctw lvm[815]:   WARNING: Not using device /dev/md126 for PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV.
Oct 22 07:34:56 linux-dnetctw lvm[815]:   WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2 because of previous preference.
Oct 22 07:34:56 linux-dnetctw lvm[815]:   Cannot activate LVs in VG vghome while PVs appear on duplicate devices.
Oct 22 07:34:56 linux-dnetctw lvm[815]:   0 logical volume(s) in volume group "vghome" now active
Oct 22 07:34:56 linux-dnetctw lvm[815]:   vghome: autoactivation failed.
Oct 22 07:34:56 linux-dnetctw systemd[1]: lvm2-pvscan@9:126.service: Main process exited, code=exited, status=5/NOTINSTALLED
Oct 22 07:34:56 linux-dnetctw systemd[1]: lvm2-pvscan@9:126.service: Failed with result 'exit-code'.
Oct 22 07:34:56 linux-dnetctw systemd[1]: Failed to start LVM2 PV scan on device 9:126.

What should we do in the next step for this case? 
or we have to accept the fact, to modify the related configurations manually to work around.  

Thanks
Gang


>>> On 2018/10/19 at 1:59, in message <20181018175923.GC28661@redhat.com>, David
Teigland <teigland@redhat.com> wrote:
> On Thu, Oct 18, 2018 at 11:01:59AM -0500, David Teigland wrote:
>> On Thu, Oct 18, 2018 at 02:51:05AM -0600, Gang He wrote:
>> > If I include this patch in lvm2 v2.02.180,
>> > LVM2 can activate LVs on the top of RAID1 automatically? or we still have 
> to set "allow_changes_with_duplicate_pvs=1" in lvm.conf?
>> 
>> I didn't need any config changes when testing this myself, but there may
>> be other variables I've not encountered.
> 
> See these three commits:
> d1b652143abc tests: add new test for lvm on md devices
> e7bb50880901 scan: enable full md filter when md 1.0 devices are present
> de2863739f2e scan: use full md filter when md 1.0 devices are present
> 
> at 
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/2018-06-01-sta 
> ble
> 
> (I was wrong earlier; allow_changes_with_duplicate_pvs is not correct in
> this case.)
