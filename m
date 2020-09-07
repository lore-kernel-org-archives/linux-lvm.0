Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070BC2018088
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 14:32:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9859C856DF1
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 14:32:54 +0000 (UTC)
References: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
	<6b1c4f75-37ee-caa9-623a-363a8e791e4d@suse.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <53a24f12-9f5e-535d-bf80-83b9db9259c6@gmail.com>
Date: Mon, 7 Sep 2020 16:32:47 +0200
MIME-Version: 1.0
In-Reply-To: <6b1c4f75-37ee-caa9-623a-363a8e791e4d@suse.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: teigland@sourceware.org, zkabelac@redhat.com

Dne 05. 09. 20 v 11:08 heming.zhao@suse.com napsal(a):
> 
> 
> On 9/5/20 5:06 PM, Zhao Heming wrote:
>> report LV is usable for upper layer.
>>
>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>> ---
>>    lib/activate/activate.h          |   2 +
>>    lib/activate/dev_manager.c       |  67 ++++++++++++++++
>>    lib/metadata/metadata-exported.h |   1 +
>>    lib/metadata/metadata.c          | 130 +++++++++++++++++++++++++++++++
>>    lib/report/columns.h             |   1 +
>>    lib/report/properties.c          |   2 +
>>    lib/report/report.c              |  13 ++++
>>    lib/report/values.h              |   1 +
>>    8 files changed, 217 insertions(+)
>>
> 
> my test result:
> 
> ## linear
> 

Hi

We will need to take closer look  - the patchset itself is not going in right 
direction - since all the info about missing or present devices is already
available within lvm engine and we want to minimize 'repeated' query
(ideally all the information should be checked only once - otherwise
the decision state-machine is producing random-end result garbage - which
is the very hard to trace and debug.

So all the code which is doing runtime query again can't be accepted.

Next main rule is - we cache status values whenever possible - so there
should be at most  1 'status' per device per LV - but since lvm2 already
knows from scanning point and from metadata parsing which device is missing
the logic of evaluation of LV's usability needs to be based on these values.

But I think we also need some per-segment methods evaluating usability.

Regards

Zdenek
