Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0000DCF619
	for <linux-lvm@redhat.com>; Wed, 12 Aug 2020 13:32:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3529108C26C
	for <linux-lvm@redhat.com>; Wed, 12 Aug 2020 13:32:54 +0000 (UTC)
References: <1597231111-28086-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <c86aeb1a-f7fd-000b-228d-e43029f25478@suse.com>
Date: Wed, 12 Aug 2020 21:32:40 +0800
In-Reply-To: <1597231111-28086-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] tests: use correct RA size,
	underly dev & delay time.
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

a little more info about my patch.
in one of my test env, system default read_ahead size is 1024 sector (512K), 
which bigger than 128k in test case. which causes _set_dev_node_read_ahead() to deny
to set up RA.

On 8/12/20 7:18 PM, Zhao Heming wrote:
> lvconvert-repair-raid.sh:
> - in some env, the delay=0 is too short to set up env.
> 
> lvcreate-usage.sh:
> - use correct underlying dev for brd & loop devices.
> - read ahead size should equal or bigger than current system value
> 
> read-ahead.sh:
> - use current system ra_size PLUS 128 to set up new ra_size.
>    for detail, refer _set_dev_node_read_ahead in libdm-common.c
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   test/shell/lvconvert-repair-raid.sh |  2 +-
>   test/shell/lvcreate-usage.sh        | 11 ++++++-----
>   test/shell/read-ahead.sh            |  6 ++++--
>   3 files changed, 11 insertions(+), 8 deletions(-)
> 
