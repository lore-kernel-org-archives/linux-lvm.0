Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9NGi4Fp026322
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 12:44:04 -0400
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9NGi3W3014017
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 12:44:03 -0400
Received: from mail145-co9 (localhost [127.0.0.1])	by
	mail145-co9-R.bigfish.com (Postfix) with ESMTP id A3551380162	for
	<linux-lvm@redhat.com>; Wed, 23 Oct 2013 16:44:02 +0000 (UTC)
Received: from CO9EHSMHS027.bigfish.com (unknown [10.236.132.246])	by
	mail145-co9.bigfish.com (Postfix) with ESMTP id 8DF5E360238	for
	<linux-lvm@redhat.com>; Wed, 23 Oct 2013 16:44:01 +0000 (UTC)
Message-ID: <5267FCC6.6060605@tekcomms.com>
Date: Wed, 23 Oct 2013 11:43:50 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
References: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
In-Reply-To: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

> Hi Joe,
>
> I am having similar issues in that I have a LVM2 raid1 mirror between 
> a local disk and a iSCSI disk and once I remove the iSCSI disk and add 
> it back, the mirror stays broken. I traced the cause of that to be 
> LVM2 still complains about a PV missing even though the same PV has 
> been added back.
>
> I wonder if you have resolved your issue and what did you do.
> Thanks a lot.
> Shi
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
Shi,

This is not yet resolved.  I'm still waiting for Peter Rajnoha to follow 
up after I provided him the information he requested.  He said he might 
be able to look at it more closely later this week. In the mean time, I 
work around this issue by activating the VG with --partial.  I can 
access my data, but I can't make any LVM config changes.
