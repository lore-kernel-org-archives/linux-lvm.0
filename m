Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52JW72g024255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 15:32:07 -0400
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B618CD7FE2
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 19:32:06 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a136so245108429wme.0
	for <linux-lvm@redhat.com>; Thu, 02 Jun 2016 12:32:06 -0700 (PDT)
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
	<1464821577.13773.9.camel@interlinx.bc.ca>
	<c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
	<1464864575.13773.29.camel@interlinx.bc.ca>
	<6504f4cb-8f17-390a-ec9f-0cc6826b23ec@gmail.com>
	<1464895638.13773.54.camel@interlinx.bc.ca>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <d9f7a51d-01c1-9761-9963-6dac9152138d@gmail.com>
Date: Thu, 2 Jun 2016 21:32:03 +0200
MIME-Version: 1.0
In-Reply-To: <1464895638.13773.54.camel@interlinx.bc.ca>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 2.6.2016 v 21:27 Brian J. Murrell napsal(a):
> On Thu, 2016-06-02 at 14:15 +0200, Zdenek Kabelac wrote:
>> Yep that might explain 'missing' surrouding details...
>> Basically any write might result in thin-pool running out of
>> threshold
>> and requireing new space
>
> Ahhh.  I was wondering if the resize in question could be some kind of
> implicit resizing done by the "hidden" thin-pool maintenance.  I'm
> fairly sure he knows zilch about LVM and resizing.  :-)
>

When lvm.conf  has defined thin_pool_autoextend_threshold <100% the pool is 
automatically monitored and resized when threshold is crossed.


>>  - what's unclear is the later failure which
>> would be really good to know....
>
> Is there anything in particular I can look for in the logs that would
> indicate when this implicit resizing was happening to look for other
>

If you spot any 'device-mapper' errors on May 25 in kernel log....

activity that might have caused a problem?
>
>> Ops  - so once again ;)
>
> Cheers.  :-)
>
> b.
>

Zdenek
