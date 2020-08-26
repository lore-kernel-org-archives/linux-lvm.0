Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA061112878
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 15:58:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B74EB901842
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 15:58:41 +0000 (UTC)
References: <1598457044-28853-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <f11acccc-4974-cad4-d6ad-1b074e0a62ee@suse.com>
Date: Wed, 26 Aug 2020 23:58:26 +0800
In-Reply-To: <1598457044-28853-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvdisplay: dispaly correct status on linear
	type
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

Same as the commit writing, this commit is code enhancement not bugfix.

Last commit 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571 had been verified by one of suse customer.
They did test for types: mirror, raid0, raid1, raid5, linear.

For this commit, I only verified linear & raid cases. I have little experience with type: snapshot, thin, vdo, cache etc. So I am not sure whether this commit contains any bug when LV type is not linear & raid.


On 8/26/20 11:50 PM, Zhao Heming wrote:
> It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
> 1d0dc74f9147 only supports all raid type, this commit adds linear type.
> 
> With this patch, for linear type LV, one of two disks missing,
> lvdisplay will show
> from:
>    LV Status              available (partial)
> to:
>    LV Status              NOT available (partial)
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   lib/display/display.c            |  7 ++-
>   lib/metadata/lv_manip.c          | 76 ++++++++++++++++++++++++++++++++
>   lib/metadata/metadata-exported.h |  1 +
>   lib/metadata/segtype.h           |  1 -
>   lib/raid/raid.c                  | 54 -----------------------
>   5 files changed, 80 insertions(+), 59 deletions(-)
