Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25F1AB5B9
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 16:16:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 949FD811E76
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 16:16:13 +0000 (UTC)
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
	<4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
	<20200831223724.GB15486@redhat.com>
	<c1796ea2-dcdb-230f-16f7-1d8acf470ed9@suse.com>
	<20200901150713.GB25039@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <bef9939e-0c36-12b6-5911-a62874636d64@suse.com>
Date: Wed, 2 Sep 2020 00:15:56 +0800
In-Reply-To: <20200901150713.GB25039@redhat.com>
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>



On 9/1/20 11:07 PM, David Teigland wrote:
> On Tue, Sep 01, 2020 at 05:09:23PM +0800, heming.zhao wrote:
>> 'broken' is acceptable and good word.
>> I'm only afraid end user don't know there is a new string item for lvs.
>> like me, I just know the lv_health_status string item from Zdenek's mail. (sorry for my stupid)
> 
> I also like Zdenek's "usable", which seems to be closer to what we mean.
> In addition to the reporting field can could be a new letter in the 9th lv
> attr field.  (We'd have to figure out the priority of this letter vs the
> others.)
> 
to add 9th (U)sable for the common case? I think it will overwrite (p)artial when top
layer LV non-usable. otherwise there may have no chance to show this new letter.
Zdenek ever said, He worried about compatibility issues. He preferred to add
'lv_usable' option, not new letter in 9th bit.

>> I prefer lvm report status from the entire LV side.
>> lvm provides virtual blocks to upper layer softwares, most of softwares use whole virtual disk.
> 
> Limit this to what lvm knows already.  The field will represent whether
> lvm believes the uppser layer can successfully do io to the entire LV.
> 
agree

> Dave
> 
