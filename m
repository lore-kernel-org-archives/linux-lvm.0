Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13D9E2166B28
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 05:19:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29DC48EE635
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 05:19:09 +0000 (UTC)
References: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <ff41471a-d775-a314-434a-eac3fd0668a4@suse.com>
Date: Wed, 26 Aug 2020 13:18:54 +0800
In-Reply-To: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] [PATCH] gcc: change zero-sized array to fexlible
	array
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
Cc: mcsontos@redhat.com

ping.

@Marian & other maintainers


On 8/21/20 12:05 AM, Zhao Heming wrote:
> this patch makes gcc happy with compiling option: [-Wstringop-overflow=]
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   device_mapper/libdm-common.c | 2 +-
>   lib/activate/fs.c            | 2 +-
>   libdm/libdm-common.c         | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/device_mapper/libdm-common.c b/device_mapper/libdm-common.c
> index bc691d6..3627457 100644
> --- a/device_mapper/libdm-common.c
> +++ b/device_mapper/libdm-common.c
> @@ -1445,7 +1445,7 @@ struct node_op_parms {
>   	char *old_name;
>   	int warn_if_udev_failed;
>   	unsigned rely_on_udev;
> -	char names[0];
> +	char names[];
>   };
>   
>   static void _store_str(char **pos, char **ptr, const char *str)
> diff --git a/lib/activate/fs.c b/lib/activate/fs.c
> index b2c99fc..96f7df6 100644
> --- a/lib/activate/fs.c
> +++ b/lib/activate/fs.c
> @@ -313,7 +313,7 @@ struct fs_op_parms {
>   	char *lv_name;
>   	char *dev;
>   	char *old_lv_name;
> -	char names[0];
> +	char names[];
>   };
>   
>   static void _store_str(char **pos, char **ptr, const char *str)
> diff --git a/libdm/libdm-common.c b/libdm/libdm-common.c
> index d75c704..d587c32 100644
> --- a/libdm/libdm-common.c
> +++ b/libdm/libdm-common.c
> @@ -1443,7 +1443,7 @@ struct node_op_parms {
>   	char *old_name;
>   	int warn_if_udev_failed;
>   	unsigned rely_on_udev;
> -	char names[0];
> +	char names[];
>   };
>   
>   static void _store_str(char **pos, char **ptr, const char *str)
> 
