Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43560BBE
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706097531; cv=none; b=OKygECKUWzJ/kOsSaXMSAN8YfJWWNBlWE2hoghDcKCowsqLK+A/i7sWN4WBL6YDMM3BmoUbYrX5nWtPgeF4le7OvuSW4u4v/HSCpnXDP0+yXRSTMgcZOXaoQSQ2FV0ywekZXCw6m6kz8jmM47Xos9I9drtfAlDX2tqzHyNIml1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706097531; c=relaxed/simple;
	bh=a45/f+Abzdq08HeaAxYG68/VIoOc9scfRhjgE+CVDPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3fnziwpp+zQk/d8puRJA6CXE1+soUTpDEhq4og13LEuRJq9i3rEPCTH7v3+xctZ7MFC9S20YzpSvRvJJ0PWflU3OI9IJMY7WsKQepg0xreva2Qc1VDglPhhfyBACm+Lkk14NS6HFk6YF3nrKnBMt+70MJtmSb8M94h0smSjiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cLQAxTeY; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cLQAxTeY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cLQAxTeY";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cLQAxTeY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D45651FD55;
	Wed, 24 Jan 2024 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706097526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXWoMS96MeVfWWefqGX+9Xvh1ewzoaGU5cOhlA0hams=;
	b=cLQAxTeYUQwJ4Pi8OpwM++KoAH67CKkFRARpXiKyX2QLOCpzuwj51szK9Uj3MhY6lJY+8m
	thvwXy88inA3/UttbbpHq2Vu1AgJqlMuuRbmU2ouCmtyNzazLwjl60L2vmbj0Rm3VF9M8T
	Dw+9yA9Zkjz1zExjp5YUPVFjKjWP3xQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706097526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXWoMS96MeVfWWefqGX+9Xvh1ewzoaGU5cOhlA0hams=;
	b=cLQAxTeYUQwJ4Pi8OpwM++KoAH67CKkFRARpXiKyX2QLOCpzuwj51szK9Uj3MhY6lJY+8m
	thvwXy88inA3/UttbbpHq2Vu1AgJqlMuuRbmU2ouCmtyNzazLwjl60L2vmbj0Rm3VF9M8T
	Dw+9yA9Zkjz1zExjp5YUPVFjKjWP3xQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E7611333E;
	Wed, 24 Jan 2024 11:58:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G8PTD3b7sGXkKQAAD6G6ig
	(envelope-from <ailiop@suse.com>); Wed, 24 Jan 2024 11:58:46 +0000
Date: Wed, 24 Jan 2024 12:58:45 +0100
From: Anthony Iliopoulos <ailiop@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Message-ID: <ZbD7ddzZQqjTC5eB@technoir>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
 <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
 <Za_swUm-PGHoaf1X@itl-email>
 <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On Tue, Jan 23, 2024 at 06:50:01PM +0100, Zdenek Kabelac wrote:
> Dne 23. 01. 24 v 17:42 Demi Marie Obenour napsal(a):
> > On Mon, Jan 22, 2024 at 03:52:57PM +0100, Zdenek Kabelac wrote:
> > > Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
> > > > On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
> > > > > Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
> > > > > > Hi lvm folks,
> > > > > >      Recently We received a report about the device cache issue after vgchange —deltag.
> > > > > > What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
> > > > > > 
> > > > > > IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
> > > > > > critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
> > > > > > provide data was persistent to storage when write returns. The data can still be in the device cache,
> > > > > > If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
> > > > > > 
> > > > > > Is there any particular reason not to flush data cache at VG commit time?
> > > > > > 
> > > > > 
> > > > > Hi
> > > > > 
> > > > > It seems the call to 'dev_flush()' function got somehow lost over the time
> > > > > of conversion to async aio usage - I'll investigate.
> > > > > 
> > > > > On the other hand the chance here of losing any data this way would be
> > > > > really really very specific to some oddly behaving device.
> > > > 
> > > > There's no guarantee that data will be persisted to storage without
> > > > explicitly flushing the device data cache. Those are usually volatile
> > > > write-back caches, so the data aren't really protected against power
> > > > loss without fsyncing the blockdev.
> > > 
> > > At technical level modern storage devices 'should' have enough energy held
> > > internally to be able to flush out all the caches in emergency cases to the
> > > persistent storage. So unless we deal with some 'virtual' storage that may
> > > fake various responses to IO handling - this should not be causing major
> > > troubles.
> > 
> > This is only true for enterprise storage with power loss protection.
> > The vast majority of Qubes OS users use LVM with consumer storage, which
> > does not have power loss protection.  If this is unsafe, then Qubes OS
> > should switch to a different storage pool that flushes drive caches as
> > needed.
> 
> From lvm2 perspective - there are first written metadata - then there is
> usually a full flush of all I/O and suspend to the actual device - if there
> is any device already active on such disk -  so even if there would be no
> direct flush initiated by lvm2 itself - there is going to such on whenever
> we update existing LVs.

Can you elaborate on that? Flushing IO does not imply flushing of the
device cache, but it is not clear what you mean by "suspend" here.

> There is usually a stream of cache flushing operation whenever i.e.
> thin-pool is synchronizing metadata or any app running of device is
> synchronizing its data as well.

We cannot make any assumptions about what processes may be running and
if they are actually doing fsync on the partition. Also, on devices that
support FUA, data integrity operations are optimized by leveraging that
and global device cache is elided.

> So while lvm2 is using O_DIRECT with write - there is likely a tiny window
> of opportunity where the user could 'crash' the device with lose of it's
> caches. If this happens - lvm2 still has 'history' & archive so it should be
> at worst case scenario see the older version of metadata for possible
> recovery.
> 
> All that said - for so many years - we have not seen a single reported issue
> caused by such mysterious crash event yet - and the potential 'risk of
> failure' could likely happen only in the case of user creating some new
> empty LV - so there shouldn't be a risk of losing any real data (unless I
> miss something).

In our case this came in because LV tag manipulation wasn't properly
persisted in some HA failover scenario, but definitely not resulted to
actual data loss.

> So while we figure out how to add proper fsync call for device writes - as
> it seems to be still demanded with  direct i/o usage, it's IMHO not a reason
> to stop using of lvm2 ;)

An alternative to fsync on the blockdev would be to do open the device
with O_DSYNC or submit io with RWF_DSYNC so that all writes are flushed
to the storage medium.

Regards,
Anthony
