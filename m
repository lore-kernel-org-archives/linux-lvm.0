Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3920E2166B2C
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2019 08:23:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 306BB8012D3
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2019 08:23:03 +0000 (UTC)
From: Daniel Janzon <daniel.janzon@edgeware.tv>
Date: Mon, 16 Dec 2019 08:22:56 +0000
Message-ID: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABF8FDE@EX01.edgeware.tv>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

> From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
>>On 12/7/19 11:44 PM, John Stoffel wrote:
>> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
>> single thread for RAID5 is a big bottleneck.

>Perhaps set "/sys/block/mdx/md/group_thread_cnt" could help here,

Now I finally had a chance to test this. It turns out to work great! It's not as fast as a non-raided linearly allocated LVM volume (about half of performance without getting a fat tail of high read/write response time). So there is a price for redundancy but that is worth it in my application. It's now up there in the same magnitude.

Thanks a lot Guoqing! You really helped me a lot here. I'd also like to thank John Stoffel for valuable input.
