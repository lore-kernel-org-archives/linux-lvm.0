Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25043D0B6
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931179; cv=none; b=sAd7sF3pGA/aoUuBLrIk17BQAN+CURI8F4p88H423ADPvxokND9uJlBTlXaeg8Boh8wnFjkTsZL7q/l0rK8FqtxLsilt1R2czaU3UpnKDuMt7gJmtR/xlyOovQhub8KoWWe6ophKNlTewuj7Wglxz4LKCWgqC2GxnyoAK2Y81mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931179; c=relaxed/simple;
	bh=4pBDwny1IrglRLSjtlHwP67emtTBj111RKMyqxztA9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHs8lQ2qgt3LYrsaezBLELUeKbolbg1HXfnrqn0LKjQ/ku/rcE448bhRSnEAkWUTlznWwdq8n0Rdu29mZnutFQBrfVkmzUTmznd9DAsMmqexj/es0fwtaJKEZyHM5KZYcH4GqgsUIbDgorP2jZKVfWcT4M9mzYmN9vCSYab5prs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 014821FC05;
	Mon, 22 Jan 2024 13:46:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8082113995;
	Mon, 22 Jan 2024 13:46:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P63qG6ZxrmXQRwAAD6G6ig
	(envelope-from <ailiop@suse.com>); Mon, 22 Jan 2024 13:46:14 +0000
Date: Mon, 22 Jan 2024 14:46:13 +0100
From: Anthony Iliopoulos <ailiop@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Message-ID: <Za5xpeEStkITRMtc@technoir>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 TAGGED_RCPT(0.00)[];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 014821FC05
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
> > Hi lvm folks,
> >    Recently We received a report about the device cache issue after vgchange —deltag.
> > What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
> > 
> > IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
> > critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
> > provide data was persistent to storage when write returns. The data can still be in the device cache,
> > If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
> > 
> > Is there any particular reason not to flush data cache at VG commit time?
> > 
> 
> Hi
> 
> It seems the call to 'dev_flush()' function got somehow lost over the time
> of conversion to async aio usage - I'll investigate.
> 
> On the other hand the chance here of losing any data this way would be
> really really very specific to some oddly behaving device.

There's no guarantee that data will be persisted to storage without
explicitly flushing the device data cache. Those are usually volatile
write-back caches, so the data aren't really protected against power
loss without fsyncing the blockdev.

Regards,
Anthony
