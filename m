Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2S994RC007332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2016 05:09:04 -0400
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43]) by mx1.redhat.com (Postfix) with ESMTPS id 342F4486
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2016 09:09:03 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id k1so148291768vkb.0
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2016 02:09:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAYit8RWs=Sq262Pyg6T5Ceqjmg-mwA2Ntw5kCeFZNyisHX9Pg@mail.gmail.com>
References: <CAAYit8RWs=Sq262Pyg6T5Ceqjmg-mwA2Ntw5kCeFZNyisHX9Pg@mail.gmail.com>
Date: Mon, 28 Mar 2016 17:09:02 +0800
Message-ID: <CAAYit8SBQeoCzNJZu-6vE8syekLYxL=z_PDrGXDk_CTNvu=9-g@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Subject: Re: [linux-lvm] Minor bugs in LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2016-01-27 19:11 GMT+08:00 M.H. Tsai <mingnus@gmail.com>:
> 4. Typo in debug message
>
> diff --git a/lib/activate/activate.c b/lib/activate/activate.c
> index 8f5b72b..d7c8e4e 100644
> --- a/lib/activate/activate.c
> +++ b/lib/activate/activate.c
> @@ -1156,7 +1156,7 @@ int lv_thin_pool_transaction_id(const struct
> logical_volume *lv,
>   if (!lv_info(lv->vg->cmd, lv, 1, NULL, 0, 0))
>   return 0;
>
> - log_debug_activation("Checking thin percent for LV %s.",
> + log_debug_activation("Checking thin-pool transaction id for LV %s.",
>       display_lvname(lv));
>
>   if (!(dm = dev_manager_create(lv->vg->cmd, lv->vg->name, 1)))

Hi,

This issue hasn't be completely fixed. The patch 53058e52 still prints
incorrect message.
https://www.redhat.com/archives/lvm-devel/2016-February/msg00015.html

It should be:

diff --git a/lib/activate/activate.c b/lib/activate/activate.c
index 2eb24d4..a3b2379 100644
--- a/lib/activate/activate.c
+++ b/lib/activate/activate.c
@@ -1160,7 +1160,7 @@ int lv_thin_pool_transaction_id(const struct
logical_volume *lv,
        if (!lv_info(lv->vg->cmd, lv, 1, NULL, 0, 0))
                return 0;

-       log_debug_activation("Checking thin-pool percent for LV %s.",
+       log_debug_activation("Checking thin-pool transaction id for LV %s.",
                             display_lvname(lv));

        if (!(dm = dev_manager_create(lv->vg->cmd, lv->vg->name, 1)))


Thanks,
Ming-Hung Tsai
