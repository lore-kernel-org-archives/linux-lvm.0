Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E55B75D6B4
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 18:13:28 +0000 (UTC)
Received: from mr012msb.fastweb.it (mr012msb.fastweb.it [85.18.95.109])
	by mx1.redhat.com (Postfix) with ESMTP id 8B81A30820CE
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 18:13:26 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Jun 2018 20:13:24 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
Message-ID: <39a2408c600ed4caf00724eb72c191c2@assyoma.it>
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ryan Launchbury <ryan@magenta.tv>

Il 20-06-2018 12:15 Zdenek Kabelac ha scritto:
> Hi
> 
> Aren't there any kernel write errors in your 'dmegs'.
> LV becomes fragile if the associated devices with cache are having HW
> issues (disk read/write errors)
> 
> Zdenek

Is that true even when using a writethrough cache mode?

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
