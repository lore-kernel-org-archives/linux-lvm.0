Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qB71WIwC032302
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2012 20:32:18 -0500
Received: from nemesis.egontech.com (nemesis.egontech.com [208.83.223.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB71WHSB027233
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2012 20:32:17 -0500
Received: from [172.29.223.2] ([216.207.42.140]) (authenticated bits=0)
	by nemesis.egontech.com (8.13.8/8.13.8) with ESMTP id qB71UEVo012908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2012 17:30:21 -0800
Mime-Version: 1.0 (Apple Message framework v1283)
From: James Downs <james.downs@egontech.com>
In-Reply-To: <20121206222535.GA2668@apocalyptech.com>
Date: Thu, 6 Dec 2012 17:29:58 -0800
Message-Id: <CA42F7BC-1519-4681-BD4B-BBFC0953BE13@egontech.com>
References: <20121206222535.GA2668@apocalyptech.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Questions about issue_discards
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Dec 6, 2012, at 2:25 PM, CJ Kucera wrote:

> (obviously) issue discards to storage which happens to support it.  Is
> there a way of querying block devices to find out if they support the
> feature?

hdparm -I /dev/DEVICE

is what you're looking for. SSDs support different methods of supporting discards, mostly TRIM.

> 2) Would a change to the issue_discards parameter be picked up
> automatically by the running kernel?  The lvm.conf manpage mentions that

It should be. You can do an lvm dumpconfig to check.

Cheers,
-j
