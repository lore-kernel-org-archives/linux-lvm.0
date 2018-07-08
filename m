Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 957855C542
	for <linux-lvm@redhat.com>; Sun,  8 Jul 2018 12:17:14 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D80BDC049D5C
	for <linux-lvm@redhat.com>; Sun,  8 Jul 2018 12:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 7FAEA450
	for <linux-lvm@redhat.com>; Sun,  8 Jul 2018 14:17:11 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id FfcIfoJVmhuY for <linux-lvm@redhat.com>;
	Sun,  8 Jul 2018 14:17:11 +0200 (CEST)
Received: from [IPv6:2003:f6:ebca:9b00:e8a7:e68a:5cd8:5f5a]
	(p200300F6EBCA9B00E8A7E68A5CD85F5A.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebca:9b00:e8a7:e68a:5cd8:5f5a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 247CE428
	for <linux-lvm@redhat.com>; Sun,  8 Jul 2018 14:17:11 +0200 (CEST)
References: <c8f8a8ab-95d2-a5ea-fd05-22b426a30f8e@mglug.de>
From: Oliver Rath <rath@mglug.de>
Message-ID: <5f1400aa-4524-be82-ab37-c146af5e9310@mglug.de>
Date: Sun, 8 Jul 2018 14:17:10 +0200
MIME-Version: 1.0
In-Reply-To: <c8f8a8ab-95d2-a5ea-fd05-22b426a30f8e@mglug.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] [SOLVED] Re:  Howto set lv_fixed_minor?
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
To: linux-lvm@redhat.com

Hi List,

If I see right, i can set explicitly a minor device with "--persistent
y". I will continue research in this direction.

Oliver



On 08.07.2018 14:11, Oliver Rath wrote:
> Hi list,
>
> Ive seen, that it is possible, that every lv-device gets a fixed minor
> number (lvs -o lv_fixed_minor). But I didnt find a way to set it? Is
> this possible?
>
> Tfh!
>
> Oliver
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
