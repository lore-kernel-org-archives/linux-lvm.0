Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r19NIen4012725
	for <linux-lvm@redhat.com>; Sat, 9 Feb 2013 18:18:40 -0500
Received: from furnace.wzff.de (furnace.wzff.de [176.9.216.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r19NIbMD018477
	for <linux-lvm@redhat.com>; Sat, 9 Feb 2013 18:18:38 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-lvm@barfooze.de>)
	id 1U4Jgp-0007NC-HR
	for linux-lvm@redhat.com; Sun, 10 Feb 2013 00:18:37 +0100
Message-ID: <5116D92E.7040107@barfooze.de>
Date: Sun, 10 Feb 2013 00:18:06 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
References: <510D3B57.3020607@barfooze.de>
In-Reply-To: <510D3B57.3020607@barfooze.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] fix missing include directives
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

On 02/02/2013 05:14 PM, John Spencer wrote:
> on glibc, those are erroneously (namespace pollution) pulled in via
> other headers. this doesn't work with conformant libcs (musl libc in
> this case), we simply need to include all needed headers.
>
> Signed-Off-By: John Spencer <maillist-lvm@barfooze.de>
>
>

ping
