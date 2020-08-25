Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EE6F1112866
	for <linux-lvm@redhat.com>; Tue, 25 Aug 2020 13:15:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 947E9101A53F
	for <linux-lvm@redhat.com>; Tue, 25 Aug 2020 13:15:25 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
	[IPv6:2a01:4f8:221:1902:0:22:0:1])
	by s1-smtprelay.thinkmo.de (Postfix) with ESMTPS id 4BbTpL381dz3v
	for <linux-lvm@redhat.com>; Tue, 25 Aug 2020 13:08:58 +0000 (UTC)
Date: Tue, 25 Aug 2020 15:08:55 +0200
From: Bastian Blank <bblank@thinkmo.de>
Message-ID: <20200825130855.45l2avyiswqwuoik@shell.thinkmo.de>
References: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
Content-Disposition: inline
Subject: Re: [linux-lvm] Regarding the configure error while updating the
 LVM2 package
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

On Mon, Aug 24, 2020 at 02:56:33PM +0530, KrishnaMurali Chennuboina wrote:
> While updating the LVM2 package to lvm2-2_02_180, configure is failing with
> biling out error.
> Error Message Observed:
> checking for langinfo.h... yes
> checking libaio.h usability... no
> checking libaio.h presence... no
> checking for libaio.h... no

I would call that pretty obvious.  You need libaio.h, which according to
https://packages.debian.org/file:libaio.h is in package libaio-dev and
comes from https://pagure.io/libaio.

You can disable the usage of libaio, but please read the configure
help yourself for that.

Regards,
Bastian

-- 
Violence in reality is quite different from theory.
		-- Spock, "The Cloud Minders", stardate 5818.4
