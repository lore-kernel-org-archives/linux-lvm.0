Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0ED5ED156
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 09:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 623C98ADCDB
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 09:11:47 +0000 (UTC)
From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 10 Dec 2019 09:11:31 +0000
Message-ID: <038dd990-4d78-082a-da5c-f1be498da2fb@suse.com>
References: <9fdc2f47-a4db-f472-e1eb-424f6a6b28d9@suse.com>
	<b43b63a0-440f-3270-aeb5-dd8cf99ffcf0@redhat.com>
	<efb74841-6424-aa2d-0067-019b31240bd8@suse.com>
	<47ab183b-3a61-24f1-77e8-1d3aa2cf3c29@redhat.com>
	<b554a2f4-5157-d2be-6a36-2ed9aa787e55@suse.com>
	<5e05b9df-c18b-64f9-6e4f-19f33ad01d1a@redhat.com>
In-Reply-To: <5e05b9df-c18b-64f9-6e4f-19f33ad01d1a@redhat.com>
Content-Language: en-US
Content-ID: <56895210DCBC5D478228D3C2886F864C@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] It looks wrong for the timeout when lvm test running
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hello Zdenek,

I got your point, thank you for your explanation.


On 12/10/19 5:03 PM, Zdenek Kabelac wrote:
> Dne 10. 12. 19 v 4:23 Heming Zhao napsal(a):
>> Hello Zdenek,
>>
>> Thank you for your feedback.
>> When I switched to ramdisk backend devices, the time consuming is about 9s.
>>
>> I raised this topic for there may have a bug in timeout related codes,
>> not for why the snapshot-merge.sh costs too much time.
>>
>> The code in below overwrite silent_start when select() successfully return.
>> ```
>> ����������� if ( select( nfds, &set, NULL, NULL, &wait ) > 0 ) {
>> ��������������� silent_start = end; /* something happened */ <====== this line!
>> ��������������� io.sync( false );
>> ����������� }
>> ```
> 
> Hi
> 
> This is intentional - the idea of this 'timeout' is - that during the timeout period there is no progress on output (i.e. for 180s there was nothing printed - which likely means something got locked - there is also secondary limitation
> on number of output lines - so if something is doing endless printing loop,
> it's also catched before it fill all disk spaces on testing machine... - hopefully this explains� 'something happened'� comment.
> 
> In general we don't have strict 'limit' for test length in time - although if test takes 10 minutes - it's likely not what was intended - but we don't have that rule on individual test time as speed often largely depends on machine performance.
> 
> Zdenek
> 
