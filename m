Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB23Cqr2011008
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 22:12:52 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB23Cfvk012247
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 22:12:42 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oB23Ceao002563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 22:12:40 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oB23CdbN027214
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 22:12:39 -0500
Date: Wed, 1 Dec 2010 22:12:39 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1288034225.4299.14.camel@sc.lan>
Message-ID: <Pine.LNX.4.64.1012012208410.27181@bmsred.bmsi.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
	<1288034225.4299.14.camel@sc.lan>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Determine boot disk device name...
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

On Mon, 25 Oct 2010, Stephane Chazelas wrote:

> > For starters, how can I determine the physical device name of
> > current/active boot disk in Linux?
> [...]
> 
> Please clarify what you mean by "physical device" and "boot disk"
> especially when refered to as "current/active".

I think he means the device that will be used at the next boot (where
"device" can be network), which is of course a BIOS question.  He may be coming
from AIX where there is a command to query and set the boot device list in the
BIOS config.

Such a utility is easy with openfirmware.  It is feasible with proprietary
firmware, but has to know about a lot of variations on CMOS layout.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
