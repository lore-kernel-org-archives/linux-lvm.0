Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5478918EF5
	for <linux-lvm@redhat.com>; Thu,  1 Jun 2017 01:20:58 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F25585376
	for <linux-lvm@redhat.com>; Thu,  1 Jun 2017 01:20:57 +0000 (UTC)
Received: from elissa.gathman.org (h.elissa.gathman.org
	[IPv6:fc37:2c50:7583:e01a:8c69:8f50:8dcf:a076])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v510Ujtg020387
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 20:30:46 -0400
References: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
	<f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
	<8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <66180b6e-37f9-11d9-50af-3ba38aef205e@gathman.org>
Date: Wed, 31 May 2017 20:31:23 -0400
MIME-Version: 1.0
In-Reply-To: <8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question on mixing technologies
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

On 05/31/2017 02:53 AM, Georges Giralt wrote:
> I finally had time to test the first solution, having the root FS on
> the M.2 card and everything else (including /var and /tmp) on the
> mechanical drives.
>
> The responsiveness of the machine is awesome and, for now, without any
> glitch or problem. So I may retain this solution.
>
> The only remaining question is how to trim the device as it is not
> "mounted". Is there a special pvcreate or LVM option to have this
> device trimmed when it should be ?
# fstrim /
