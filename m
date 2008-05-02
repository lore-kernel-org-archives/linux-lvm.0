Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42Ejb51001900
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:45:37 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42Ej9iO020469
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:45:09 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 56D4F2000A3
	for <linux-lvm@redhat.com>; Fri,  2 May 2008 16:45:08 +0200 (CEST)
Date: Fri, 2 May 2008 16:45:06 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <1398373243.20080502164506@marki-online.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481B1E6D.3040000@verizon.net>
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
	<481B1E6D.3040000@verizon.net>
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

Hello,

Friday, May 2, 2008, 16:00:13, Gerry Reno wrote:

> You cannot activate a VG with missing PV's because at some point
> then LVM would attempt to write on one of the missing PV and then
> you get panic.

As I told - I'm not sure if it is possible on Linux, but for example
on HP-UX LVM it is normally possible to activate VG even with some
missing PVs (there is also special Low Quorum mode - which is not
enabled by default - to activate VG when you have available <=50% of
mirrored PVs).

Of course trying to read/write from missing PV should (and on HP-UX
does) produce an I/O error to application, but should NOT panic. From
my point there is almost no difference between activating VG with
missing PV and loosing that PV while VG is activated (SAN or HDD
failure).

Having snaphot on failed/missing PV is a little bit different, because
there is question what to do with original lvol. But that can/should
prevent activating the lvol and not entire VG (which can have more
lvols which don't have any data/snapshots on the missing PV).


-- 
  bYE, Marki
