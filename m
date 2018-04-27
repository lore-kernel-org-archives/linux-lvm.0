Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFFA85DD7C
	for <linux-lvm@redhat.com>; Fri, 27 Apr 2018 06:30:24 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80EB980C2C
	for <linux-lvm@redhat.com>; Fri, 27 Apr 2018 06:30:17 +0000 (UTC)
Message-Id: <5AE333F2020000F9000B8E23@prv1-mh.provo.novell.com>
Date: Fri, 27 Apr 2018 00:30:10 -0600
From: "Gang He" <ghe@suse.com>
References: <CAGmFzSc8a8TZq7LtTuwwA+zrKmgQ722KubjHBeu4M2WW2KAZew@mail.gmail.com>
	<5AE1A4F4020000F9000B8935@prv1-mh.provo.novell.com>
	<9682b67b-9a2b-e387-23f7-0ec1bbbb5309@redhat.com>
In-Reply-To: <9682b67b-9a2b-e387-23f7-0ec1bbbb5309@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Pvmove can work on cluster with LVM 2.02.120(2)
 (2015-05-15), or not?
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

Hello Zdenek,

Thank for your reply.
As you said some days ago, you will release LVM 2.02.178,
which will be a stable version? include some PVmove bug fixes?


Thanks
Gang


>>> 
> Dne 26.4.2018 v 04:07 Gang He napsal(a):
>> Hello Zdenek,
>> 
>> Do you remember LVM for this version supports PVmove, or not?
>> Since there is a user which is pinging this question.
>> 
> 
> Hi
> 
> lvm2 should be supporting clustered pvmove (in case cmirrord is fully 
> functional on your system) - but I've no idea if you are hitting some old bug 
> 
> or you see some still existing one.
> 
> For reporting bug use some more recent version of tools - nobody is likely 
> really going to hunt bugs in your 3 year old system here...
> 
> 
> Regards
> 
> Zdenek
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
