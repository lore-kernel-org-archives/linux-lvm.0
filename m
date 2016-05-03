Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43C0m6n003296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 08:00:48 -0400
Received: from nm25-vm5.bullet.mail.ne1.yahoo.com
	(nm25-vm5.bullet.mail.ne1.yahoo.com [98.138.91.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27A83C00F229
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 12:00:47 +0000 (UTC)
Date: Tue, 3 May 2016 12:00:45 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1870050920.5354287.1462276845385.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1870050920.5354287.1462276845385.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: matthew patton <pattonme@yahoo.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> written as required. If the file system has particular areas
> of importance that need to be writable to prevent file
> system failure, perhaps the file system should have a way of
> communicating this to the volume layer. The naive approach
> here might be to preallocate these critical blocks before
>  proceeding with any updates to these blocks, such that the
> failure situations can all be "safe" situations,
> where ENOSPC can be returned without a danger of the file
> system locking up or going read-only.

why all of a sudden does each and every FS have to have this added code to second guess the block layer? The quickest solution is to mount the FS in sync mode. Go ahead and pay the performance piper. It's still not likely to be bullet proof but it's a sure step closer.

What you're saying is that when mounting a block device the layer needs to expose a "thin-mode" attribute (or the sysdmin sets such a flag via tune2fs). Something analogous to mke2fs can "detect" LVM raid mode geometry (does that actually work reliably?). 

Then there has to be code in every FS block de-stage path:
IF thin {
  tickle block layer to allocate the block (aka write zeros to it? - what about pre-existing data, is there a "fake write" BIO call that does everything but actually write data to a block but would otherwise trigger LVM thin's extent allocation logic?)
   IF success, destage dirty block to block layer ELSE
   inform userland of ENOSPC
}

In a fully journal'd FS (metadata AND data) the journal could be 'pinned' and likewise the main metadata areas if for no other reason they are zero'd at onset and or constantly being written to. Once written to, LVM thin isn't going to go back and yank away an allocated extent.

This at least should maintain FS integrity albeit you may end up in a situation where the journal can never get properly de-staged, so you're stuck on any further writes and need to force RO.

> just want a sanely behaving LVM + XFS...)
 

IMO if the system admin made a conscious decision to use thin AND overprovision (thin by itself is not dangerous), it's up to HIM to actively manage his block layer. Even on million dollar SANs the expectation is that the engineer will do his job and not drop the mic and walk away. Maybe the "easiest" implementation would be a MD layer job that the admin can tailor to fail all allocation requests once extent count drops below a number and thus forcing all FS mounted on the thinpool to go into RO mode.

But in any event it won't prevent irate users from demanding why the space they appear to have isn't actually there.
