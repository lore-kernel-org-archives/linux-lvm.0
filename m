Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50325611E
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754578754; cv=none; b=n8XTmSSz4YljUhPzpeWWMrWA0LboCNYIb3ZqY84DIw2PGZXit3zzCPaoYm2+DjCKKqv7mRhY55JedqqNJ8Rvw9y+Ek9XPOcNGryZaHh3vAwxEnwBxqMz0ZAjda6dGnMgFwPb38B4xrNKisV5tOrfDaMj/J5/qIqCL0tc8fSeNdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754578754; c=relaxed/simple;
	bh=j/6tO5V19SQ0s/C/RhaRiDByVkoasIH84IAT6TdnCbk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=drhczrKOjclGTfisRopoyB5VMe8BOoFZNddQwowY6Xs+2CyG1AekC8QTCuZnwVVpTdM365wg20NIGS5xFCyRa4V6jzSWOfdIKqsne/wJhHhp4w5swPRX/UlPg/oJj/ckvQ5qWOkHGRiCRsPHOo6HowVyTSXk42cGKBZaaG3qbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXmFzSCD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXmFzSCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754578752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AT6ywknbqdDEQlsNaX52vgJT3GA0GOs1CdVbGcExNUY=;
	b=ZXmFzSCDPKO2zyPX7az+59zfuVo54SqTmW7ua5QEw46D6r2dtx2Od4XzesWLHi1NEts/SA
	+V1nEiICH9ONKxluXNnhYrCz3WJvf8COlVYcDII0e9BaNiG8iOd3CmRhbCRiEdv/YIsRM9
	skvl7qXbgDIxSUZv2/SnH4HNwJGZOl0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-8rUuKmuQMJiH0i6D-MOa8Q-1; Thu,
 07 Aug 2025 10:59:09 -0400
X-MC-Unique: 8rUuKmuQMJiH0i6D-MOa8Q-1
X-Mimecast-MFC-AGG-ID: 8rUuKmuQMJiH0i6D-MOa8Q_1754578748
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B1251800291;
	Thu,  7 Aug 2025 14:59:06 +0000 (UTC)
Received: from [10.22.80.50] (unknown [10.22.80.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18BD11954193;
	Thu,  7 Aug 2025 14:59:02 +0000 (UTC)
Date: Thu, 7 Aug 2025 16:58:59 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John Stoffel <john@stoffel.org>
cc: Stuart D Gathman <stuart@gathman.org>, Peter Rajnoha <prajnoha@redhat.com>, 
    Zdenek Kabelac <zkabelac@redhat.com>, 
    Heinz Mauelshagen <heinzm@redhat.com>, 
    David Teigland <teigland@redhat.com>, linux-lvm@lists.linux.dev, 
    lvm-devel@lists.linux.dev
Subject: Re: [PATCH] fix random failures in shell/integrity.sh
In-Reply-To: <26772.47717.267782.824503@quad.stoffel.home>
Message-ID: <d68121f2-aa4e-c7cf-b65f-231406f04c7e@redhat.com>
References: <06d25902-7239-1fc7-ec3b-1798332c3315@redhat.com> <26771.51188.491376.658337@quad.stoffel.home> <65919799-842c-9428-8bfc-5c1c0671338@gathman.org> <36d044e7-75f0-9b53-8969-0423fade7ea7@redhat.com> <26772.47717.267782.824503@quad.stoffel.home>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dO-kkRJwRZhIJQGf0r9ZPgtARvupKJWUZYOmxMsdoMM_1754578748
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII



On Thu, 7 Aug 2025, John Stoffel wrote:

> >>>>> "Mikulas" == Mikulas Patocka <mpatocka@redhat.com> writes:
> 
> > On Thu, 7 Aug 2025, Stuart D Gathman wrote:
> 
> >> On Wed, 6 Aug 2025, John Stoffel wrote:
> >> 
> >> > > > > > > "Mikulas" == Mikulas Patocka <mpatocka@redhat.com> writes:
> >> > 
> >> > > The problem is that the raid1 implementation may freely choose which leg
> >> > > to read from. If it chooses to read from the non-corrupted leg, the
> >> > > corruption is not detected, the number of mismatches is not incremented
> >> > > and the test reports this as a failure.
> >> > 
> >> > So wait, how is integrity supposed to work in this situation then?  In
> >> > real life?  I understand the test is hard, maybe doing it in a loop
> >> > three times?  Or configure the RAID1 to prefer one half over another
> >> > is the way to make this test work?
> 
> > If you want to make sure that you detect (and correct) all mismatches, you 
> > have to scrub the raid array.
> 
> And how do you know which level of the array is showing the errors?  I
> could have a RAID1 array composed of a single partition on the left
> side, but then a RAID0 of two smaller disks on the right side.  So how
> would this read() flag know what to do?  
> 
> I would assume the integrity sub-system would be reading from both
> sides and comparing them to look for errors.  When you find a
> mis-match, how do you tell which side is wrong?  

If you use dm-integrity on the raid legs (as it was done in this test), 
you know which leg is corrupted - dm-integrity will turn silent data 
corruptions into -EILSEQ.

So, all you have to do, is to initiate scrub on the array.

Mikulas

