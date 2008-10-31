Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9VCh1KN023955
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2008 08:43:02 -0400
Message-ID: <490AFD59.8070809@redhat.com>
Date: Fri, 31 Oct 2008 13:43:05 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>	<49083EBC.5080301@gk-software.com>	<490849C2.2040900@redhat.com>
	<490AF885.3060504@gk-software.com>
In-Reply-To: <490AF885.3060504@gk-software.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Stepan Kadlec wrote:
> ok, I have recompiled it with --with-cluster=internal, but still seeing:
> 
> WARNING: Locking disabled. Be careful! This could corrupt your metadata.

Is it during clvmd initialization only?

clvmd tries to initialize locks for possible already activated volumes
(mostly safety/force restart check, clvmd must start before clustered LVs
are activated anyway)

It simply run lvs command (forcing nolocking for this command)
to check which volumes are activated.
The log message is misleading here...

After clvmd initialization, it should work as expected.

Milan
