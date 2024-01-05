Received: from mail.tfdn.cloud (mail.tfdn.cloud [116.202.37.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5187219FF
	for <linux-lvm@lists.linux.dev>; Fri,  5 Jan 2024 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=payet.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=payet.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=payet.io header.i=@payet.io header.b="LUyPgtuE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E902C1191534C;
	Fri,  5 Jan 2024 09:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=payet.io; s=dkim;
	t=1704442646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=49OLawnNLc01J4rvJotNnwWfJhGD7u7Hce3+xqysDp8=;
	b=LUyPgtuEoulFWfAiFTZrDhCzVXhl5G72T+aX72swSc9onPenbM424TZ3KVOfDEIXzESqx2
	6xFDVwJQVXwc9gKjppt9VTuk4OX9vlQe/i74zBomgLYv8kxcZEzgb3JPioI0X95oN70LC7
	RzTi6ZaOb+T5+mPZvol1NY2zAKW5ddzhezIrNX/3KQYkwa/WkDRnTXvCYF4DgcJVIZ7SpU
	t4Uw5NDouoLZhjaCC9dABJLXg0BbG8m+wpAE9VhcYtRY3xYMfuU7t1lcCCh8xX7e7aWv6H
	laZCy7xIECL25cBVpeFzZfd9BMa6rTHd1J/iUZegwh+sUVqxhkJHO/L0xoNnQg==
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: Unable to resize a logical volume due to wrong reported asked
 size
From: =?utf-8?Q?Fran=C3=A7ois-Xavier_Payet?= <fx@payet.io>
In-Reply-To: <ZZcqaDWKFyUQ_7qh@redhat.com>
Date: Fri, 5 Jan 2024 09:17:15 +0100
Cc: linux-lvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <32B543C8-165B-4DC3-B542-4F72008C7A9C@payet.io>
References: <C69E0F8D-AE0A-47DA-BD37-00289EECB867@payet.io>
 <ZZcqaDWKFyUQ_7qh@redhat.com>
To: David Teigland <teigland@redhat.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-Last-TLS-Session-Version: TLSv1.2

>=20
> To work around the problem, you can disable the fs checking in =
lvresize
> with '--fs ignore', which tells lvresize that you have already =
properly
> resized the fs.
>=20
> Dave
>=20
That did it. I was afraid of doing it beforehand because I thought it =
would effectively resize the logical volume to 1T, but it worked like a =
charm.

THanks Dave

