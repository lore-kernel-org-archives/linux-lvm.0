Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGB19r07928
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 06:01:09 -0500
Received: from Cantor.suse.de (mail-ex.suse.de [195.135.220.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBGB0whU002399
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 06:01:08 -0500
Received: from hermes.suse.de (hermes-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by Cantor.suse.de (Postfix) with ESMTP id B3FB6122608F
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 12:00:52 +0100 (CET)
Date: Thu, 16 Dec 2004 12:00:52 +0100
From: Arvin Schnell <arvin@suse.de>
Subject: Re: [linux-lvm] patch for separator option
Message-ID: <20041216110052.GA4410@suse.de>
References: <20041214093850.GA16922@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041214093850.GA16922@suse.de>
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
To: Linux LVM <linux-lvm@redhat.com>

On Tue, Dec 14, 2004 at 10:38:50AM +0100, Arvin Schnell wrote:
> 
> Hi,
> 
> I realized that the -s/--short option for vgdisplay doesn't work
> in lvm 2.2.00.31 (but also older versions).  That's because the
> option --separator also gets the short option 's' in args.h.
> 
> Attached is a patch.

It the patch ok and will it be included in lvm2?  Or am I missing
something?

ciao Arvin
