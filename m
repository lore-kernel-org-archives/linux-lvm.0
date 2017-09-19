Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D00775C541
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2017 08:49:13 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id A4903267F7
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2017 08:49:11 +0000 (UTC)
References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
	<603627203.4607722.1505769042298@mail.yahoo.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
Date: Tue, 19 Sep 2017 10:49:10 +0200
MIME-Version: 1.0
In-Reply-To: <603627203.4607722.1505769042298@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 18/09/2017 23:10, matthew patton wrote:
> If the warnings are not being emitted to STDERR then that needs to be fixed right off the bat.

The line with WARNINGs are written on STDERR, at least con recent LVM 
version.

> 'lvs -q blah' should squash any warnings.
> 'lvcreate' frankly shouldn't output anything unless invoked with '-v' anyway. So therefore '-q' should also squash warnings.

I'm not sure this is the right approach. I do not expect "-q" to remove 
*all* warnings, because warnings can be quite important.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
