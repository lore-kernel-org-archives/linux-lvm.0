Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 813C310ABC8F
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:57:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2572A18AE965
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:57:11 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id c77so6108563oib.7
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 05:57:07 -0800 (PST)
MIME-Version: 1.0
References: <CAHEKYV7Uvqm2knzb4QsTxtdec2Wi+mnFi2Q6MbP95gseS5V7Ow@mail.gmail.com>
	<alpine.LRH.2.21.2001220803070.14824@fairfax.gathman.org>
In-Reply-To: <alpine.LRH.2.21.2001220803070.14824@fairfax.gathman.org>
From: Mauricio Tavares <raubvogel@gmail.com>
Date: Wed, 22 Jan 2020 08:56:55 -0500
Message-ID: <CAHEKYV7Ozz4xGOYP8tnsZS+=B6NbD=EgGE12nQzSdZEJR+SLiw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Failed merge, still running?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 22, 2020 at 8:50 AM Stuart D. Gathman <stuart@gathman.org> wrote:
>
> On Wed, 22 Jan 2020, Mauricio Tavares wrote:
>
> > lvconvert --merge vmhost_vg0/desktop_snap_20200121
> >
> > and instead of seeing the usual percentage of how far it has
> > completed, I got nothing. lvs -a -o +devices shows
> >
> >  LV                      VG         Attr       LSize  Pool Origin
> > Data%  Meta%  Move Log Cpy%Sync Convert Devices
> >  desktop                 vmhost_vg0 Owi-a-s--- 20.00g
> >                                     /dev/sdb3(14848)
> >  [desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 100.00
>
> While not a guru, I think I can tell you the issue.  It looks like
> the snapshot was full (says 100.00).  The snapshot is unusable at
> that point.  Maybe it wasn't before you started the merge, and the
> merge sets it to 100.00 when it starts, I haven't noticed.
>
> > Before I blow that lv up, what else should I be checking?
>
> What was the snapshot percent used before you started the merge?
>
      Based on the 3 times I tried to do the patching (unsuccessfully)
and then rewind and try again, I would say under 30%. I had shut guest
down, created snapshot, boot it up, and then let it try to download
some 2G worth of patches. I do not know why it is showing 100% above.

> --
>               Stuart D. Gathman <stuart@gathman.org>
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
