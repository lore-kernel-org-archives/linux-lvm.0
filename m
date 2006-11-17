Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAHJLO0g010090
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 19:21:24 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Gl9HA-0001R9-9b
	for linux-lvm@redhat.com; Fri, 17 Nov 2006 19:21:24 +0000
Date: Fri, 17 Nov 2006 19:21:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061117192124.GA4409@agk.surrey.redhat.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
	<20061114230003.GA3401@bdmcc-us.com>
	<20061114230658.GP30653@agk.surrey.redhat.com>
	<20061117134435.GA32647@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061117134435.GA32647@bdmcc-us.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 17, 2006 at 08:44:35AM -0500, Brian McCullough wrote:
> OK, as mentioned in previous messages, I have updated to the most recent
> versions found on the FTP site ( lvm2 and dm )

If you see that with the latest (2.02.14) then we've still
got a bug to fix there.

If you lost a partition table, look for something like 'gpart'
to try to recreate it.  Then you'll need to recreate the PV
and get the VG/LV back in place - the procedure depends on
whether it's lvm1 or lvm2 metadata and how much info you still
have (or can remember) about the layout.

Alasdair
-- 
agk@redhat.com
