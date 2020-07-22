Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23667F808F
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 08:47:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1141F92490B
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 08:47:14 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id e64so1692809iof.12
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 01:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
	<20200722003954.GJ6740@agk-dp.fab.redhat.com>
	<CALOnQv7BfMKCXVV-ED+884RuxFWCEA0UOE79MqKExXLVn2YDpw@mail.gmail.com>
	<20200722023758.GK6740@agk-dp.fab.redhat.com>
In-Reply-To: <20200722023758.GK6740@agk-dp.fab.redhat.com>
From: L A Walsh <lvm@tlinx.org>
Date: Wed, 22 Jul 2020 01:46:59 -0700
Message-ID: <CALOnQv7xU_eRHHXtBWhsf9k2Yox9eLxAa_9PhNFcmQMxRM81mg@mail.gmail.com>
Subject: Re: [linux-lvm] lvm question regarding start and placement of data
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
To: L A Walsh <lvm@tlinx.org>, linux-lvm@redhat.com

On Tue, Jul 21, 7:38PM,  Alasdair G Kergon wrote
>On Tue, Jul 21, 2020 at 05:47:07PM -0700, L A Walsh wrote:
>> I don't think the tools work on bare disk (or disk images).  This is a
>
>There are ways to do it, but download a recent upstream version and read
>the pvck man page which now has extra analysis facilities.

-----
What version is recent, my distro, SuSE Tumbleweed (rolling distro),
recently put out lvm2-2.03.05, but not seeing how pvck would help
in my situation.

Right now, I have 24 disk image files, 10 of which matched another 10, so
I discarded the copies from my working set of images and currently have
14.  Two of those are supposed to be mirrors of the other two, but are
are not, so in addition to finding the order of the 10-known mirrored drives,
I have 4 that don't have matching chksums at the beginning.

I renamed the image files lda-ldn to get my head away from thinking about
the drives' current names.  lda-ldj are disk images that have a known
pair while ld{k,l,m,n} need order and correct copy identification (if there
is one, semi-presuming one is probably a good/valid copy but it's mirror
is corrupt).

Started using the 1st 4G, md5sum'd to identify mirrored pairs -- have that
data off in a hash, so if the drives come up with a different order,
I can re-ID the logical name from the md5sum.  Nxt, I was planning on
looking in other areas on the 4 mystery disks for ones that would match.

I am not seeing how I'd use pvck to find such info at this point.  It
talks about
adding more Metadata copies, but that's good for all-ok drives, and
I don't see that being useful for a 24disk RAID10, broken into
individual iimages (where I've ID'd 10 that did match).

Is there a newer version that would help in this situation?
Thanks!




On Tue, Jul 21, 2020 at 7:38 PM Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Tue, Jul 21, 2020 at 05:47:07PM -0700, L A Walsh wrote:
> > I don't think the tools work on bare disk (or disk images).  This is a
>
> There are ways to do it, but download a recent upstream version and read
> the pvck man page which now has extra analysis facilities.
>
> > I'm beginning to wonder if this is a circular log since I can't really
>
> Yes - see for example Metadata slides at
>   http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
>
> Alasdair
>
