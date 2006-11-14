Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEBqrsv026747
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 06:52:53 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAEBqCtP011258
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 06:52:12 -0500
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id B155D12EDE
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 11:52:01 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Contents of read-only LVM snapshot change - still
	have the problem with latest LVM!
Date: Tue, 14 Nov 2006 11:53:55 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20061113145916.2C1CA12EDE@bluewhale.planbit.co.uk>
Message-Id: <20061114115201.B155D12EDE@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> 
> I have tried updating to the 2.02.14 LVM and the 1.02.12 device mapper (compiled from source from
> the FTP site).  The first couple
> of tests have run correctly so it looks like this may have resolved the issue, but I am continuing
> to run tests to confirm this.
> 

It's still not working reliably.  The first few attempts worked but after running more tests, the problem still occurs. 

My test reads the read-only snapshot multiple times.  All the data is consistent across the 20GB snapshot except for a single byte
at offset 0x0313CAC6C0.  Sometimes it reads 0x48 and other times it reads 0x08.  I have run the tests multiple times over many days
and, although the tests sometimes show the correct behaviour, about half the time I get this problem.

I cannot understand why repeated reads of a read-only snapshot would return data that changes.

I am running the 2.6.16.20 kernel and have upgraded to the latest LVM 2.02.14 and DMapper library 1.02.12 but the problem still
exists.

Can anyone offer any help as to what may be going on or suggest how I can investigate the problem further?  I don't mind patching
the LVM source code to obtain more debug information if this helps.

Thanks in advance,

Roger
