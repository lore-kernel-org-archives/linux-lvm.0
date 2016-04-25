Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PFLGux026182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 11:21:16 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97E0C62645
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 15:21:14 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 50F427F48F
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 17:21:12 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Apr 2016 15:21:12 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <20160425134947.GA8148@rh-vpn>
References: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
	<20160425134947.GA8148@rh-vpn>
Message-ID: <c20c27c2d72ebd8ab9521012e1285e2f@dds.nl>
Subject: Re: [linux-lvm] is lvmcache really ready?
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

Joe Thornber schreef op 25-04-2016 13:49:
> On Sat, Apr 23, 2016 at 04:50:01PM +0000, Xen wrote:
>> The reason I'm wanting to use it at this point is to speed up
>> booting (although unimportant) but mostly to make a more snappy
>> system while running, ie. for instance just application startup.
> 
> I doubt it'll speed up booting, which occurs infrequently so dm-cache
> will not have reason to promote those blocks above others.

Thank you. I'm not really concerned with boot speeds, the other person 
was. It depends on how I am going to organize the thing. But it is 
probably going to be used for runtime stuff more.

Especially if the thing fills up I expect boot time information not to 
be in that cache, you're right.

Thanks. You people do inspire some confidence :) ;-) :).

Regards.
