Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j93E4ZrW010698
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2005 15:04:35 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EMQvj-0007I5-PO
	for linux-lvm@redhat.com; Mon, 03 Oct 2005 15:04:35 +0100
Date: Mon, 3 Oct 2005 15:04:35 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: Bug#331342: lvm2: lvs fails to display snapshot
	volumes
Message-ID: <20051003140435.GI18976@agk.surrey.redhat.com>
References: <E1EMFoR-0008MU-48@karp.cs.elte.hu>
	<20051003094023.GA15082@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051003094023.GA15082@wavehammer.waldi.eu.org>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

> > After a recent upgrade lvs and lvdisplay stopped to display snapshot
> > volumes. Example:

> > # lvs
> >   LV   VG   Attr   LSize  Origin Snap%  Move Log Copy% 
> >   data vg0  -wi-ao 84.00G                              
> >   home vg0  owi-ao 50.00G                              

Use lvs -a to see them.

It was fixed in CVS a couple of weeks ago, but isn't included in a
release yet.  I'll issue another release shortly.

Alasdair
-- 
agk@redhat.com
