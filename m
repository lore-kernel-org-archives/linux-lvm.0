Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P8xkuA004345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 04:59:46 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 0287881108
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 08:59:44 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.04) id 57173F4D004102FF for linux-lvm@redhat.com;
	Mon, 25 Apr 2016 10:59:42 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Apr 2016 10:59:41 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <571B350F.9050708@assyoma.it>
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com> <571B350F.9050708@assyoma.it>
Message-ID: <c01a4d679e96185c56352648cb6159fc@assyoma.it>
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

Il 23-04-2016 10:40 Gionatan Danti ha scritto:
> On 22/04/2016 16:04, Zdenek Kabelac wrote:
>> 
>> 
>> I assume you miss newer kernel.
>> There was originally this bug.
>> 
>> Regards
>> 
>> Zdenek
> 
> Hi Zdenek,
> I am running CentOS 6.7 fully patched, kernel version 
> 2.6.32-573.22.1.el6.x86_64
> 
> Should I open a BZ report for it is RH aware of the problem on 
> RH/CentOS 6.7?
> 
> Thanks.

Hi,
sorry for the bump, by I really like to understand if current RHEL6 and 
RHEL7 kernels are affected by this serious bug and, if it is the case, 
if Red Hat is aware of that.

I understand this is not the better place to ask about a specific 
distribution, but I see many RedHat peoples here ;)

If this really is the wrong place, can someone point me to the right one 
(RH Bugzilla?).
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
