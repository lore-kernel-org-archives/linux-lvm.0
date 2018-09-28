Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4553091391
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 16:59:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6570330024FE
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 16:59:58 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x24-v6so5497608lfe.10
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 09:59:58 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <aeb589e0-e70d-44bd-a74c-bc59202f7e50@9livesdata.com>
References: <aeb589e0-e70d-44bd-a74c-bc59202f7e50@9livesdata.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Fri, 28 Sep 2018 10:59:55 -0600
Message-ID: <CAJCQCtS1B088K1k=SLTbs34+nfD_PZWF738VROZyyb9EYX1h1A@mail.gmail.com>
Subject: Re: [linux-lvm] snapshot looses origin when other snapshot is
 merged to the same origin
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

On Fri, Sep 28, 2018 at 6:57 AM, Zbigniew Kostrzewa
<kostrzewa@9livesdata.com> wrote:
> Hi,
>
> I have a question related to multiple snapshots of the same thin volume. My
> scenario is that I create a thin pool, a thin volume and two snapshots of
> that thin volume. Both snapshots have the thin volume set as the origin
> volume. However, after I merge one of the snapshots to the origin then the
> second snapshot looses information about the origin.
>
> The question is if that is an expected behavior or if I am doing something
> wrong? Is there a way to make the second snapshot keep having the origin
> with merged first snapshot as its origin?

What file system are you using? And what lvm commands are you using
for all of this?

Someone else will have to answer the merging question, as it's not
something I've ever used or expect to use with thin volumes. Merging,
to me, sounds like a thick volume snapshots convention.

With thin volumes, each snapshot, even though it initially points to
an origin, is it's own completely independent volume. Given a thin
volume A, and snapshots created with 'lvcreate -s vg/A -n B' and
'lvcreate -s vg/A -n C' my experience is that A B C are initially
identical, and modifying A does not change B or C. Modifying B does
not change A or C. Modifying C does not change A or B.

By default, thin volume snapshots are not active volumes. So they're
not mountable. And once two or more are active, there's the potential
for confusion because you have literally two file systems that are
identical as far as the kernel is concerned. They have identical
volume UUIDs. I know XFS will refuse to mount a 2nd volume with the
same UUID as an already mounted file system; and while this can be
inhibited at mount time, I do not know the consequences.



-- 
Chris Murphy
