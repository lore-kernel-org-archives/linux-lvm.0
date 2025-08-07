Received: from mail.stoffel.org (mail.stoffel.org [172.104.24.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B07483
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.24.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579800; cv=none; b=LDdj7aevXAwhAgQSQObCCY6vr6W/mxjNceot2xIX1hRRf8piJWCEuqLtk8zl5N7XJJn2bqYfTdQYc3p65udQJWhjoJWv8Dt5SgPVjqSlCCJ/cUFX5bcnWMkuAk+2CekNtkRpRQr+tuxdttGV5mXc7zbpAfn6RU50ARhTfsJWHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579800; c=relaxed/simple;
	bh=B4FQFHwjRTOBCZ1aZ4mv2mSJB0Fgz2GZ7/vsKAwyw7s=;
	h=MIME-Version:Content-Type:Message-ID:Date:From:To:Cc:Subject:
	 In-Reply-To:References; b=mFIS5CV8HM17bvq5vFDBn8cCdq2t+RJmK3Tpazh3XncXq3zoZh09JVG4zy0w6aOKp5MKEOJ2QVTrlweLUjZcpa/Ou2sTI55LX0Voiwf4xQqmw4XBUsjGMnTwFhe6rrFeXx6Ns40EJ7nAjFfWeQfAA9AQ+QRrMuY9Hxl59RnFu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org; spf=pass smtp.mailfrom=stoffel.org; dkim=pass (2048-bit key) header.d=stoffel.org header.i=@stoffel.org header.b=CXUpf3SE; arc=none smtp.client-ip=172.104.24.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stoffel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stoffel.org header.i=@stoffel.org header.b="CXUpf3SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stoffel.org;
 i=@stoffel.org; q=dns/txt; s=20250308; t=1754579798; h=mime-version :
 content-type : content-transfer-encoding : message-id : date : from :
 to : cc : subject : in-reply-to : references : from;
 bh=B4FQFHwjRTOBCZ1aZ4mv2mSJB0Fgz2GZ7/vsKAwyw7s=;
 b=CXUpf3SEKPm6ku21YLEGRi2uVfwCpxZQv2/TDNlHMBZ+gA7S816ZhXBN4DYSHv6VDlcXh
 g0SnrpKL7B6Gh4U37kCwKQUntQ0622HNCPGQbTuWfaggZnl7lMBnCasp2oXYkJK4sDqtSSl
 et0lkyOgnulmh7qA/mJYSqr4EogfVgPGwNMZ1NGPw1RScfPoimdzLl30kk6ArUckVd7p2J/
 xjQvLIFThoHFpnTEdelWg4n6zuUsumuVSUSH6Azu0oCiaMxC3vAo1jZKmPXf/6evKWpmdXf
 xRyLPtuTRiYMgjXDB7+ykPmHkz5/+a9yTCkJsR5eBIm5LFDqKvndVaABAZWw==
Received: from quad.stoffel.org (syn-097-095-183-072.res.spectrum.com [97.95.183.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 058841E67A;
	Thu,  7 Aug 2025 11:16:38 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 95857A11AB; Thu,  7 Aug 2025 11:16:37 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <26772.50005.551492.387442@quad.stoffel.home>
Date: Thu, 7 Aug 2025 11:16:37 -0400
From: "John Stoffel" <john@stoffel.org>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@lists.linux.dev
X-Clacks-Overhead: GNU Terry Pratchett
Subject: Re: Best use of a small SSD with LVM
In-Reply-To: <1b749fa978a120d9d9e3ed1951aa45aa753e8006.camel@interlinx.bc.ca>
References: <1b749fa978a120d9d9e3ed1951aa45aa753e8006.camel@interlinx.bc.ca>
X-Mailer: VM 8.3.x under 28.2 (x86_64-pc-linux-gnu)

>>>>> "Brian" =3D=3D Brian J Murrell <brian@interlinx.bc.ca> writes:

> I'm wondering what are the best practices for taking advantage of the
> speed of SSDs in combination with spinning rust drives in a volume
> group.

> I have 111GB of free SSD space in the same volume group as all of my
> system's filesystems (/, /usr, /var, /home, various other /var/cache/*
> filesystems, other data, etc.).

> Currently the 111GB PV on the SSD is completely unused.  But I wonder
> what the best use of it is.

> Should I just move entire VGs (i.e. something like /usr or /var or
> something else) on to it, or should I use it with LVM caching?  IOW is
> LVM caching effective?

> LVM caching seems like a lot of guesswork regarding how to split the
> SSD up most effectively so that you have the right size cache for
> the various volumes that you want to cache.  I.e. for every
> filesystem I have in my VG, I need to decide what percentage of the
> SSD I want to use for it and then how big I want the cache LV vs the
> cache metadata LV, etc.  Is there any way to monitor performance of
> the cache VGs to decide if they are being used effectively or if
> space should be moved from one cache LV to another?

I tried LVcache for quite a while when I had more HDDs with small
SSDs, and I didn't really find it make any visible different to me.  I
had my home directory and some scratch areas using this, but never
really got any wall time improvements.

Some of my tests were just reading emails and storing them on the
disk, starting/stopping applications.  Doing kernel compiles (git
pull, make oldconfig, make bzImage, etc) and it just didn't seem to do
much.=20=20

> Can cache LVs be resized to optimize the size of them?  Perhaps I
> created a cache LV too big and it's not being used efficiently and
> then want to reduce it's size and use the freed up space to make a
> different cache LV bigger.

> Assuming one wants a writethrough cache because one does not have
> battery/UPS backed systems (such that they are vulnerable to power
> outages)=A0(writethrough is the correct choice for that situation,
> correct?) is there any point to caching write-mostly filesystems such
> as /var/[log/] with a writethrough cache?

> Any other insights anyone wants to add?

I wouldn't bother honestly, I just never found it to be providing
meaningful performance.  But that's just me.
