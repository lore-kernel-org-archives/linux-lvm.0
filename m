Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A1F13C800
	for <linux-lvm@lists.linux.dev>; Thu,  2 May 2024 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714667452; cv=none; b=bbNpZTEbiZtrC2t2QVKg9M8Xmg8+8BuwklDXZE3zbHDhycbwC8gyE5pCcmqMaDMtxe1quhZ4/EWBjOhy4rW5ULTvkHvl+LIpvio36JV6o16fEGVudoj66J8GKu1OIF4x4pzmkf+H55Q9xALk5WpyDPQnskwh9vP59PHPEyOg7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714667452; c=relaxed/simple;
	bh=zkVAS8zhFM+ZS7Hpwi2ga/1oeNBMhFtpHmLDedGBhFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=siOL5xpv8GRg4LIN2jYKzKyfw6MRfqvZNKe97uZvvgaycIvm0ON6R9u6+vyOYcbWHZz7A8G18o5QwoA6zD+IqdDquamUsA199yu7rXE5PTcXX9bMVzhQrn58yX6uoObcQjE+t6DCpspdZa5bLFFBxL4ROXprLo4L48c2wzPh1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fFCz4pxP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fFCz4pxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714667449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+tfvzGpL1aDWpEVVUrJy5kzUgsMZGq/rBcusE4WcEU=;
	b=fFCz4pxPBVp15LGw3laWqXHfR+Oojjbfy7Fm4ToVEsimRbBEsr+RtEi7+bLJhbz0pyDtSV
	OVAU4o96ekziIT6dyA+KuqiGY4lNMWhCM7ITfGi7o5mZYgBWOAC0mToWWU+0yqqPxf3Wb1
	UCWZRcaUNXoP4ZaqL8k4JsK1DGKqiNM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-_YzMgKnTOwWnLlA1gqv63g-1; Thu,
 02 May 2024 12:30:47 -0400
X-MC-Unique: _YzMgKnTOwWnLlA1gqv63g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FC8D3810B05;
	Thu,  2 May 2024 16:30:47 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBC2C13FA1;
	Thu,  2 May 2024 16:30:47 +0000 (UTC)
Date: Thu, 2 May 2024 11:30:45 -0500
From: David Teigland <teigland@redhat.com>
To: Ryotaro Banno =?utf-8?B?KOS8tOmHjiDoia/lpKrpg44p?= <rbanno@cybozu.co.jp>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Repeated lvcreate&lvremove quickly increases page cache size
Message-ID: <ZjO_tW3_5ZNhnHFm@redhat.com>
References: <KL1PR0302MB54117B460DB76D8BAF2140DDEA182@KL1PR0302MB5411.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <KL1PR0302MB54117B460DB76D8BAF2140DDEA182@KL1PR0302MB5411.apcprd03.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 02, 2024 at 05:47:34AM +0000, Ryotaro Banno (伴野 良太郎) wrote:
> /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvcreate -n 7ee0d142-bffe-459f-87cb-56a355d24d2c -L 104857600b -W y -y ubuntu-vg
> /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvremove -f ubuntu-vg/7ee0d142-bffe-459f-87cb-56a355d24d2c

Hi, nsenter is the correct way to run the lvm on the host, as opposed to
inside the container.  I'd try some experiments to see if they might
narrow it down (I can't say exactly why any of these might help):

- remove -Wy from the lvcreate, in case the zeroing i/o has some effect.
- remove -f from the lvremove, in case there is some cleanup skipped.

(Removing those could potentially have some other effects in the test,
so you may need some other adjustments to the test.)

> minikube ssh -- sudo truncate --size=10G backing_store
> minikube ssh -- sudo losetup -f backing_store

I'd try running this on a real device in case loop is has some memory
impact.

> My environment is as follows:

I don't see an lvm version here.

Dave

