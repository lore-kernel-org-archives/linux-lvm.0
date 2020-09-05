Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5D1202450E
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:17:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45A20101A53F
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:17:29 +0000 (UTC)
References: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <87c506c3-45aa-e279-6bc1-2597072c062e@suse.com>
Date: Sat, 5 Sep 2020 17:17:11 +0800
In-Reply-To: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] [PATCH] lvs: add -o lv_usable
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
Cc: teigland@sourceware.org, zkabelac@redhat.com



On 9/5/20 5:06 PM, Zhao Heming wrote:
> report LV is usable for upper layer.
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   lib/activate/activate.h          |   2 +
>   lib/activate/dev_manager.c       |  67 ++++++++++++++++
>   lib/metadata/metadata-exported.h |   1 +
>   lib/metadata/metadata.c          | 130 +++++++++++++++++++++++++++++++
>   lib/report/columns.h             |   1 +
>   lib/report/properties.c          |   2 +
>   lib/report/report.c              |  13 ++++
>   lib/report/values.h              |   1 +
>   8 files changed, 217 insertions(+)
> 

There are some places need to improve.

1. in lib/activate/dev_manager.c, function lv_mapping_table() & dm_has_lvdev() almost same.
   it may merge into one function.

2. LV device-mapper name need to improve, 

  in lib/metadata/metadata.c  _lv_is_usable()
  I use below ugly code to construct dm name

  ```
  /* format is right: "vgname" + '-' + "lvname" ?? */
  snprintf(lvname, 50, "%s-%s", lv->vg->name, seg_lv(seg, s)->name);
  ... ...
  /* format is right: "vgname" + '-' + "lvname" ?? */
  snprintf(lvname, 50, "%s-%s", lv->vg->name, lv->name);
  ```


Thanks
