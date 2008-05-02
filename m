Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m428Exnq000524
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 04:14:59 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m428ElJO029597
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 04:14:47 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id E4CB6200164
	for <linux-lvm@redhat.com>; Fri,  2 May 2008 10:14:45 +0200 (CEST)
Date: Fri, 2 May 2008 10:14:44 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <1311113506.20080502101444@marki-online.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481A262C.7080908@verizon.net>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Gerry,

Thursday, May 1, 2008, 22:21:00, Gerry Reno wrote:

> At least in the case where the snapshot is read-only (LVM1 default,
> LVM2 by config?), if the snapshot is lost, invalid, not removed from
> VG prior to reboot, when LVM comes back up it should see this and
> immediately know that it can just vgreduce VG --removemissing for
> the old snapshot. In the case of rw (no LVM1, LVM2 default), it
> should be a user choice and LVM should prompt the user at boot as to
> whether to remove this old snapshot so it can attempt to activate
> the VG. Unless the user knows that there were non-backup related lvm
> mods written during the snapshot (eg: pvmove) then the user will
> just answer yes and the system should boot. This is how LVM should
> operate in this scenario.

I don't think that automatically making changes to the VG is a good
idea. Imagine that you have a snapshot on disk mapped from SAN storage
array and that becomes temporary unavailable (SAN switch failure or
whatever). It would be a bad idea to remove this PV from VG just
because it is TEMPORARY unavailable. And how do you distinguish
between ram disk and normal disk and if it is totally gone or it is
only temp issue? Also if real HDD fails, you don't want to vgreduce
it, you want to replace it, vgcfgrestore it and sync it (in case you
are using mirroring). Also imagine that you can have also real data on
the same PV, not only snapshot.

What would help is the ability to activate the VG also with missing
PVs, I'm not sure if that is possible in linux LVM.



-- 
  bYE, Marki
