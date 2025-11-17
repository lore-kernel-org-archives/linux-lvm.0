Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B63240611
	for <linux-lvm@lists.linux.dev>; Mon, 17 Nov 2025 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.165.217.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763422215; cv=none; b=i2YH3Gd+XHtS5Imwkxgxfu2s0rlhIizJaWPMJUnh0JcTGi+RxdtSIjTSqH23KBvUGpVwk9q09wND2g6CZjORDKAkTZ7mOzptj2UYATMAY/c/qnkCxgcFI7ywBdFb1Aph5x2gxydjumiTiDogTom1m838UPOmdWZA6O7JmSXspog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763422215; c=relaxed/simple;
	bh=/9MwqEjV3qGzAJw4fuylz3W4HbGq7mMYUvBPKzyHVN0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HDHCqjo+f1FXtxOl6MHUCRrdBdtbV08UpqmJ3NPDH57qMvHYMyO41J9QEGk8yX2B/ETOiAnqyP9tgGll5Wg5MnIxqGZPhWek7Wtm6r2LY7WgttEIRDxVAPfFAfau1oQDzCU2Zn8Oq3tiQH42vAXxosIwNk12j8zgVuYahl1YOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca; spf=fail smtp.mailfrom=interlinx.bc.ca; arc=none smtp.client-ip=69.165.217.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from dummy.faircode.eu (unknown [10.75.24.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id DAF043045A;
	Mon, 17 Nov 2025 18:30:04 -0500 (EST)
Date: Mon, 17 Nov 2025 18:30:04 -0500 (EST)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: linux-lvm@lists.linux.dev
Message-ID: <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
In-Reply-To: <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca> <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
Subject: Re: pvmove thin volume doesn't move
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>

Pity.=C2=A0 I don't really want to move all of the LVs in the pool.

Can I create a new pool on the new PV and move just the one LV from one pre=
-existing pool to the new pool?

Cheers,
b.
