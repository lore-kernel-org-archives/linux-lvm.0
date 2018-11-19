Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6406012B
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 08:55:10 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 239293DE04
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 08:55:09 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wAJ8t76R027753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 09:55:07 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Nov 2018 09:55:07 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <20181117002405.GF5291@agk-dp.fab.redhat.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<20181117002405.GF5291@agk-dp.fab.redhat.com>
Message-ID: <25b87d17a683075e57f45422ee3ef7f6@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

On 2018-11-17 01:24, Alasdair G Kergon wrote:
> On Fri, Nov 16, 2018 at 02:43:10PM +0100, Christoph Pleger wrote:
>> I get security by checking the real user id at the beginning of the
>> program and aborting the program if that uid does not belong to the 
>> only
>> user who is allowed to run the program.
> 
> Sounds familiar.  Shall I tell you one of those stories?
> ...
> ...
> ...

My program calls getpwuid() with the real user id of the calling user 
and then compares this user's name with the name of the one and only 
user who is allowed to continue program execution. Do you think that 
this can be circumvented?

Regards
   Christoph
