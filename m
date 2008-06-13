Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5D7icOk002286
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 03:44:38 -0400
Received: from jeltz.chrissie.net (vpn-6-23.fab.redhat.com [10.33.6.23])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m5D7ibMq013346
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 03:44:38 -0400
Message-ID: <48522565.9000808@redhat.com>
Date: Fri, 13 Jun 2008 08:44:37 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple openlog invocations in clvmd.c
References: <20080613.113139.17746189.yamato@redhat.com>
In-Reply-To: <20080613.113139.17746189.yamato@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Masatake YAMATO wrote:
> Hi,
> 	syslog_init static variable defined in debuglog() of 
> daemons/clvmd/clvmd.c is not used properly: the variable is
> never updated.
> 
> Here is a fix.


Thank you, that's now in CVS.

-- 

Chrissie
