Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3S74ctt024189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 03:04:38 -0400
Received: from kenny.mojhosting.sk (mail-o.oneemedia.com [92.240.244.203])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 347A16541F
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 07:04:37 +0000 (UTC)
Date: Thu, 28 Apr 2016 08:46:35 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <1887620796.20160428084635@marki-online.net>
In-Reply-To: <00055903b32b7728a6f681ead15b39ca@dds.nl>
References: <518072682.2617983.1461760017772.JavaMail.yahoo.ref@mail.yahoo.com>
	<518072682.2617983.1461760017772.JavaMail.yahoo@mail.yahoo.com>
	<00055903b32b7728a6f681ead15b39ca@dds.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Xen <list@xenhideout.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello Xen,

Wednesday, April 27, 2016, 23:28:31, you wrote:

> The real question you should be asking is if it increases the monitoring
> aspect (enhances it) if thin pool data is seen through the lens of the
> filesystems as well.

> Beside the point here perhaps. But. Let's drop the "real sysadmin" 
> ideology. We are humans. We like things to work for us. "Too easy" is 
> not a valid criticism for not having something.

As far as I know (someone correct me) there is no mechanism at all in
kernel for communication from lower fs layers to higher layers -
besides exporting static properties like physical block size. The
other way (from higher layer like fs to lower layers works fine - for
example discard support).

So even if what you are asking might be valid, it isn't as simple as adding
some parameter somewhere and it would magically work. It is about
inventing and standardizing new communication system, which would of
course work only with new versions of all the tools involved.

Anyway, I have no idea what would filesystem itself do with information
that no more space is available. Also this would work only for lvm
thin pools, not for thin provision directly from storage, so it would
be a non-consistent mess. Or you would need another protocol for
exporting thin-pool related dynamic data from storage (via NAS, SAN,
iSCSI and all other protocols) to the target system. And in some
organizations it is not desirable at all to make this kind of
information visible to all target systems / departments.

What you are asking can be done for example directly in "df" (or you
can make a wrapper script), which would not only check the filesystems
themselves, but also the thin part and display the result in whatever
format you want.

Also displaying real thin free space for each fs won't be "correct".
If I see 1 TB free in each filesystem and starting writing, by the
time I finish, those 1 TB might be taken by the other fs. So
information about current free space in thinp is useless for me, as in
1 minute it could be totally different number.


-- 
  bYE, Marki
