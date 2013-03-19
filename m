Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2JHgEbQ028215
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 13:42:14 -0400
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JHgB2I021018
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 13:42:12 -0400
Received: from [192.168.1.100] (mm-115-125-214-37.dynamic.pppoe.mgts.by
	[37.214.125.115] (may be forged)) (authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	r2JHgALA027927
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 18:42:11 +0100
Message-ID: <5148A372.6050402@hoster-ok.com>
Date: Tue, 19 Mar 2013 20:42:10 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<20130319164224.GI20480@agk-dp.fab.redhat.com>
In-Reply-To: <20130319164224.GI20480@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 00/10] Enhancements to a clustered logical
 volume activation
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

19.03.2013 19:42, Alasdair G Kergon wrote:
> So what I need is:
> 
> Separate out the fixes and minor changes that have no effect on support or
> introduce new constraints on future changes.  Get those out of the way.
> 
> Then with what's left, sort out the impact in terms of additional support,
> testing, constraints etc.  Then work out what the options are.
> E.g. we support multiple lock managers.  How do your changes affect
> each of these, including sanlock?
> 
> New features should only be available where they are tested and supported:
> if some combination doesn't make sense or won't be tested properly, don't allow
> that combination.  In extreme cases, use configure settings as the method of
> control (e.g. if a distro decided it didn't want --node that would need to be a
> configure option).  Man pages need to be correct - if an option doesn't work
> with some lock manager, it should say that (or not mention it if under
> configure's control).

Ok.

Do you have any opinion of features themselves or a way they implemented
(as if subject had [RFC} in it)?
