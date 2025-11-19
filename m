Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0DD2E8B66
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568653; cv=none; b=Dx8RV20CKrdvhIXrrpqX1Jt7ubw4eyQ/fUUoDuoPe9WEiHMl8rz+wp/f5AeolslhyyyBOwfg978wiN12tTbUuMZXK0kqTXgEMUdDlSU8p+DtBhhfAmPWEOtEDCPPx+nMLtf3jTKtzpWoDhFBZcL+rTIjXTng+QgFYx3SiG7uTos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568653; c=relaxed/simple;
	bh=+LKp8zFvitQT9z00Qg34cNQxAtWSrW9rwPdklD1iiLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UOHnegogDTZA/iaiIDOtQPUv6OrjE3hnnMxGt4qi0Mh/5AcwpCAMncswDegBUkwbvFLoS48v6fHgICsyzYtfFaYpXwjk2chw34y/NeXk6nxb9mB0kJWSAMIPxgpddI8FEO0tMLG9Nvmc2rzPQuMAiiL4mShg5VbCprgMHybguts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhrnUOxc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhrnUOxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763568650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qbtpd3AuSNIGhWGAFgdorsnUc+rWZ0+zVe23WEoLU9A=;
	b=RhrnUOxcFxL0IhS786BQu8BRva0ZWPLtn7IRwIJFzGjCzKcGoKKt0o/LyEBEYU2sBzJaY1
	mblRNxjOcelag+gA8sNt2Rg0gMsoI0EjmAJPpNTtPHdX5eUXhiuIWMBPNMS+Zewf7+O25K
	5/15XF9jjwb/Msj7czj0nHJ+pdIlID4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-sNYHpZvVOLOaYNqxnsgBjA-1; Wed, 19 Nov 2025 11:10:49 -0500
X-MC-Unique: sNYHpZvVOLOaYNqxnsgBjA-1
X-Mimecast-MFC-AGG-ID: sNYHpZvVOLOaYNqxnsgBjA_1763568648
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88234e4a694so327249066d6.3
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 08:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568648; x=1764173448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbtpd3AuSNIGhWGAFgdorsnUc+rWZ0+zVe23WEoLU9A=;
        b=YwdWAEvASJvw6UZgKbH4c1HteTnumBZ79mML525QUVUIi/gwvR4y4cKLMcMerdiO3p
         zyq06CIHWYsPskCqMPSz5g1DqYn/mTOZidwsVmZio6U1kH4zpBgPOfITBIu9RqPBtUBF
         L3QPHIU4vGpfmdfHZgzHSnUmGPrHJkUm27Cj/6NC14Pwt5F9pyf3nelVnVKNHW+m83Ao
         RuuofBFdr+oTeEmqXvXF/jsAS2F8Jucw3GDw4rSZjmYDpnwNdIG+Y0Who3j0RP6n7owl
         yH3GBJrTWsOBWM27hhevACKyZKuAtpjsHlRBWA6sPQq6BoIooBsoW+ocfMHq97juRSfA
         Q9CQ==
X-Gm-Message-State: AOJu0YzOWhNFIOXpltqjWpO9XNbWXZBGEW3Zqi5IhL0UxsR/l1Tmi3fO
	GVwNaspnpVFqaEYXJMzXUuP5HsJ+ROkLYSFHstpEGmKzjqjjZZY14giRNoiZ2HE3Pq+6jW3W4bV
	oLbvuvWSJzwVSpsVlJXSjxDhhlI130ucITr2jhyFcIU0BJo0Z+EmukBluH0wHB/FX+XVRgA==
X-Gm-Gg: ASbGncsN/1f2ULH6ATQpBi1qQKJVXTYTjzQKLFCCjI9Ay5G4NOjQQMWLYoKrQfODA1H
	OFWJfI3bgdUwelO3mzyXWtcj6KWu/aQ/zQeiIiiSfhLmd6Z5vmgpWzvwGCOoj9oxuimt88JuQli
	lTWsmgVgzwqH7AbeVI7f3viRh5XW+mm7X7PMaLR21d5v65+VG97WQchgN7ZdC9d2oBg591JkUW+
	BBUeNfs91DG/Uxzrf+aPo+qmOZa/CbdvMRastniLRfb1PlMifo9RbKyxdmLk8m2bag06o9C/Vp3
	W5mpIhKpOgRJfcWl8bsVBtYp1127N9BQYw+4Anjz+wyACZB2eSGT98We0OQfb/En
X-Received: by 2002:a05:6214:ccd:b0:87c:836:8f21 with SMTP id 6a1803df08f44-882926012c6mr318118696d6.21.1763568648371;
        Wed, 19 Nov 2025 08:10:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKRgTFoJajO1wm4KwJ9exaa+xIOs8eDhrkSR5JnY0cr+MFvjKZiZjvUQxh+LzRB+XYBu6o/Q==
X-Received: by 2002:a05:6214:ccd:b0:87c:836:8f21 with SMTP id 6a1803df08f44-882926012c6mr318118106d6.21.1763568647860;
        Wed, 19 Nov 2025 08:10:47 -0800 (PST)
Received: from localhost ([2600:1701:430:16b0::47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652ef99sm137549016d6.29.2025.11.19.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:10:47 -0800 (PST)
Date: Wed, 19 Nov 2025 10:10:46 -0600
From: David Teigland <teigland@redhat.com>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@lists.linux.dev
Subject: Re: pvmove thin volume doesn't move
Message-ID: <aR3sBtSk4ADdB70T@redhat.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nerrEef2UU6dSkdKnHH-HcQKuv7LDJUsZD3Q5dh-ua4_1763568648
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Nov 16, 2025 at 08:27:30AM -0500, Brian J. Murrell wrote:
> Hi.
> 
> I've added a new (faster) disk to a VG and now want to move a thinly
> provisioned LV to the new PV.  When I try it doesn't find any data to
> move though:
> 
> # pvmove -n /dev/rootvol_tmp/var /dev/sda7 /dev/sdc
>   No data to move for rootvol_tmp.

Thanks for asking, one of the reasons we don't really have a plan for
this, or other things, is that we just don't get users asking for much.
Over the past couple years I've actually noticed a lot of people looking
to copy LVs, and even some external tools that have been written to do it.
There's quite a bit of variation though, and it's often copying over the
network, or recently, copying on a SAN so another host can use the LV.
There has been some work in our group aimed at parts of the problem,
for example https://github.com/device-mapper-utils/blk-archive

So, it's been at the front of mind that LV copying in some fashion is one
of the larger missing features.  What's not clear to me is if we can find
a solution that meets enough of the varied use cases, but I'll try to
raise more discussion about it.

Dave

