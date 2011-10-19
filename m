Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9JDQKj4019451
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 09:26:20 -0400
Received: from mx-out.ocsa-data.net (mx-out.ocsa-data.net [194.36.166.37])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JDQJwK003803
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 09:26:20 -0400
Received: from [127.0.0.1] (helo=localhost)
	by mx-out.ocsa-data.net with esmtp (Exim - FreeBSD Rulez)
	id 1RGWAa-0006QQ-Bk
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 15:26:56 +0200
Received: from mx-out.ocsa-data.net ([127.0.0.1])
	by localhost (node2-3.ouvaton.local [127.0.0.1]) (amavisd-new,
	port 10028) with ESMTP id 5J1HfS7iICSq for <linux-lvm@redhat.com>;
	Wed, 19 Oct 2011 15:26:56 +0200 (CEST)
Received: from [88.183.94.176] (helo=[192.168.2.34])
	by mx-out.ocsa-data.net with esmtpsa (Exim - FreeBSD Rulez)
	id 1RGWAZ-0006Q3-A8
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 15:26:55 +0200
From: Yann Droneaud <yann@droneaud.fr>
Date: Wed, 19 Oct 2011 15:26:15 +0200
In-Reply-To: <20111019125654.GQ24527@agk-dp.fab.redhat.com>
References: <1319028502.1827.24.camel@deela.quest-ce.net>
	<20111019125654.GQ24527@agk-dp.fab.redhat.com>
Message-ID: <1319030776.1827.31.camel@deela.quest-ce.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvmtrim
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Le mercredi 19 octobre 2011 à 13:56 +0100, Alasdair G Kergon a écrit :
> On Wed, Oct 19, 2011 at 02:48:20PM +0200, Yann Droneaud wrote:
> > Is there any tool for LVM like fstrim(8) (which would likely be called
> > "lvmtrim") ?
>  
> vgtrim
> 
> > This tool would discard currently unused PE of an active VG like
> > fstrim(8) is doing on ext4,btrfs,xfs blocks (depending on filesystem
> > support).
> 
> Sounds a reasonable idea to me, although I question how the PEs that
> would benefit from it would have got into that state in the first place,
> given that lvreduce already has trim support if you had
> devices/issue_discards = 1 in your lvm.conf.
>  

Perhaps when you forgot to discard/TRIM the whole SSD before re-using it
in an active VG.

Perhaps in the case you're migrating from an older version of the LVM2
tools ?

Or issue_discards was set to 0.

Regards.

-- 
Yann Droneaud
