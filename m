Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAACLuih016986
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 07:21:56 -0500
Received: from freedom.ind.br (mail.freedom.ind.br [201.35.65.90])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAACLs5i029850
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 07:21:55 -0500
From: Otavio Salvador <otavio@debian.org>
Subject: Re: [parted-devel] Re: [linux-lvm] Proposal for the libLVM project
References: <455431FB.3070701@kix.in>
	<20061109211804.GL30653@agk.surrey.redhat.com>
Date: Fri, 10 Nov 2006 10:21:48 -0200
In-Reply-To: <20061109211804.GL30653@agk.surrey.redhat.com> (Alasdair
	G. Kergon's message of "Thu, 9 Nov 2006 21:18:04 +0000")
Message-ID: <87hcx7o5k3.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
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
To: Anant Narayanan <anant@kix.in>
Cc: parted-devel@lists.alioth.debian.org, linux-lvm@redhat.com

[ I've removed linux-lvm from cc list but leave parted-devel since
it still on topic]

Alasdair G Kergon <agk@redhat.com> writes:

> Thanks for getting in touch.
>
> The only library supported for external applications at present is
> liblvm2cmd and this is basically a wrapper around the command line.
> This was a deliberate decision to force people to use the only stable interface
> we have, namely the command line.

Right. Is this library being still maintained?

> The end result should be:
>
>   a new lvm library API exists which is designed to be maintainable as the
> tools develop and not cause compatibility problems or inhibit anticipated
> future developments;
>
>   the tools directory uses only the published API;
>
>   everything available in the API is available directly through the lvm
> command line - there must be no 'hidden' features;

I completely agree with you here.

>   no internal structures are exposed through the library API so we retain
> complete freedom to change internal implementations and data structures.

Indeed.

> The first job is to sketch out possible interfaces for some examples
> like that - 'create a PV', 'create/extend a VG' - based on what the tools
> do today.

Indeed. How do you wish to coordenate this? Should we propose those to
mailing list? Or should us use something like a wiki?

> Further, if there are things that parted wants that are not available
> through the command line today, then put those on the table ASAP and
> we should try to get them implemented through the command line (in parallel
> with work on designing a library).

I don't think so. On parted side we'll probably write another layer
that will be used to "connect" the libparted on external libraries. It
won't be done just for lvm but also for other filesystems like
ext[34], and other's will come later.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://www.freedom.ind.br/otavio
---------------------------------------------
"Microsoft gives you Windows ... Linux gives
 you the whole house."
