Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD512166BA2
	for <linux-lvm@redhat.com>; Wed, 27 May 2020 03:27:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A281B8007DB
	for <linux-lvm@redhat.com>; Wed, 27 May 2020 03:27:59 +0000 (UTC)
References: <7a26b791-9739-d6dc-1744-7471f3c00af8@suse.com>
	<20200526213048.GA9994@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <1d7d5c07-9280-b762-4778-9e462f3f2c80@suse.com>
Date: Wed, 27 May 2020 10:57:20 +0800
In-Reply-To: <20200526213048.GA9994@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] issue (or bug): when vgremove does removing lvmcache
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Hello David,

very stupid mistake, I used master branch not not latest code to verify this issue.
after switching to latest code, this issue disappeared.

Thank you for your help.

On 5/27/20 5:30 AM, David Teigland wrote:
> On Sat, May 23, 2020 at 10:03:50PM +0800, heming.zhao@suse.com wrote:
>> # vgremove test --force
>>    Logical volume "main" successfully removed
>>    Assertion failed: can't _pv_write non-orphan PV (in VG )
>>    Failed to remove physical volume "/dev/sdb" from volume group "test"
>>    Volume group "test" not properly removed
> 
> That has been fixed, looks like 56aadd7fe2a1d24043ea9d06543c29317ac1cc58,
> although that may have changed since.
> Dave
> 
