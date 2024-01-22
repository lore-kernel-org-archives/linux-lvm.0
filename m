Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6874D117
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939319; cv=none; b=B9Q8bIz+LmLCMZjN89r0/gs1FEMva+tPaNPS5AxTtc5yRdO+Jzkw+HgZOkQYESWgKUhtsvdFRU5eTKXNYyu9lBLVlGrCk4FBDxlN5S47NaE3P4ti4a3j6Vm7A4kjXx1El6iQxC96iMvnXkXUlMJeWqHJiDG/n0+EtzP3oYtEL/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939319; c=relaxed/simple;
	bh=IUTWy+BRJxi1rdyaIXENWb5Tsber4TVKOdvk2/DIzP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkDZRI+M4e+K/i/te9+KNCNSwG+IJMm3nsqy0vWdstD5CUsFrEwzvh72GvLGdDODHkvUKbubwNGIhn9R71St8w8DzlxcERsuTfbCklcqEdTxtebT6wTVlvT8PrleMW6isp5vGai9gFDlkqOdA9Fg6zLX3hR9lj+BVIIEo20NVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CB6C1FC23;
	Mon, 22 Jan 2024 16:01:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91D2A13995;
	Mon, 22 Jan 2024 16:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z2JpH3GRrmWodAAAD6G6ig
	(envelope-from <ailiop@suse.com>); Mon, 22 Jan 2024 16:01:53 +0000
Date: Mon, 22 Jan 2024 17:01:52 +0100
From: Anthony Iliopoulos <ailiop@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Message-ID: <Za6RcIVkSkjhQ9gP@technoir>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
 <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 TAGGED_RCPT(0.00)[];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1CB6C1FC23
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

On Mon, Jan 22, 2024 at 03:52:57PM +0100, Zdenek Kabelac wrote:
> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
> > On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
> > > Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
> > > > Hi lvm folks,
> > > >     Recently We received a report about the device cache issue after vgchange —deltag.
> > > > What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
> > > > 
> > > > IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
> > > > critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
> > > > provide data was persistent to storage when write returns. The data can still be in the device cache,
> > > > If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
> > > > 
> > > > Is there any particular reason not to flush data cache at VG commit time?
> > > > 
> > > 
> > > Hi
> > > 
> > > It seems the call to 'dev_flush()' function got somehow lost over the time
> > > of conversion to async aio usage - I'll investigate.
> > > 
> > > On the other hand the chance here of losing any data this way would be
> > > really really very specific to some oddly behaving device.
> > 
> > There's no guarantee that data will be persisted to storage without
> > explicitly flushing the device data cache. Those are usually volatile
> > write-back caches, so the data aren't really protected against power
> > loss without fsyncing the blockdev.
> 
> At technical level modern storage devices 'should' have enough energy held
> internally to be able to flush out all the caches in emergency cases to the
> persistent storage. So unless we deal with some 'virtual' storage that may
> fake various responses to IO handling - this should not be causing major
> troubles.

Sure but we cannot make any assumptions about storage device internals
in general, other than the worst-case scenario (which is not uncommon)
that without flushing the volatile caches, the devices provide no
guarantees of data persistence.

We cannot account for faulty firmware or devices that (for example)
indicate that they do write-through caching but in reality they don't or
devices that ignore the flushing ops etc., but that's another issue.

> However it's clearly a problem which happened while the code has been
> shifted towards the use of libaio.

I'm really not that familiar with the codebase, but from a brief look at
the history indeed it seems that dev_close() was calling dev_flush(),
although only for buffered-io (while O_DIRECT also requires flushing
storage caches).

Regards,
Anthony
