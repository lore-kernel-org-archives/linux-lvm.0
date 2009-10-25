Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9P8kR80023472
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 04:46:27 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9P8kBWi019642
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 04:46:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id BB26886F25
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 09:46:10 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 0veKyZPKRoTf for <linux-lvm@redhat.com>;
	Sun, 25 Oct 2009 09:46:10 +0100 (CET)
Date: Sun, 25 Oct 2009 09:46:10 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
Message-ID: <20091025084610.GA737@maude.comedia.it>
References: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Oct 24, 2009 at 07:04:49PM +0200, brem belguebli wrote:
>It's non sense arguing that LVM is not intended for root due to the
>fact that you cannot shrink it  (growing online is operational and
>works fine).
>
>This is the only thing that is not allowed, though technically could
>it be possible.
>
Online shrinking is more difficult to achieve than online growing, and
is much less frequently needed, it usually happens due to bad planning.
I know some filesystem on different oses (namely vxfs) and btrfs on linux
allow online shrinking, ext3/4 and xfs don't.

The argument i find very difficult to grasp is what's so critical about
root filesystem versus other filesystems
If your server is (i.e.) a database server you will feel the filesystem
holding the database data is as critical as the root filesystem, if you
need to unmount that you might as well reboot. And the probability of
having to touch the data filesystem is much higher than that of having
to touch root.

Also the argument that the server is in a colo miles away is nonsense,
if it is a critical system it should have some means of oob management,
most server vendors offer those as standard components.

L.


-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
