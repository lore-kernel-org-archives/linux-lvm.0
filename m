Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7KJuDrQ016577
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 15:56:13 -0400
Received: from mail9.dslextreme.com (mail9.dslextreme.com [66.51.199.94])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l7KJu7Ld014346
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 15:56:07 -0400
Message-Id: <6.0.3.0.1.20070820124701.033c7b10@mail.ecis.com>
Date: Mon, 20 Aug 2007 12:55:59 -0700
From: "A.Lizard" <alizard@ecis.com>
Subject: Re: [linux-lvm] Altering a Physical Volume's UUID on SATA
In-Reply-To: <20070820144843.922B973191@hormel.redhat.com>
References: <20070820144843.922B973191@hormel.redhat.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

At 07:48 AM 8/20/07, you wrote:
While you probably describe a better solution, this was written to provide 
a general solution to the "change uuid" problem to the community that 
actually works on SATA and to provide a how-to reference for LVM filesystem 
cloning in the context of the "how to set up a mirror drive quickly and 
easily" section of an article in progress written for novices on how to 
transition from an IDE to SATA drive in a Linux workstation.

dd + changing uuid + vgrename appears to be the quickest and easiest 
solution for LVM drive cloning, since the user won't have to worry about 
setting up drive partitions or creating a MBR or setting up an LVM 
filesystem manually.

There are several solutions to drive cloning for experienced users and 
admins, but for the newbie, quick, easy, and as few steps as possible are 
in order.

A.Lizard

>Message: 6
>Date: Sun, 19 Aug 2007 19:51:49 -0400 (EDT)
>From: "Stuart D. Gathman" <stuart@bmsi.com>
>Subject: Re: [linux-lvm] Altering a Physical Volume's UUID on SATA
>         hard drives     [solved]
>To: LVM general discussion and development <linux-lvm@redhat.com>
>Message-ID: <Pine.LNX.4.44.0708191740520.2161-100000@bmsred.bmsi.com>
>Content-Type: TEXT/PLAIN; charset=US-ASCII
>
>On Sat, 18 Aug 2007, A.Lizard wrote:
>
> > I bit-copied a backup LVM disk using dd from a Knoppix LiveCD (based on
> > Debian) and wound up with duplicate volume and uuids, meaning I couldn't
> > mount both the main and backup volumes simultaneously at the same time for
> > subsequent backups. Of course, vgrename is ineffective to allow
> > simultaneous mounting without changing the uuids.
>
>I would suggest copying (bitwise if desired) each LV individually to another
>volume group with a different name (and UUID).  This gives you a lot more
>flexibility with physical storage for primary vs backup volume groups.
>Furthermore, your LV backup procedure can take snapshots of each LV first.
>
>--
>               Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
>"Confutatis maledictis, flammis acribus addictis" - background song for
>a Microsoft sponsored "Where do you want to go from here?" commercial.

member The Internet Society (ISOC), The HTML Writers Guild.
"You can't have in a democracy various groups with arms - you have to have 
the state with a monopoly on power." Condoleeza Rice, US Secretary of State
Personal Website http://www.ecis.com/~alizard
business Website http://www.reptilelabs.com
backup address (if ALL else fails) alizard@gmail.com
PGP 8.0 key available by request or keyserver. Download PGP from:
http://www.pgpi.org for e-mail privacy.
Disaster prep info: http://www.ecis.com/~alizard/y2k.html
***Looking for INTELLIGENT new technology public policy 
alternatives?***               http://www.ecis.com/~alizard/technology.html
