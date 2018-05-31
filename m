Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7706A600C9
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 01:54:06 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D2AC3BB826
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 01:54:04 +0000 (UTC)
Message-Id: <5B0F55B3020000F90001FBAE@prv1-mh.provo.novell.com>
Date: Wed, 30 May 2018 19:53:55 -0600
From: "Gang He" <ghe@suse.com>
References: <5B0E6D96020000F90001F644@prv1-mh.provo.novell.com>
	<c7364072-150e-e3ea-3eda-01c601729758@redhat.com>
In-Reply-To: <c7364072-150e-e3ea-3eda-01c601729758@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove does not work at all with version 2.02.177(2)
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

Ok, I will try.

Thanks
Gang

>>> On 5/30/2018 at 10:12 pm, in message
<c7364072-150e-e3ea-3eda-01c601729758@redhat.com>, Zdenek Kabelac
<zkabelac@redhat.com> wrote:
> Dne 30.5.2018 v 11:23 Gang He napsal(a):
>> Hello List,
>> 
>> As you know, I ever reported that lvcreate could not create a mirrored LV, 
> the root cause is a configure building item "--enable-cmirrord" was missed.
>> Now, I encounter another problem, pvmove does not work at all.
>> The detailed information/procedure is as below,
> 
> 
> Hi
> 
> Can you try to compile 2.02.178 ?
> 
> I believe there were some more fixes for reworked pvmove locking.
> 
> Regards
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
