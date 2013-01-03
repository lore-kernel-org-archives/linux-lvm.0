Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r03K4bwE001585
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 15:04:37 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r03K4aoZ011757
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 15:04:36 -0500
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r03K4ZsK002335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 15:04:35 -0500
Message-ID: <50E5E453.6080409@bmsi.com>
Date: Thu, 03 Jan 2013 15:04:35 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
	<50E55AFD.1040807@redhat.com>
In-Reply-To: <50E55AFD.1040807@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot causing segault
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
To: linux-lvm@redhat.com

On 01/03/2013 05:18 AM, Zdenek Kabelac expounded in part:
>
>> So my question is: is creating the snapshot volume with a size larger 
>> than the
>> target volume inducing segfaults randomly or could there be another 
>> problem
>> lurking? If these weren't production machines I would normally just 
>> go with a
>> size smaller than the target but I really need to be sure what 
>> exactly is
>> causing the segfaults.
>>
>> Any help would be appreciated.
>
>
> Any special reason to use lvm2 from the year 2006 in the year 2013 ?
> There is no big point in fixing some particular bugs any many years 
> obsoleted source code.
>
> Can you try to use/rebuild more recent version?
Upgrading production systems can be expensive - hence the value of paid 
long term support contracts.  I don't think he is asking to fix it - 
just to confirm that it is an LVM bug, which could make upgrading more 
attractive, or make the workaround (of ensuring snapshot size <= source 
size) acceptable.
