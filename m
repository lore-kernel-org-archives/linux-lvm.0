Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E1317AB6
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2018 16:47:07 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5D1B75755
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2018 16:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 1FB72435
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2018 17:46:57 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id lHvK5-rAXUYD for <linux-lvm@redhat.com>;
	Wed, 10 Jan 2018 17:46:56 +0100 (CET)
Received: from [IPv6:2003:f6:ebc2:3000:ecf2:f664:8950:87dc]
	(p200300F6EBC23000ECF2F664895087DC.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebc2:3000:ecf2:f664:8950:87dc])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id C31D4437
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2018 17:46:49 +0100 (CET)
References: <e12eff82-677c-7e91-1697-eb955d1227b7@mglug.de>
	<20180107025221.GC4551@agk-dp.fab.redhat.com>
From: Oliver Rath <rath@mglug.de>
Message-ID: <e2a1c0d5-edd6-cd94-ce7d-2341f4178c49@mglug.de>
Date: Wed, 10 Jan 2018 17:46:49 +0100
MIME-Version: 1.0
In-Reply-To: <20180107025221.GC4551@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] new max tag length?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi Alasdair,

thank you very much for the hint! But .. (see below)


On 07.01.2018 03:52, Alasdair G Kergon wrote:
> On Sun, Jan 07, 2018 at 02:04:06AM +0100, Oliver Rath wrote:
>> Ive read here, the max length of a tag is 128:
>> https://www.suse.com/documentation/sles11/stor_admin/data/lvmtagging.html
> The original spec for this work remains in the source tree,
> docs/tagging.spec:
>
> + 1) Tag character set: A-Za-z0-9_+.- 
> +    Can't start with hyphen & max length is 128 (NAME_LEN).
>

Ive tried much more then 65000 chars and it worked:

# lvchange --addtag `printf 'z%.0s' {1..77777}` levg/testsnap
  Logical volume levg/testsnap changed.

# lvs -o lv_tags levg/testsnap
... [lots of z´s] ...

Its definitly more than 128 characters .. Whats wrong now?

Regards,
Oliver
