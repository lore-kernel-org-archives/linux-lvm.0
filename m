Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id nA3H7ND8005243
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:07:24 -0500
Message-ID: <4AF0634A.4010902@redhat.com>
Date: Tue, 03 Nov 2009 18:07:22 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] kernel panic on lvcreate
References: <29594910.781257260864226.JavaMail.javamailuser@localhost>
In-Reply-To: <29594910.781257260864226.JavaMail.javamailuser@localhost>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

On 11/03/2009 04:07 PM, Christopher Hawkins wrote:
> When I create a root snapshot on a fairly typical Centos 5.3 server:
...
> I get a kernel panic.

Please try to first update kernel to version from 5.4.
(There were some fixes for snapshot like
https://bugzilla.redhat.com/show_bug.cgi?id=496100)

If it still fails, please post the OOps trace from kernel (syslog).

Milan
--
mbroz@redhat.com
