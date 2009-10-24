Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9OM4GD0019572
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 18:04:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9OM46lO014898
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 18:04:06 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9OM452Y030144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 18:04:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9OM45s7006397
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 18:04:05 -0400
Date: Sat, 24 Oct 2009 18:04:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
In-Reply-To: <29ae894c0910241354k67768707je61a9d25d3c14f6@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910241729410.6251@bmsred.bmsi.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
	<a5a956f70910241216t4cd9d0d9j6e3ccfa6db4c4137@mail.gmail.com>
	<29ae894c0910241354k67768707je61a9d25d3c14f6@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 24 Oct 2009, brem belguebli wrote:

> >> It's non sense arguing that LVM is not intended for root due to the
> >> fact that you cannot shrink it  (growing online is operational and
> >> works fine).
> >>
> >> This is the only thing that is not allowed, though technically could
> >> it be possible.

On some installs, I take the AIX approach an allocate a smallish / filesystem,
with others mounted.  If you can go to single user mode, you can unmount the
other filesystems (e.g. /usr) for shrinkage.  This doesn't, of course, meet the
goal of shrinking while in actual operation.

You can get closer by running production in a virtual machine (I like
xen).  Then you can shutdown, resize, and boot a VM without shutting
down the host.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
