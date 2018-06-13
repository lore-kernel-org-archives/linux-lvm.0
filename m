Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F05390C5E
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2018 02:14:25 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A529820E9
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2018 02:14:24 +0000 (UTC)
Message-Id: <5B207DF9020000F900022B0E@prv1-mh.provo.novell.com>
Date: Tue, 12 Jun 2018 20:14:17 -0600
From: "Gang He" <ghe@suse.com>
References: <5B1F8BE7020000F90002293C@prv1-mh.provo.novell.com>
	<20180612142219.ixpzqxqws3qiwqbm@reti>
In-Reply-To: <20180612142219.ixpzqxqws3qiwqbm@reti>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Some questions about the upcoming LVM v2_02_178
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

Hello Joe,


>>> On 2018/6/12 at 22:22, in message <20180612142219.ixpzqxqws3qiwqbm@reti>, Joe
Thornber <thornber@redhat.com> wrote:
> On Tue, Jun 12, 2018 at 03:01:27AM -0600, Gang He wrote:
>> Hello List,
>> 
>> I saw there was a tag "v2_02_178-rc1" for LVM2, then I have some questions 
> about  the upcoming LVM v2_02_178.
>> 1) Will there be the version v2_02_178 for LVM2? since I saw some text about 
> Version 3.0.0 in the git change logs.
> 
> Yes there will be.  We've had no bug reports for the -rc, so the final
> release will be the same as the -rc.
Between LVM2 v2_02_178-rc1 and  LVM2 v2_02_177, 
there will not be any components/features remove, except include some bug fixes, right?

Thanks a lot.
Gang 

> 
>> 2) For the next LVM2 version, which components will be affected? since I saw 
> that clvmd related code has been removed.
> 
> We've decided to bump the version number to 3.0.0 for the release
> *after* 2.02.178.  This change in version number indicates the *start*
> of some large changes to lvm.
> 
> Obviously the release notes for v3.0.0 will go into this more.  But,
> initially the most visible changes will be removal of a couple of
> features:
> 
> clvmd
> -----
> 
> The locking required to provide this feature was quite pervasive and
> was restricting the adding of new features (for instance, I'd like to
> be able to allocate from any LV not just PVs).  With Dave Teigland's
> lvmlockd I think the vast majority of use cases are covered.  Those
> that are wedded to clvmd can continue to use LVM2.02.*
> 
> Also, testing cluster software is terribly expensive, we just don't
> have the resources to provide two solutions.
> 
> lvmapi
> ------
> 
> This library has been deprecated for a while in favour of the dbus api.
> 
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
