Received: from sboyd.brisbane.redhat.com
	(IDENT:U2FsdGVkX1/RQpXohomc1Bo/tdNfWdOH/xazhs50+lc@sboyd.brisbane.redhat.com
	[172.16.44.120])
	by pobox.brisbane.redhat.com (8.12.8/8.12.8) with ESMTP id
	j5MMDJwU000939
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 08:13:19 +1000
Subject: Re: [linux-lvm] recover problem from hard disk failure
From: Sean Boyd <sboyd@redhat.com>
In-Reply-To: <001301c5766d$9d0090e0$e81ef88f@winxp>
References: <001301c5766d$9d0090e0$e81ef88f@winxp>
Date: Thu, 23 Jun 2005 08:13:19 +1000
Message-Id: <1119478399.4305.7.camel@sboyd.brisbane.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sboyd@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Tue, 2005-06-21 at 23:29 +0900, HYUN-CHUL KIM wrote:
> Hi, all
>  
> One among three hard disks constituting a LVM logical volume has
> failed.
> How to recover data from the other two hard disks?

 I was trolling through the lvm commands and man pages and found a
section "REPLACING PHYSICAL VOLUMES" in the vgcfgrestore man page.

Check it out. If you try it let us know how you go.

--Sean
