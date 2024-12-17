Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31B1DFDA2
	for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426837; cv=none; b=qXDLD1rU2HAwL9oObE/wmy/1GyEeCyEz4FEgzKqwf9l3BajiZCstJy9Vm8S+aX5bf2GMJZvFckvfpCvJfOql4ARby4sAHVZmohdYeAom4yaveygqm0jWg/r1zPOYpybEB7H8jaj1rDUy1/dnglvvfhBWGDk7uvZpRCvkQWmKcxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426837; c=relaxed/simple;
	bh=VCuSD6iN0r7zRiYPeL+DD9+U5HyCxCy4G8HvEAvarlQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mDy21+EgCsCNYbzwMC1Vas5NJFBu6slx5MRJYgTXQpJ148lW1FlxXc1g8r1FHDMM8EeLJyThOCiyigBlhCeZlAdTi7afiumx2jr4fMZJh1pFoNRyuKtIdjFo/bCZXTRxYaMACglssTuOADAtQtukrKA93mS8H4+rO4naws8uLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IATFfeU2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IATFfeU2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283dedso49329335e9.3
        for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734426834; x=1735031634; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCuSD6iN0r7zRiYPeL+DD9+U5HyCxCy4G8HvEAvarlQ=;
        b=IATFfeU2J3t9OM2S4M8c2AnMNLWnts0mTXICtCYIxEhm3zVRL8LpWr3LNcPkSJjD6O
         X1fSqhzSWL7BM8Dm9HrH9f4YSK0xXDzwONka6Rla6ILzYmqaPscDDxdFEEdnMoMD+RZh
         V7bqem4bRdQH98Fl4Lmng5BrvLVM+RuHicXtm8IgK6WJPqoDUSgNMltWdVgMKp6/B5M1
         /GLWpvULiljllvBAWPAVud9y5n7UhvZCrH5FezOgPyi2C4g5pPBbGpguraFaMW9TOaFC
         Teh6kfh2ry6QW/qbZ0mx7O1VezJxFcJOndma/zCByM4fn6Kw2kaBfollgun1pPDH6CIi
         7a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426834; x=1735031634;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCuSD6iN0r7zRiYPeL+DD9+U5HyCxCy4G8HvEAvarlQ=;
        b=XLH6DVUWxvMxcV7aHuaW5OCMcb+hd70nFjz0/VvfBKMrYfY41obJ7Oj6ieL5Ak0Ry3
         JZEFDXnfoe1yJlcfyUzYHOzfmDEezXmbPHhWt7Fy7d2qfzGlB+Zfv4Azy3R7IkfpXwQf
         RIlx9THLT199As9Coat/oQaj/7kgYZoGODzX/py5pcJwjU5Z3WD4qTuUkf4DVCwO0bot
         sYoIYV93Qkp6stNJnqpBI9+EYRXhb6yDxa9Ah7pHXt0GgGzCofslbHhllq6nBUiRiqKw
         YEp3dr/OWqL1Bwhwd6sEDvKf/x123w1WSK0soqWuOfWkTGi0B2n0x5MLHaNP9U8jTH1z
         jlKA==
X-Gm-Message-State: AOJu0YzBCRGr9DCzMI09Pos1uOcUKzwpmsfQkFLHSMMv5FuOLw0/LEn2
	YNInaBiz38mySRn4CxYJVLLb06O04NHe2T9LgLHSU/HBcforFItg5bCGGDGhDaM=
X-Gm-Gg: ASbGncvTmguKTew7uH0OdasGsHVVXPCHUcAsOcytifZapJSfr+qq7q6Lei+R7LOj/7R
	MHtFuiecTK5jJ0Ys8TcspbVenqmszNwyZx402GXr9MQSho33NrSRX6sKvzP+D60GFTAYWGQPSCy
	8pvrKc7vwSHCrejVBqCF1GGzdvVPCKSkhry4Jfj/Wmnlxq29cvAS/DMMa+qXAPAXl1rag0YdZmz
	IeOrTYYLabpM1ywkAW/gQyIVX5bQ/cxaiJLYpTHUWMhoA3t5E4fTk1zUF8=
X-Google-Smtp-Source: AGHT+IEmjueppPxkc1ixQCoP7RZ55j3RkoL/jeN4uTWnzjFdH2Q4QiD5417kzjOJQLP/zMRVSMYfww==
X-Received: by 2002:a5d:584a:0:b0:386:42a6:21f2 with SMTP id ffacd0b85a97d-38880af1406mr14843885f8f.10.1734426833837;
        Tue, 17 Dec 2024 01:13:53 -0800 (PST)
Received: from smtpclient.apple ([47.243.38.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90f36sm5415053a12.14.2024.12.17.01.13.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:13:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: is it possible to add a new filter to detect unusable partition
 types
From: Glass Su <glass.su@suse.com>
In-Reply-To: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
Date: Tue, 17 Dec 2024 17:13:39 +0800
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
 mchang@suse.com,
 grub-devel@gnu.org,
 util-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <43D73CB9-32E4-405E-93A9-E985C94F4A9E@suse.com>
References: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
To: Heming Zhao <heming.zhao@suse.com>
X-Mailer: Apple Mail (2.3826.200.121)


> On Dec 17, 2024, at 16:34, Heming Zhao <heming.zhao@suse.com> wrote:
>=20
> Hi LVM2 maintainers,
>=20
> One of SUSE's customers encountered an issue with LVM2. The user =
created several partitions, one of which was marked as "BIOS boot" (4) =
instead of "LINUX LVM" (8E). Subsequently, the user ran =
pvcreate/vgcreate/lvcreate on this partition. During a system update, =
grub2-install installed GRUB2 in the "BIOS boot" partition, resulting in =
LVM2 metadata corruption.
>=20
> The root cause of this issue is that grub2-install targets the "BIOS =
boot" partition when this lvm2 device is specified for installation. If =
the user had initially marked the partition as "LINUX LVM", =
grub2-install would not have chosen this partition.
>=20
> On the other hand, it would be beneficial if LVM2 could implement a =
new filter or a filter function to detect and exclude the "BIOS boot" =
partition from being considered a valid target for LVM2 device creation. =
This could involve issuing a warning or error message to alert the user =
of the potential conflict. This may also help user to notice the issue =
more easily.
>=20
> Best regards,
> Heming

Also Cc util-linux@vger.kernel.org and grub-devel@gnu.org as it=E2=80=99s =
not an issue with lvm but also other fs progs.
It would be great if we can enhance libblkid to avoid data loss even =
caused by user mistakes.

=E2=80=94=20
Su=
