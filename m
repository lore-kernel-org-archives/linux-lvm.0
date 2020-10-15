Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0981227930
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 15:05:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D0D857D15
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2020 15:05:56 +0000 (UTC)
References: <b482a655-342c-86f9-085d-e09a1ffe8bb0@suse.com>
	<20200720175416.GB8135@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <5b0ded0a-8fda-96e1-1582-f2dbf7a91e2e@suse.com>
Date: Thu, 15 Oct 2020 23:05:38 +0800
In-Reply-To: <20200720175416.GB8135@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Suggestion: lvm2 filters lib needs to show some
 readable info for end user
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Hello David,

I don't know why I could use "git show 1fa48ba9d60ad34c5957b80024ef660ffb11161f" to 
see your patch, but I can't find the commit in "git log" output (in master branch).
And the related code also doesn't be changed in master branch.

Thanks.

On 7/21/20 1:54 AM, David Teigland wrote:
> On Mon, Jul 20, 2020 at 07:02:15PM +0800, heming.zhao@suse.com wrote:
>> So, in my opinion, I suggest there should be some code improvement for
>> all filter failed info. Some filter failed debug log should convert from
>> debug level to standard output level.
> 
> Yes, that's long standing annoyance, and it's simple to fix.  Added that
> in the branch below, but it needs some tests, and it should probably be
> used in some more places.
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-filter-reason
> 
