Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAEN6wHr010962
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 23:06:58 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Gk7Mo-0006ir-8n
	for linux-lvm@redhat.com; Tue, 14 Nov 2006 23:06:58 +0000
Date: Tue, 14 Nov 2006 23:06:58 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061114230658.GP30653@agk.surrey.redhat.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
	<20061114230003.GA3401@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061114230003.GA3401@bdmcc-us.com>
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

On Tue, Nov 14, 2006 at 06:00:03PM -0500, Brian McCullough wrote:
>   Internal error: PV segments corrupted in vg_system.

First update your lvm2 software to avoid that bug: you shouldn't
see internal errors!

Alasdair
-- 
agk@redhat.com
