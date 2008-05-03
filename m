Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m432RcSp023780
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 22:27:38 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m432RcNX018859
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 22:27:38 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m432RcPS018854
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 22:27:38 -0400
Date: Fri, 2 May 2008 22:27:38 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481A08A7.5010305@verizon.net>
Message-ID: <Pine.LNX.4.64.0805022200280.13318@engineering.redhat.com>
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 1 May 2008, Gerry Reno wrote:

> Mikulas Patocka wrote:
>> ... If you mount the origin device with missing snapshot, you destroy the 
>> snapshot (even if you don't touch it). The snapshot can no longer be 
>> repaired.
>> 
> So it is safer to not activate device in this case then destroy data.
> Why? What value is the old snapshot at this point? You just had a system 
> reboot in the middle of a snapshotted backup so all you need to do is get the 
> system up, redo another snapshot and retake your backup. I'm not interested 
> in the old snapshot.

If you use snapshots for something other than backups (for example 
version-control using snapshots --- to enable admin to revert changes if 
he messes something), then the snapshot is valuable and should survive 
reboot.

Anyway, placing a ramdisk to volume group is bad idea and it must not be 
done on any production system --- note that any lvcreate, lvconvert, etc 
command can allocate anything on that ramdisk --- without the 
administrator knowing it.
--- so I don't see any reason why we should do extra hacks to lvm for 
people who placed ramdisk into vg.


To use temporary storage for snapshot, a special command for lvm would be 
more appropriate --- a command that would setup snapshot and write nothing 
about it to metadata, so that the snapshot would be forgotten on next 
reboot --- then, you can setup the snapshot on any device outside the 
volume group. You can already do this with dmsetup.

Mikulas
