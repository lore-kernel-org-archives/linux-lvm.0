Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AME9021221
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:14:09 -0400
Received: from nerim.mx.42-networks.com (gw.c9x.org [213.41.131.17])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i5AME3Xn022981
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:14:03 -0400
Date: Fri, 11 Jun 2004 00:31:52 +0159
From: Jedi/Sector One <lvm@pureftpd.org>
Subject: Re: [linux-lvm] Multipath without round-robin?
Message-ID: <20040610223214.GA3934@c9x.org>
References: <20040610203309.GA18186@c9x.org> <40C8DB58.9090203@coremetrics.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40C8DB58.9090203@coremetrics.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jun 10, 2004 at 05:06:16PM -0500, Austin Gonyou wrote:
> You could just use the qlogic hba driver failover.
> ql2xfailover=1 in your rmodules.conf

  With a 2.6 kernel (ql2xxx drivers 8.00)?
