Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9AAkw0X004142
	for <linux-lvm@redhat.com>; Tue, 10 Oct 2006 06:46:58 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9AAku5q030510
	for <linux-lvm@redhat.com>; Tue, 10 Oct 2006 06:46:56 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k9AAksk05318
	for linux-lvm@redhat.com; Tue, 10 Oct 2006 11:46:54 +0100
Date: Tue, 10 Oct 2006 11:46:54 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] LV open but not mounted ?
Message-ID: <20061010104649.GA2638@cobalt0.panici.net>
References: <20061009185806.GA29486@cobalt0.panici.net>
	<bae4416f49c8a46ad4f2b5232fec1986@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bae4416f49c8a46ad4f2b5232fec1986@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 09, 2006 at 04:49:35PM -0500, Jonathan E Brassow wrote:
> Hmmm, I can see where it might be 'active', but if it's not in use, it 
> shouldn't be open.

It is open. lvchange -an says LV in use: not removing

but I'm drawing a blank on finding anything that is actually using it.

I'm kinda hoping someone can throw some light on what 'open' is here.

> Some sub-lvs are marked as 'open', because they are used by the main LV 
> (such is the case with mirroring and snapshots).

no mirrors, no snapshots :-(

I have looked through /etc/lvm/backups and can't see anything odd.

> Have you tried 'lsof <path to LV>' ?

yup, tried lsof, tried fuser, there is no nfs, got nowhere.
 
It's one of those things where I fully expect to have to say "d'oh sorry!",
but until I can get deeper into it I am really stumped.

> On Oct 9, 2006, at 1:58 PM, paddy wrote:
> 
> >
> >I just noticed that I have a system where an LV appears to be open
> >(as given by lvs), but I can't see it mounted anywhere, or opened
> >by any process.
> >
> >Any insights, suggestions, explanations, etc gratefully received :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
