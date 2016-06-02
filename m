Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u529BQhh005219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 05:11:26 -0400
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94B742FD
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 09:11:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a20so58709396wma.1
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 02:11:24 -0700 (PDT)
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
	<1464821577.13773.9.camel@interlinx.bc.ca>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
Date: Thu, 2 Jun 2016 11:11:21 +0200
MIME-Version: 1.0
In-Reply-To: <1464821577.13773.9.camel@interlinx.bc.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
 expected 809216
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Brian Murrell <brian@interlinx.bc.ca>

Dne 2.6.2016 v 00:52 Brian J. Murrell napsal(a):
> On Tue, 2016-05-31 at 13:22 +0200, Zdenek Kabelac wrote:
>> Hi
>
> Sorry for the delay.  It can be a bugger to get an environment on a
> laptop that won't boot USB devices to a state where you can access the
> PV and store something from it.
>
>> Well - could you post somewhere for download 1st. MB of your
>> PV device?
>>
>> dd if=/dev/sdX of=/tmp/upload_me bs=1M count=1
>
> You should be able to get that from:
>
> http://www.interlinx.bc.ca/~brian/lvm-pv.img
>
>> Have you already tried to restore in some way ?
>
> I have not tried anything yet for fear of making things worse ("angels
> tread" and all that), so this is a blank slate from the point of it
> first failing.

Hi

So it seems your  machine has crashed (you probably know better) during
thin-pool resize operation.

Unfortunately fc23 has lvm2 version 2.02.132 - and version 2.02.133 has 
improvement patch to make the resize more resistent (but still not as good as 
I wish to be).

So what happened -  lvm2 resized _tdata LV - tried to resumed it - and
it has failed along this path - however since the 'resize' is ATM a single 
transaction - the lvm2 rollback reverted to previous size - yet thin-pool
already managed to remembered 'new' bigger size.

So please take a look at your logs (if you have some) if there
is something suspicious to be mentioned (thought if you machined
has freezed, hardly any log will be available).

To get access to your thin-pool - I'm attaching restored metadata content from 
your disk header with 'bigger' _tdata volume.

To restore use:

'vgcfgrestore -f back  --force brianr-laptop'

It would be really interesting to know the reason of failure - but I can 
understand you could hardly obtain.

Regards


Zdenek
