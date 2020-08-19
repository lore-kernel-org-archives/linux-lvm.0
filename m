Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B8C951A4
	for <linux-lvm@redhat.com>; Wed, 19 Aug 2020 04:39:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7221C984BAE
	for <linux-lvm@redhat.com>; Wed, 19 Aug 2020 04:39:37 +0000 (UTC)
References: <1597810558-23809-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <ddc09a43-3aba-b290-9c37-d2d8cf94ef43@suse.com>
Date: Wed, 19 Aug 2020 12:39:19 +0800
In-Reply-To: <1597810558-23809-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvdisplay: dispaly partial when underlying
	devs missing
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

I'm not sure whether in any case one of the LV underlying dev missing must think as 'not available (partial)'.
if a LV contains 10 PVs, and the rear PVs haven't be used. in this case display 'available (partial)' looks better
than 'not available (partial)'. but anyway, the 'partial' should be displayed.

On 8/19/20 12:15 PM, Zhao Heming wrote:
> After removing LV underlying dev, lvdisplay still display 'available'.
> 
> With this patch, lvdisplay will show
> from:
>    LV Status              available
> to:
>    LV Status              NOT available (partial)
> 
> reproducible steps:
> 1. vgcreate vg1 /dev/sda /dev/sdb
> 2. lvcreate --type raid0 -l 100%FREE -n raid0lv vg1
> 3. do remove the /dev/sdb action
> 4. lvdisplay show wrong 'LV Status'
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   lib/display/display.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/display/display.c b/lib/display/display.c
> index 36c9879b3..6c895c820 100644
> --- a/lib/display/display.c
> +++ b/lib/display/display.c
> @@ -399,7 +399,7 @@ int lvdisplay_full(struct cmd_context *cmd,
>   		   void *handle __attribute__((unused)))
>   {
>   	struct lvinfo info;
> -	int inkernel, snap_active = 0;
> +	int inkernel, snap_active = 0, partial = 0;
>   	char uuid[64] __attribute__((aligned(8)));
>   	const char *access_str;
>   	struct lv_segment *snap_seg = NULL, *mirror_seg = NULL;
> @@ -555,9 +555,13 @@ int lvdisplay_full(struct cmd_context *cmd,
>   
>   	if (inkernel && info.suspended)
>   		log_print("LV Status              suspended");
> -	else if (activation())
> -		log_print("LV Status              %savailable",
> -			  inkernel ? "" : "NOT ");
> +	else if (activation()) {
> +		if (lv->status & PARTIAL_LV)
> +			partial = 1;
> +		log_print("LV Status              %savailable %s",
> +			  (inkernel && !partial) ? "" : "NOT ",
> +			  partial ? "(partial)" : "");
> +	}
>   
>   /********* FIXME lv_number
>       log_print("LV #                   %u", lv->lv_number + 1);
> 
