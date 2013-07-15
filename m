Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6F8XCp8002176
	for <linux-lvm@redhat.com>; Mon, 15 Jul 2013 04:33:12 -0400
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6F8X9dp017267
	for <linux-lvm@redhat.com>; Mon, 15 Jul 2013 04:33:10 -0400
Received: by mail-we0-f180.google.com with SMTP id w56so9943450wes.11
	for <linux-lvm@redhat.com>; Mon, 15 Jul 2013 01:33:09 -0700 (PDT)
Message-ID: <51E3B3C2.7030002@gmail.com>
Date: Mon, 15 Jul 2013 10:33:06 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAGDaZ_r8xmDOMTr17CVUh3WJMwkgUYcrYWYfMfBPTiDQvt7LEQ@mail.gmail.com>
In-Reply-To: <CAGDaZ_r8xmDOMTr17CVUh3WJMwkgUYcrYWYfMfBPTiDQvt7LEQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Mirroring to a thin volume
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Raymond Jennings <shentino@gmail.com>

Dne 15.7.2013 07:46, Raymond Jennings napsal(a):
> Is there a way to hot-convert a live volume to thin provisioning?
>
> I was thinking of doing this:
>
> 1.  Create a thin volume
> 2.  Have it mirror the linear volume
> 3.  Break the linear mirror
> 4.  Run an fs discard on the thin volume

There is planned feature 'merge' of any LV into thin pool - so you would
be able to turn your LV into thin volume (but likely there will not a be a way 
to split such thin-LV back to non-thin LV anytime soon).

In the upstream git there is already support for 'external origin'
where you could use some LV as a source for 'unprovisioned' blocks
which is something like snapshot of LV where modified blocks
are put into thin pool -  but this feature has some limitation -
i.e. for now you cannot 'merge' modified blocks back to external origin.

I guess mirror construction currently only supports PVs - so
you would need to use 'stacked' VG - there is planned better support for 
stacking of volumes in a VG - but it's not so easy as it might look.

Zdenek
