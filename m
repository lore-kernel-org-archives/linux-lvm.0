Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D28F1C67
	for <linux-lvm@redhat.com>; Thu, 20 Aug 2020 16:08:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33F48101A540
	for <linux-lvm@redhat.com>; Thu, 20 Aug 2020 16:08:19 +0000 (UTC)
References: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <9f3a983b-178e-4dd8-a4b1-1dce7a6871e4@suse.com>
Date: Fri, 21 Aug 2020 00:08:01 +0800
In-Reply-To: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

more info or discussion with this patch.

I met this compiling issue when I was creating openSUSE package.
I'm a little confused & wonder why Fedora can pass this gcc warning.

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
