Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2M8wWj20792
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 03:58:32 -0500
Received: from bucket.localnet (i125-043.nv.iinet.net.au [203.59.125.43])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2M8wTWA022626
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 03:58:30 -0500
Subject: Re: [linux-lvm] quiescing physical volumes
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <OF8332408E.0F643C1C-ONC1256E5B.00364305-C1256E5B.003A0263@provinzial.de>
References: <OF8332408E.0F643C1C-ONC1256E5B.00364305-C1256E5B.003A0263@provinzial.de>
Message-Id: <1079951464.11086.48.camel@rasputin.localnet>
Mime-Version: 1.0
Date: Mon, 22 Mar 2004 18:31:06 +0800
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm@sistina.com

On Thu, 2004-03-18 at 18:33, m.klaeschen@provinzial.de wrote:

> Is there a way to use such a proceeding with Linux LVM managed DASD?

I think it can be done at the filesystem level if you're using XFS (look
into "xfs_freeze"), but don't believe it can be done for other
filesystems. 

OTOH, as Joe Thornber just mentioned, LVM snapshots only need to store
the amount of data that changes over the lifetime of the snapshot, so
they do not need to be anywhere near as big as the original volumes.
Perhaps they're a better approach for backing up your ReiserFS volumes?

Craig Ringer
