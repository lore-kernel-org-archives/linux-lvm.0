Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m96HFLWw006675
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 13:15:21 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m96HF8as015041
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 13:15:08 -0400
Received: by gxk8 with SMTP id 8so5329302gxk.3
	for <linux-lvm@redhat.com>; Mon, 06 Oct 2008 10:15:08 -0700 (PDT)
Message-ID: <ae1cf3f40810061015t6400da70p532f294033f8bb2e@mail.gmail.com>
Date: Mon, 6 Oct 2008 19:15:08 +0200
From: "Michael Schmarck" <michael.schmarck@habmalnefrage.de>
Sender: a.skwar@gmail.com
Subject: Re: [linux-lvm] Create Snapshot volume,
	with sized based on size of original lv
In-Reply-To: <20081006131141.GA23898@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081004090534.227400@gmx.net>
	<20081006131141.GA23898@agk.fab.redhat.com>
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

Hi!

2008/10/6 Alasdair G Kergon <agk@redhat.com>
>
> On Sat, Oct 04, 2008 at 11:05:34AM +0200, Michael Schmarck wrote:
> > $ sudo lvm lvcreate -s -l 25%LV -n Bilder_snap /dev/sys/Bilder
> >   Please express size as %VG, %PVS, or %FREE.
> > Did I do something wrong, or is the output "--help"
> > just wrong?
>
> %LV is for resizing an existing LV.

All right; but why is it shown in the output of
lvcreate --help in the "-s" section? It's not
as if %<whatever> is shown in every output
of "-l" (eg. in the normal/first section of lvcreate,
in the "-l" list, no % options are shown).

> lvcreate -s -l n%LV would indeed be unambiguous,

Yep.

> but what then about lvresize on a snapshot?  Would it be % of
> base LV or % of existing snapshot?

Hm. What happens, if you do a "lvcreate -s -l 42%VGS"
and then make the VG larger? Do you then make the
snapshot volume larger as well? Or what, if you'd
use 8%FREE and then change the free space - do you
make the snap lv larger and smaller as required?

Anyway: I'd expect the size of the snap lv to *NOT*
change. Reason: The snap LV has been created with
a certain size. Why should changes in the setup of
the VG change the size of the snap lv? The size of
a (snap) LV is something which I expect to be static
(unless I, the admin of the system, change it). It should
not at all be dynamic (although dynamic volumes are
kinda cool, as can be seen in the case of ZFS - but
that's a totally different approach and thus not comparable
to LVM).

> (Perhaps we need %ORIGIN.)

Maybe. But that would IMO only make sense, if you
currently change the sizes of snap LVs dynamically
in the case of the other % options. If that's not done,
then adding yet another option there would not be such
a great idea, IMO. Instead, %LV should be used - for
the reasons, please see above *g*.

Best regards,
Mike
