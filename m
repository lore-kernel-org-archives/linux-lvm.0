Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82599619C0
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 11:06:14 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A044B356D4
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 11:06:11 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 8492140C85FE
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 13:06:09 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 08 Sep 2017 13:06:09 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
Message-ID: <08d4bac7cb7ae8e9c7bc7c474375f092@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: linux-lvm@redhat.com

Gionatan Danti schreef op 08-09-2017 12:35:
> Hi list,
> as by the subject: is it possible to reserve space for specific thin
> logical volumes?
> 
> This can be useful to "protect" critical volumes from having their
> space "eaten" by other, potentially misconfigured, thin volumes.
> 
> Another, somewhat more convoluted, use case is to prevent snapshot
> creation when thin pool space is too low, causing the pool to fill up
> completely (with all the associated dramas for the other thin
> volumes).

For my 'ideals' thin space reservation (which would be like allocation 
in advance) would definitely be a welcome thing.

You can also think of it in terms of a default pre-allocation setting. 
I.e. every volume keeps a bit of space over-allocated while only doing 
so if there is actually room in the thin volume (some kind of lazy 
allocation?).

Of course not trying to steal your question here and I do not know if 
any such thing is possible but it might be and I wouldn't mind hearing 
the answer as well.

No offense intended. Regards.
