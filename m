Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B87B70BCC
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 14:54:12 +0000 (UTC)
Received: from sonic306-20.consmr.mail.ir2.yahoo.com
	(sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00434154B64
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 14:54:11 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
References: <f0cb5c37-29b1-e9d6-30ae-a0b5800f65d6@yahoo.co.uk>
Message-ID: <0bed0c25-ed17-1862-eeaa-860c84e07b4d@yahoo.co.uk>
Date: Wed, 18 Oct 2017 15:54:06 +0100
MIME-Version: 1.0
In-Reply-To: <f0cb5c37-29b1-e9d6-30ae-a0b5800f65d6@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: Re: [linux-lvm] lvm raid: pvmove vs lvconvert
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



On 18/10/17 15:42, lejeczek wrote:
> hi there
>
> in lvm raid LVs, which one should be used and how do they 
> differ - would you know? Are they meant for different things?
>
sorry, I'm thinking specifically of: lvconvert --replace VS 
pvmove

> many thanks, L.
