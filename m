Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A8CA69
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706102006; cv=none; b=THxU3NnMALx/uP9V2FglWj5wNWjBG/Mf8jbJF0PFEa0Uy5Fhz39VVdnJ/g9yAIuxUKzLdmZM+ACyg4ZOBUS9lAr5K0jZyfmMhJ6RLU6nFkIxCbL18HbdE1V39YlutCvGPZqj3V19tlCPpp70/DWzCnUfp7xwzSnCVy8NDLd5fmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706102006; c=relaxed/simple;
	bh=QTGzYcVEwunWecfRon8OmqGMc0n/pRn+JDACadKUmI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tj3tRMdGHI+7nbrbbzQKVw/zkB84AwJtRlqAj29zLzsukx0vqVz3fE89Av6iRDXNOBaIihKLG8nSWitpK70D/ab7lwt1m0tJlUmIT2bYTuxWywMPg0O1yNHFThcSbrYnLxSXGCiD5rzIbbyNCJE+sEoTbP3ME1BUDkfNGuqv0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UuPCE2/P; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UuPCE2/P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UuPCE2/P";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UuPCE2/P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0061D222DE;
	Wed, 24 Jan 2024 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706102003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qe3nn1IZqxcTcOm4OBBVfM0b6Fq8Iwb5ggu7/onVApI=;
	b=UuPCE2/P+gxE1ptYmSt1iNznS5GYj6BdIokJdOn+mDwYsIFBytDhTIKH5D0CLaWBwsoFrl
	p0tTXLCkYgbdlTeTsLVNNq0TmgwxH+bvqQfZnt3ed7Vkfb2VPICnHyrgui73wcogL92dDl
	ZZHL6Tiab1ZK09W67+IskUgiANGXIY0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706102003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qe3nn1IZqxcTcOm4OBBVfM0b6Fq8Iwb5ggu7/onVApI=;
	b=UuPCE2/P+gxE1ptYmSt1iNznS5GYj6BdIokJdOn+mDwYsIFBytDhTIKH5D0CLaWBwsoFrl
	p0tTXLCkYgbdlTeTsLVNNq0TmgwxH+bvqQfZnt3ed7Vkfb2VPICnHyrgui73wcogL92dDl
	ZZHL6Tiab1ZK09W67+IskUgiANGXIY0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69F2913786;
	Wed, 24 Jan 2024 13:13:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DnBfFvIMsWVcQQAAD6G6ig
	(envelope-from <ailiop@suse.com>); Wed, 24 Jan 2024 13:13:22 +0000
Date: Wed, 24 Jan 2024 14:13:17 +0100
From: Anthony Iliopoulos <ailiop@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Message-ID: <ZbEM7Ri0_30DYHh6@technoir>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
 <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
 <Za_swUm-PGHoaf1X@itl-email>
 <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com>
 <ZbD7ddzZQqjTC5eB@technoir>
 <0072b514-1201-4f7b-b328-303c42d037c0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0072b514-1201-4f7b-b328-303c42d037c0@gmail.com>
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="UuPCE2/P"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.55 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.54)[80.64%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -3.55
X-Rspamd-Queue-Id: 0061D222DE
X-Spam-Flag: NO

On Wed, Jan 24, 2024 at 01:35:49PM +0100, Zdenek Kabelac wrote:
> I guess our dev_flush() function is mostly handling all those cases properly
> with the use of  ioctl(BLKFLSBUF).

This ioctl by itself will only flush the page cache and not device
caches, but it is indeed followed by a fsync on the blockdev which is
basically the only way for userspace to trigger a device cache flush
when operating directly on a block device.

> The only problem is - it's usage somehow vanished - and even in the past
> it's been  basically used only for non-direct usage so likely still not
> correct.

Indeed, the device cache flushing is required for data integrity
irrespective of the io mode (unless O_DSYNC/RWF_DSYNC), direct-io only
obviates the need for flushing the page cache.

Regards,
Anthony
