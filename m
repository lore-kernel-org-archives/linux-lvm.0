Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i37IEXj25686
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 14:14:33 -0400
Received: from wolery.deas.harvard.edu (wolery.deas.harvard.edu
	[140.247.50.121])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i37IEXWB030790
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 14:14:33 -0400
Received: from wolery.deas.harvard.edu (wolery.deas.harvard.edu [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by wolery.deas.harvard.edu (Postfix) with ESMTP id CCD2F1B3370
	for <linux-lvm@redhat.com>; Wed,  7 Apr 2004 14:14:32 -0400 (EDT)
Date: Wed, 7 Apr 2004 14:14:32 -0400 (EDT)
From: Lars Kellogg-Stedman <lars@oddbit.com>
Subject: Re: [linux-lvm] Snapshots failing w/ kernel 2.6.4
Message-ID: <Pine.LNX.4.44.0404071412070.14917-100000@wolery.deas.harvard.edu>
MIME-Version: 1.0
Reply-To: lars@oddbit.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

> The kernel you're running does not support snapshots yet.

Ouch, that would do it.  Thanks for the information; I'll keep my eyes on 
the dm-devel list.

Cheers,

-- Lars

-- 
Lars Kellogg-Stedman <lars@oddbit.com>
