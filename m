Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F9C60BF4
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 05:56:07 +0000 (UTC)
Received: from prv-mh.provo.novell.com (prv-mh.provo.novell.com
	[137.65.248.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6672D5D68A
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 05:56:04 +0000 (UTC)
Message-Id: <5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
Date: Mon, 26 Mar 2018 23:55:57 -0600
From: "Gang He" <ghe@suse.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
In-Reply-To: <CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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

Hi Fran,


>>> 
> On 26 March 2018 at 08:04, Gang He <ghe@suse.com> wrote:
>> It looks like each PV includes a copy meta data for VG, but if some PV has 
> changed (e.g. removed, or moved to another VG),
>> the remained PV should have a method to check the integrity when each 
> startup (activated?), to avoid such inconsistent problem automatically.
> 
> Your workflow is strange. What are you trying to accomplish here?
I just reproduced a problem from the customer, since they did virtual disk migration from one virtual machine  to another one.
According to your comments, this does not look like a LVM code problem, 
the problem can be considered as LVM administer misoperation?

Thanks
Gang   

> 
> Your steps in 5 should be:
> 
> vgreduce vg01 /dev/vdc /dev/vdc
> pvremove /dev/vdc /dev/vdd
> 
> That way you ensure there's no leftover metadata in the PVs (specially
> if you need to attach those disks to a different system)
> 
> Again a usecase to understand your workflow would be beneficial...
> 
> Cheers
> 
> fran
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
