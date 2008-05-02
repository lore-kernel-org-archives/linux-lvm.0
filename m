Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42E1BSX028997
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:01:11 -0400
Received: from vms042pub.verizon.net (vms042pub.verizon.net [206.46.252.42])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42E0W0N023748
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:00:37 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0800D5FUWDJTX0@vms042.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 02 May 2008 09:00:14 -0500 (CDT)
Date: Fri, 02 May 2008 10:00:13 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <1311113506.20080502101444@marki-online.net>
Message-id: <481B1E6D.3040000@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net> <481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net> <481A1D32.6020705@Media-Brokers.com>
	<481A1FAF.5050303@verizon.net> <481A221D.80209@Media-Brokers.com>
	<481A262C.7080908@verizon.net>
	<1311113506.20080502101444@marki-online.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Marek Podmaka wrote:
> Hi Gerry,
>
> Thursday, May 1, 2008, 22:21:00, Gerry Reno wrote:
>
>   
>> At least in the case where the snapshot is read-only (LVM1 default,
>> LVM2 by config?), if the snapshot is lost, invalid, not removed from
>> VG prior to reboot, when LVM comes back up it should see this and
>> immediately know that it can just vgreduce VG --removemissing for
>> the old snapshot. In the case of rw (no LVM1, LVM2 default), it
>> should be a user choice and LVM should prompt the user at boot as to
>> whether to remove this old snapshot so it can attempt to activate
>> the VG. Unless the user knows that there were non-backup related lvm
>> mods written during the snapshot (eg: pvmove) then the user will
>> just answer yes and the system should boot. This is how LVM should
>> operate in this scenario.
>>     
>
> I don't think that automatically making changes to the VG is a good
> idea. Imagine that you have a snapshot on disk mapped from SAN storage
> array and that becomes temporary unavailable (SAN switch failure or
> whatever). It would be a bad idea to remove this PV from VG just
> because it is TEMPORARY unavailable. 
This was part of my point about the ramdisk, in that other types of 
devices can also disappear not just ramdisk.
Once the device with the snapshot disappears, I'm not sure I would trust 
that snapshot even if the device comes back online.
The backup process would try to keep running and it would probably get 
all kinds of errors at this point so to me it
makes sense to consider that snapshot invalid from that standpoint of 
the backup. Now if it was a read-write snapshot
and you've used some lvm commands to pvmove something onto the snapshot 
then that is why I suggest that the user
be able to make decision at reboot about whether to remove the PV. If 
they answer 'no' to the removal then the boot will
stop and they will have to perform some recovery through the rescue mode 
to see if they can recover some data from
the device before allowing the PV to be removed from the VG so the 
system can boot.

> And how do you distinguish
> between ram disk and normal disk and if it is totally gone or it is
> only temp issue? Also if real HDD fails, you don't want to vgreduce
> it, you want to replace it, vgcfgrestore it and sync it (in case you
> are using mirroring). Also imagine that you can have also real data on
> the same PV, not only snapshot.
>   
You don't vgreduce the entire hdd. Only for the PV that contained the 
snapshot.
If you used an entire hdd to be the snapshot then you can restore it. 
Recover data
in the case of read-write and then vgreduce it from the VG so system can 
boot.

> What would help is the ability to activate the VG also with missing
> PVs, 
You cannot activate a VG with missing PV's because at some point then 
LVM would attempt to write
on one of the missing PV and then you get panic.


Regards,
Gerry


> I'm not sure if that is possible in linux LVM.
>
>
>
>   
