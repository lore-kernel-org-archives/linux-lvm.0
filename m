Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OG4ZHF016126
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 12:04:35 -0400
Received: from mail-bw0-f170.google.com (mail-bw0-f170.google.com
	[209.85.218.170])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2OG46Vu018270
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 12:04:07 -0400
Received: by bwz18 with SMTP id 18so2230408bwz.3
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:04:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090324130834.GA12309@us.ibm.com>
References: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
	<20090324130834.GA12309@us.ibm.com>
Date: Tue, 24 Mar 2009 17:04:06 +0100
Message-ID: <af3e5b60903240904k1894f981yf2072f13a336ae04@mail.gmail.com>
Subject: Re: [linux-lvm] lvm mirror read performance, no load balance with PV 
	?
From: Sascha Thomas Spreitzer <sascha@spreitzer.name>
Content-Transfer-Encoding: 8bit
Reply-To: sascha@spreitzer.name,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Malahal,

I'm impressed, are there any reasons this patch has not been committed yet?

regards,
Sascha

2009/3/24  <malahal@us.ibm.com>:
> Sascha Thomas Spreitzer [sascha@spreitzer.name] wrote:
>> Hello mailing list,
>>
>> I currently sensed that LVM2 is not load balancing reads of mirrored
>> LV's form their corresponding PV.
>
> Yes, it just reads from the default_mirror (i.e. primary mirror leg).
> There is a read-balancing patch. It is not upstream yet and most likely
> not there in your kernel either.
>
> Thanks, Malahal.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Mit freundlichen Gr��en, / with kind regards,
Sascha Thomas Spreitzer
http://spreitzer.name/
