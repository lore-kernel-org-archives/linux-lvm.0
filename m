Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC92B10073CC
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 16:08:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FB6A101A540
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 16:08:05 +0000 (UTC)
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <6847f844-d3c1-0e11-f5f5-dfd292bc5390@suse.com>
Date: Fri, 28 Aug 2020 00:07:48 +0800
In-Reply-To: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
Cc: teigland@sourceware.org

please ignore this patch. I forgot to add [patch v2] & history info.

On 8/28/20 12:05 AM, Zhao Heming wrote:
> It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
> 1d0dc74f9147 only supports all raid type, this commit adds new api
> and extends support scope with linear/mirror type.
> 
> This patch introduced a new flag NOT_AVAIL_LV, when a lv (includeing
> sub-lv or child-lv) doesn't work, this flag will set.
> 
> With this patch, for linear type LV, one of two disks missing,
> lvdisplay will show
> from:
>    LV Status              available (partial)
> to:
>    LV Status              NOT available (partial)
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
