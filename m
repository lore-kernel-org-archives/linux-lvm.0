Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oALEHLTJ005722
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2010 09:17:21 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oALEH8ZX016467
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2010 09:17:12 -0500
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de with esmtp (Exim 4.72)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1PKAj5-00051x-Bh
	for linux-lvm@redhat.com; Sun, 21 Nov 2010 15:17:07 +0100
Message-ID: <c25788e8cb2f78db961555778c3997e3.squirrel@ssl.verfeiert.org>
In-Reply-To: <Pine.LNX.4.64.1011191651420.11792@bmsred.bmsi.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
	<20101118201222.GD30435@agk-dp.fab.redhat.com>
	<AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
	<Pine.LNX.4.64.1011191651420.11792@bmsred.bmsi.com>
Date: Sun, 21 Nov 2010 15:17:07 +0100 (CET)
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Look here:

http://sources.redhat.com/cgi-bin/cvsweb.cgi/LVM2/man/?cvsroot=3Dlvm2

or maybe even here:

http://sourceware.org/lvm2/

Which has the necessary cvs calls to get a copy of the cvs tree, as far as
I can see.


On Fri, November 19, 2010 22:56, Stuart D. Gathman wrote:
> On Thu, 18 Nov 2010, Stirling Westrup wrote:
>
>> > The man page explains how pvmove works. =EF=BF=BDNo data is removed un=
til it
>> > is safely available in its new location.
>>
>> pmove's man page leaves a LOT to be desired. It gives the bare syntax
>
> ... lots of valid criticism
>
> In the New Testament, speaking in tongues had to be accompanied by
> an interpretation.  In Open Source, criticism (however valid) should
> be accompanied by a contribution (in this case, an edited man page)!
> Actually, I would be willing to do that, I'm up to the writing, but it
> will
> take me a while to figure out where to check out the current man page
> source,
> unless someone gives me a pointer.
>
> --
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?"
> commercial._______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
