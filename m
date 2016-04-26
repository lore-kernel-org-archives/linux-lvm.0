Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3Q7EuPp020560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 03:14:56 -0400
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id CF17162645
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 07:14:54 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.04) id 571739DD004B47B4 for linux-lvm@redhat.com;
	Tue, 26 Apr 2016 09:12:04 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 33D56267226
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 09:12:02 +0200 (CEST)
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com> <571B350F.9050708@assyoma.it>
	<c01a4d679e96185c56352648cb6159fc@assyoma.it>
	<571DE943.40204@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <571F14B9.8020706@assyoma.it>
Date: Tue, 26 Apr 2016 09:11:53 +0200
MIME-Version: 1.0
In-Reply-To: <571DE943.40204@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing ThinLVM metadata exhaustion
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

> bugzilla.redhat.com
>
> Anyway - 6.8 will likely be your solution.
>
> Thin-provisioning is NOT supposed to be used at 'corner' cases - we
> improve them, but older version simply had more of them as there was
> always clearly communicated do not over-provision if you can't provide
> the space.
>
> Out-of-space  is not equal if you run out of your filesystem space - you
> can't expect things will continue to work nicely - the cooperation of
> block layer with filesystem and metadata resilience are continually
> improved.
>
> We have actually even seen users 'targeting' to hit full-pool as a part
> of regular work-flow - bad bad plan...
>
> Regards
>
> Zdenek

[reposting due to sender error]

Hi Zdenek,
thanks for your courtesy.

I absolutely agree with you that in no case metadata exhaustion can be 
considered part of a "regular work-flow". At the same time, I often do 
"stress test" specifically crafted to put the software/hardware in the 
worst possible condition. In this manner, should an exceptionally bad 
situation occour, I know how to deal with it.

I have another question: does this bug only happen when metadata space 
is exausted? I am asking this because searching for other peoples with 
the same error message, I read this bug report: 
http://www.redhat.com/archives/dm-devel/2014-March/msg00021.html

The bug described in the message above does not necessarily happen at 
metadata exaustion time, as confirmed here: 
https://bugzilla.kernel.org/show_bug.cgi?id=68801

I understand that these are old (2014) bugs and that were fixed in Linux 
3.14 but, using thin LVM volumes in production systems (albeit with RH 7 
only), I want to be reasonably sure that no show-stopper bug can hit me. 
Are current RH OSes (6.7 and 7.2) immune from this bug (metadata 
corruption even if tmeta is not full)?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
