Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A2995D71D
	for <linux-lvm@redhat.com>; Fri, 28 Jun 2019 11:18:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60CF2C057F4B
	for <linux-lvm@redhat.com>; Fri, 28 Jun 2019 11:17:59 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <trinity-9e2606e3-3262-426a-85c8-210f4a40d01b-1561720677989@3c-app-gmx-bs21>
From: "Steve Keller" <keller.steve@gmx.de>
Date: Fri, 28 Jun 2019 13:17:58 +0200
In-Reply-To: <4f1dedd7-2a1d-b266-a173-bda24a19347f@redhat.com>
References: <trinity-fec29f23-aa03-442b-b6d6-84dece8ba273-1560313085888@3c-app-gmx-bs14>
	<4f1dedd7-2a1d-b266-a173-bda24a19347f@redhat.com>
Subject: Re: [linux-lvm] Question on vgconvert
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

Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Wow :) where you've been hiding for last ~15 years when format V2 exists ;)
> V1 is considered obsolete for very looong time and it's been even dropped
> from support from version 2.03.

That server has indeed been set up rougly 15 years ago. And until
now, we had no need to convert or resize the PVs. Now, the machine is
virtualized and we wanted to reduce the disk size to what's actually
needed.

> So you need version 2.02.X.

Fortunately, that is exactly the version Debian stretch still has...

> Operation should be instant (it's only metadata rewrite).
>
> AFAIK no PE should be influenced.

We have done the conversion and it worked like a charm. Also the following
massive reorganization using pvmove worked fine.

Steve
