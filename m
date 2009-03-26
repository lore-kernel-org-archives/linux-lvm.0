Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2QB3a6x029907
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 07:03:36 -0400
Received: from mail-fx0-f180.google.com (mail-fx0-f180.google.com
	[209.85.220.180])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2QB3CHj021536
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 07:03:13 -0400
Received: by fxm28 with SMTP id 28so474683fxm.3
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 04:03:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090326103652.GA13791@us.ibm.com>
References: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
	<20090324130834.GA12309@us.ibm.com>
	<af3e5b60903240904k1894f981yf2072f13a336ae04@mail.gmail.com>
	<20090324161239.GA5322@us.ibm.com>
	<af3e5b60903240922w2d20b063x51b04f738003f98a@mail.gmail.com>
	<20090326103652.GA13791@us.ibm.com>
Date: Thu, 26 Mar 2009 12:03:12 +0100
Message-ID: <af3e5b60903260403t44ef1f12p6ef8832841c2f153@mail.gmail.com>
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

thank you very much, I will try to get this upstream, imho. such a
feature should not be missing.

regards,
Sascha

2009/3/26  <malahal@us.ibm.com>:
> Sascha Thomas Spreitzer [sascha@spreitzer.name] wrote:
>> Can you give me a reference to this patch first? URL?
>
> See the following link. If you read the responses, then you know why it
> is not in upstream yet.
>
> http://permalink.gmane.org/gmane.linux.kernel.device-mapper.devel/2415
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
