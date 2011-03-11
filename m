Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2BEGUNu020187
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 09:16:30 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2BEGKQJ019443
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 09:16:20 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2BEGJNB014096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 09:16:19 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2BEGJUo025258
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 09:16:19 -0500
Date: Fri, 11 Mar 2011 09:16:19 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTi=JZNvmbuF_PXsns-ZEtGn3MTiDe66FxB8Pis0a@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1103110909340.25141@bmsred.bmsi.com>
References: <4D79D2FA.5000505@gmail.com>
	<AANLkTi=JZNvmbuF_PXsns-ZEtGn3MTiDe66FxB8Pis0a@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvextend and lvresize
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 11 Mar 2011, hansbkk@gmail.com wrote:

> On Fri, Mar 11, 2011 at 2:44 PM, Brent Clark <brentgclarklist@gmail.com>
> wrote:
> > What is the difference between lvextend and lvresize?
> 
> 
> Someone might be generous enough to answer, but IMO it is
> inconsiderate to waste the time of thousands of people by posting a
> question easily answered by a little research:

It is a reasonable enough question.  The OP obviously had already read
the man pages, which seems to describe the same cababilities for 
lvresize and lvextend/lvreduce.  He wants to know why we have both?
Is it historical accident?  Or is there some subtle feature that
distinguishes the two?

First of all, notice that all three commands are links to the lvm
command, so they share code.  As far as I know, they are all just
alternate syntax for the same operations.  You might want to 
use lvextend rather that lvresize, for instance, to avoid accidentally
reducing instead with a typo and destroying data.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
