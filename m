Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3OCnOfL021824
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 08:49:24 -0400
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OCnMMO022946
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 08:49:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 1CA611B4358
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 14:49:21 +0200 (CEST)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-c309G2eQAV for <linux-lvm@redhat.com>;
	Tue, 24 Apr 2012 14:49:21 +0200 (CEST)
Received: from soda.linbit (unknown [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id B79021B4268
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 14:49:20 +0200 (CEST)
Date: Tue, 24 Apr 2012 14:49:19 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20120424124919.GB29174@soda.linbit>
References: <4F969B43.2080504@ki.tng.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F969B43.2080504@ki.tng.de>
Subject: Re: [linux-lvm] calculating size of metadata.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Apr 24, 2012 at 02:23:31PM +0200, Jan-Hendrik Palic wrote:
> Hi there,
> 
> we planning to create a pv and vg on a 19,95TB partition running on
> raid6. One issue I have is the size of the metadata. I am looking
> for a way to calculate the this size, but unfortunatly, I cannot
> find a some.
> Which size should I use?

Depends on how many LVs you intend to have,
and how much LV fragmentation you expect.

I'd estimate 1 to 2 kByte LVM meta data per expected LV,
that should be on the safe side.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
