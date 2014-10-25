Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PIgYeL014032
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 14:42:34 -0400
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9PIgWcq000542
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 14:42:33 -0400
Received: by mail-qc0-f170.google.com with SMTP id l6so2177577qcy.15
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 11:42:32 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Sat, 25 Oct 2014 22:42:17 +0400
Message-ID: <CACaajQtzutH0RBJK0FhqfFeU=U1ajDmO-qcUA2nXwxTBqgkYaA@mail.gmail.com>
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
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
Content-Transfer-Encoding: 7bit
To: Vasiliy Tolstov <v.tolstov@selfip.ru>
Cc: device-mapper development <dm-devel@redhat.com>, LVM <linux-lvm@redhat.com>

2014-10-25 22:41 GMT+04:00 Vasiliy Tolstov <v.tolstov@selfip.ru>:
>> Which version of lvm2 and kernel is here in use ?
>>
>> Have you been manipulating with  thin-pool's metadata in any way ?
>>


I'm use 3.10.55 kernel and lvm 2.02.106

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
