Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF66868725
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 14:08:12 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6450811C0C7
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 14:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id B4AC0420
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 16:08:07 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id FtT5bFttjkBR for <linux-lvm@redhat.com>;
	Mon, 14 Aug 2017 16:08:07 +0200 (CEST)
Received: from [192.168.178.44] (p508022D7.dip0.t-ipconnect.de [80.128.34.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 680A341F
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 16:08:07 +0200 (CEST)
References: <4b4d346e-9ace-9091-f24e-c9342ed68ad5@mglug.de>
	<c244050a-d5c7-1382-d115-77a1a4fc2959@redhat.com>
From: Oliver Rath <rath@mglug.de>
Message-ID: <2ad15926-04d1-9a68-f4d3-ae3cc4531553@mglug.de>
Date: Mon, 14 Aug 2017 16:08:06 +0200
MIME-Version: 1.0
In-Reply-To: <c244050a-d5c7-1382-d115-77a1a4fc2959@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] SOLVED [ was Re: logical "and" connection of lvm-tags? ]
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

Hi Peter,

thank you very much! This solves completely my issue!

Regards,

Oliver



On 14.08.2017 08:59, Peter Rajnoha wrote:
> On 08/13/2017 09:44 AM, Oliver Rath wrote:
>> Hi list,
>>
>> Im playing around with lvm-Tags and would find it quite useful for
>> sorting lvms.
>>
>> Now I tried the following
>>
>> root@w541:~# lvchange --addtag @foo levg/t1
>>   Logical volume levg/t1 changed.
>> root@w541:~# lvchange --addtag @foo levg/t3
>>   Logical volume levg/t3 changed.
>> root@w541:~# lvchange --addtag @bar levg/t2
>>   Logical volume levg/t2 changed.
>> root@w541:~# lvchange --addtag @bar levg/t3
>>   Logical volume levg/t3 changed.
>> root@w541:~# lvs -o lv_name @foo
>>   LV 
>>   t1 
>>   t3 
>> root@w541:~# lvs -o lv_name @bar
>>   LV 
>>   t2 
>>   t3 
>> root@w541:~# lvs -o lv_name @foo @bar
>>   LV 
>>   t1 
>>   t2 
>>   t3 
>> root@w541:~# lvs -o lv_name @foo \& @bar
>>   LV 
>>   t1 
>>   t2 
>>   t3 
>> root@w541:~# lvs -o lv_name @foo and @bar
>>   LV 
>>   t1 
>>   t2 
>>   t3 
>>
>> You see, i want to list all lvms which have @foo *and* @bar tags
>> included. Is this possible? I didnt found anything about combining in
>> the man pages.
> Hi,
>
> you can use -S|--select option:
>
>   lvs -o lv_name -S 'tags=[foo,bar]'
>
> See also "man 7 lvmreport" and the "Selection" section there for more
> info, there also a help on how to use selection with string lists.
>
