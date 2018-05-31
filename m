Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF75430012C3
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 01:39:05 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B01330C0223
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 01:39:04 +0000 (UTC)
Message-Id: <5B0F522F020000F90001FB9F@prv1-mh.provo.novell.com>
Date: Wed, 30 May 2018 19:38:55 -0600
From: "Gang He" <ghe@suse.com>
References: <20180525070342.g247jatvm6dskehy@reti>
	<5B07BF2B020000F90001E5BB@prv1-mh.provo.novell.com>
	<80318f1a-2b2e-9d0f-ae16-3b1eb0af2740@redhat.com>
In-Reply-To: <80318f1a-2b2e-9d0f-ae16-3b1eb0af2740@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [RELEASE] 2.02.178
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

Hi Marian,

Thank for your explanation, I will try 2.02.178.

Thanks
Gang

>>> On 5/30/2018 at  6:42 pm, in message
<80318f1a-2b2e-9d0f-ae16-3b1eb0af2740@redhat.com>, Marian Csontos
<mcsontos@redhat.com> wrote:
> On 05/25/2018 09:45 AM, Gang He wrote:
>> Hello Joe,
>> 
>> When will the formal LVM 2.02.178 be released?
> 
> Within two weeks. I have pushed the RC1 to rawhide, and unless problems 
> are reported, we will be releasing shortly.
> 
>> In LVM2.02.178, online pvmove can work well under the cluster environment?
> 
> Yes, the clustered pvmove issues are fixed in 2.02.178.
> 
> You need either:
> - exclusive activation,
> - wait for 2.02.178,
> - or patch .177
> 
> -- Marian
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
