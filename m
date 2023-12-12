Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D991A278
	for <linux-lvm@lists.linux.dev>; Tue, 12 Dec 2023 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRWQAf6l"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso7655897e87.0
        for <linux-lvm@lists.linux.dev>; Tue, 12 Dec 2023 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702392880; x=1702997680; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpTslxHWE2n8eYYQqzPEeBmPorm5GKTqgS+E1fDYZUc=;
        b=PRWQAf6ld38hBHIqvbZreg8qp3Rh4l04ipVwm7atE520y+QVK74+w2EI0CGeIOM3pT
         Kg3OHU4IThujyJjQpu+cz8ovXhOTdx8hckkF23Am1Vt6ACCyCxlueIZm1A/6UyzLAzlN
         Y+XiFIMKawt4oG3rog+IwGb/yOE+UpdHEPDDHYa7Z9P8lf7D1ecKQiDWv03BD8VYZ3e5
         qMHJH733ifx80IRU8LTbm5r599sNg9mzeIPoErf9yKKbdZv/ctfq1nnXh/m8Q6SN4GkS
         z+3WqJeCYORuCo3aCDhT2Hs9zf/iQ0n/QuCpHmI3b20+6ivB3VOyX8Geo6tLH2TakqLV
         rMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702392880; x=1702997680;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpTslxHWE2n8eYYQqzPEeBmPorm5GKTqgS+E1fDYZUc=;
        b=oW7MkoQaPrXQNUTBQeTeqUrZxprMIca2VwdY3jwsQElN2FqRDrZWNk1PEsLN88xYSv
         aMoYI4oeGTKAN9pqpWBg86kbvtj2y4ejFBgYKFMxxF6meHu88Qt7EXKGe8B3LDdvR7Fh
         G72SOZDENkJwCl3lOcpAdpKEt7sWRkj2rLwEjpAgH4p+9fJbWGh0mIvHtMCIhVuikt3C
         bW+UhH+CcTylvGFNDkZPiThpGrhhwAlNEehpwYWTuGFt33sOd6FGqlnyPmjFG28Ysza6
         PvswXkdlTmKuWKYe6SIJx4it7MJmLcx81Z0iNvOPCWThjWwRWwY19Osl9BHETG0fNmsS
         UMyQ==
X-Gm-Message-State: AOJu0Yzpb0DDaplSd0XLyXUd2+ljzQqrggcVJwp9OFfj5Edtg5XJcoe9
	MpCY5cDHPn52z+FPMbqef7E=
X-Google-Smtp-Source: AGHT+IHpqOi8yyYdr6ohg1iIdx4kN5mCGcwLHxzW9AkuF4bmsmhQZOUVxX+Ru26OzO8Nn9AO83doTg==
X-Received: by 2002:a05:6512:3a90:b0:50d:23e4:fe9c with SMTP id q16-20020a0565123a9000b0050d23e4fe9cmr3268841lfu.64.1702392879767;
        Tue, 12 Dec 2023 06:54:39 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id vo9-20020a170907a80900b00a1d450d6f8esm6489204ejc.17.2023.12.12.06.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 06:54:39 -0800 (PST)
Message-ID: <d0e21ab1-327a-4de4-ba6e-67ef6cd3c3c5@gmail.com>
Date: Tue, 12 Dec 2023 15:54:37 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vgcreate fails with 'already exists in filesystem' error
Content-Language: en-US, cs
To: divya mohan <m.divya.mohan@zoho.com>, linux-lvm@lists.linux.dev
References: <CAOZAaLAtS0ar7pvHvHXrYA10v2h=du1WW8+agrg1GGYVaqu_fA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAOZAaLAtS0ar7pvHvHXrYA10v2h=du1WW8+agrg1GGYVaqu_fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 11. 12. 23 v 14:40 divya mohan napsal(a):
> I have an installation test environment, where occasionally an issue
> is observed causing volume group creation to fail.
> 
> At the beginning of test, the disk contains four partitions.
> 
> ---
> 
> What could be causing this issue? How to correctly cleanup the volume group?

Hi

As the generic advice -  check  'vgcreate -vvvv' command output.

This debug output should be pretty verbose and readable and giving you  more 
hints about what's going wrong.

Eventually post such trace if you are not able to decode this.

Regards

Zdenek

