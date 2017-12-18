Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7937769287
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 17:01:46 +0000 (UTC)
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F2917EA84
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 17:01:46 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id u42so20820902qte.7
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 09:01:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218165515.GA22488@agk-dp.fab.redhat.com>
References: <CAM2wQBucairMqzmBb8+g4Lw06mvYKUwp0-x3aguwXpHQNPsNew@mail.gmail.com>
	<20171218165515.GA22488@agk-dp.fab.redhat.com>
From: Thanos Makatos <thanos.makatos@onapp.com>
Date: Mon, 18 Dec 2017 17:01:23 +0000
Message-ID: <CAM2wQBu=sUUpGsQHxRb2nkLuL6Wp8dLDnSXSKqZsXmJCXKK+cw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm filter not ignoring block device
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
To: Thanos Makatos <thanos.makatos@onapp.com>, linux-lvm@redhat.com

On 18 December 2017 at 16:55, Alasdair G Kergon <agk@redhat.com> wrote:
> On Mon, Dec 18, 2017 at 04:48:19PM +0000, Thanos Makatos wrote:
>>      filter = [ "r|/dev/mapper/foo7|" ]
>
> Try setting global_filter.

It worked, thanks.
