Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i44Ndlv13578
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 19:39:47 -0400
Received: from imf20aec.mail.bellsouth.net (imf20aec.mail.bellsouth.net
	[205.152.59.68])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i44NdkkG030562
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 19:39:46 -0400
Received: from david.internal.NorcrossGroup.com ([68.213.19.251])
	by imf20aec.mail.bellsouth.net
	(InterMail vM.5.01.06.08 201-253-122-130-108-20031117) with ESMTP id
	<20040504233941.PDDM25885.imf20aec.mail.bellsouth.net@david.internal.NorcrossGroup.com>
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 19:39:41 -0400
Subject: Re: [linux-lvm] [PATCH] crypto for LVM2
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040504172037.B5316@homer.msp.redhat.com>
References: <20040503232018.GD7384@fukurou.paranoiacs.org>
	<20040504172037.B5316@homer.msp.redhat.com>
Message-Id: <1083713692.4900.6.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Date: Tue, 04 May 2004 19:34:53 -0400
Content-Transfer-Encoding: 7bit
Reply-To: freemyer-ml@NorcrossGroup.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2004-05-04 at 18:20, Alasdair G Kergon wrote:
> On Mon, May 03, 2004 at 07:20:20PM -0400, Ben Slusky wrote:
> > The encryption key is not stored with the metadata, as that would
> > kinda defeat the purpose of encryption. 
> 
> That depends on the usage - some people may be happy to keep the
> key in the metadata on removable media.
> 
I haven't kept up with how encrypted filesystems are typically used.

I think there is value in having a key to the computer that is used to
"start" it, but that can be locked in a safe most of the time.

That way if a thief tries to steal the entire computer, they end-up with
nothing but encrypted data.

I've even had some people tell me that HIPAA's security rule will
require something like that at doctor's offices.  (ie. security rule
goes into effect april 2005.)

Greg
-- 
Greg Freemyer
