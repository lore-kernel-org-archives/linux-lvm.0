Received: from localhost (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5422C20283A3
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2018 14:22:21 +0000 (UTC)
Date: Tue, 12 Jun 2018 15:22:20 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20180612142219.ixpzqxqws3qiwqbm@reti>
References: <5B1F8BE7020000F90002293C@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B1F8BE7020000F90002293C@prv1-mh.provo.novell.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jun 12, 2018 at 03:01:27AM -0600, Gang He wrote:
> Hello List,
> 
> I saw there was a tag "v2_02_178-rc1" for LVM2, then I have some questions about  the upcoming LVM v2_02_178.
> 1) Will there be the version v2_02_178 for LVM2? since I saw some text about Version 3.0.0 in the git change logs.

Yes there will be.  We've had no bug reports for the -rc, so the final
release will be the same as the -rc.

> 2) For the next LVM2 version, which components will be affected? since I saw that clvmd related code has been removed.

We've decided to bump the version number to 3.0.0 for the release
*after* 2.02.178.  This change in version number indicates the *start*
of some large changes to lvm.

Obviously the release notes for v3.0.0 will go into this more.  But,
initially the most visible changes will be removal of a couple of
features:

clvmd
-----

The locking required to provide this feature was quite pervasive and
was restricting the adding of new features (for instance, I'd like to
be able to allocate from any LV not just PVs).  With Dave Teigland's
lvmlockd I think the vast majority of use cases are covered.  Those
that are wedded to clvmd can continue to use LVM2.02.*

Also, testing cluster software is terribly expensive, we just don't
have the resources to provide two solutions.

lvmapi
------

This library has been deprecated for a while in favour of the dbus api.


- Joe
