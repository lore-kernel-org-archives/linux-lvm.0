Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBKBfmr13751
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 06:41:48 -0500
Received: from Cantor.suse.de (mail-ex.suse.de [195.135.220.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBKBfgJE023730
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 06:41:42 -0500
Received: from hermes.suse.de (hermes-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by Cantor.suse.de (Postfix) with ESMTP id 60A60121C6ED
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 12:41:36 +0100 (CET)
Date: Mon, 20 Dec 2004 12:41:35 +0100
From: Arvin Schnell <arvin@suse.de>
Subject: Re: [linux-lvm] patch for separator option
Message-ID: <20041220114135.GA8861@suse.de>
References: <20041214093850.GA16922@suse.de> <20041216110052.GA4410@suse.de>
	<20041218203208.GN26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041218203208.GN26670@agk.surrey.redhat.com>
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

On Sat, Dec 18, 2004 at 08:32:08PM +0000, Alasdair G Kergon wrote:
> > > I realized that the -s/--short option for vgdisplay doesn't work
> > > in lvm 2.2.00.31 (but also older versions).  That's because the
> > > option --separator also gets the short option 's' in args.h.
> 
> > It the patch ok and will it be included in lvm2?
>  
> Not in that precise form:
> Need to check for all other existing conflicts, if any, and
> find a generic way to resolve them so 'vgs -s,' for
> example can hopefully still work.

Checking for conflicts is a good idea.

'-s' is never documented as a shortcut for '--separator', neither
in the help text nor in the man pages.  So 'vgs -s' does not have
to work.  I also don't think it's user-friendly if an option
e.g. '--separator' can be abbreviated by '-s' in only some lvm
tools.

ciao Arvin
