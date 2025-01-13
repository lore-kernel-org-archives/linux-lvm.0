Received: from mail.gathman.org (mail.gathman.org [174.64.33.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488A3EA83
	for <linux-lvm@lists.linux.dev>; Mon, 13 Jan 2025 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=174.64.33.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793107; cv=none; b=B0+jM2hv/JvsJrPaXnr+l/5OPeIeBR3xPxgdEQwfhCA+UgQUEGodBhLbY1gQwGqufGajA+Wu7+1OBqRCZDOtE3VzPNEermB1E8O6hG7QKDDoQTsCutmpD3EV80yFTRErHyO9Fci93t5guNaYk5rGr/7NXtcwzpXgpt5+ugJOsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793107; c=relaxed/simple;
	bh=b8Z/3WbCptL0LZhYm5MkQW4bKGV+ZIs1P84dif2oeWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZOYxvyrvdjVRveJQsXGINVLH6YGosdzYZgR3MqSxOILPSYq9xYTt/nMQfDJLl8lnSIq/dZN+5ZGY3T5iYqrYs/Ez1PfAHpF4aUC9MvgeMe9bugfcbVoufCbe7/9/ZeH8kyt8enF3unYh/2sPAsKNv1SaxrkOKIKrf+GS/sHcWUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org; spf=pass smtp.mailfrom=gathman.org; dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b=d2RdrhP+; arc=none smtp.client-ip=174.64.33.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gathman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b="d2RdrhP+"
Authentication-Results: mail.gathman.org; iprev=pass policy.iprev="2001:470:8:809::1010" (wiki.gathman.org); auth=pass (CRAM-MD5 sslbits=256) smtp.auth=stuart
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gathman.org; 
 i=@gathman.org; q=dns/txt; s=default; t=1736790231; 
 h=date : from : to : cc : subject : in-reply-to : 
 message-id : references : mime-version : content-type : 
 date : from : subject; 
 bh=b8Z/3WbCptL0LZhYm5MkQW4bKGV+ZIs1P84dif2oeWc=; 
 b=d2RdrhP+3Pba3dSjWKRJv+97tCMlhk/GR4LpbDvYzGdYADJYxNVWGIQa
 E0idKfATM3eaftD2q/0SskE5w/LT5hwItJXqRer+2uxQhGP/twrLxWT95Q
 bLGGFBcEMuwxhY4GwSw/cDf7gYqjmaYT9RvdAT6eLtDU+uPGUNp3v0Vnk=
Received: from mail.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 50DHhm11031200
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Jan 2025 12:43:51 -0500
Date: Mon, 13 Jan 2025 12:43:47 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
To: Tilman Vogel <tilman.vogel@gmail.com>
cc: linux-lvm@lists.linux.dev
Subject: Re: Fwd: pvresize after pvcreate changes PV size: expected?
In-Reply-To: <CAAbQbbA_gvXzgpmgAM8jun3-8=-EiFdNoKGJTRn0P09+RKA5hg@mail.gmail.com>
Message-ID: <ab9a43f3-2899-268f-a41e-d6d9b91f4d6@gathman.org>
References: <CAAbQbbCN-=DDSerkOoKHCHxwA9gu32HvsCezOHU4NhR0cByKpA@mail.gmail.com> <47cbadf5-fa07-4e9d-8bd2-9cf969777f4e@gmail.com> <CAAbQbbDGW=Q-NBVdgKqt272VYdYdd_i7Cr8qPLJiS2moSjQMAg@mail.gmail.com>
 <CAAbQbbA_gvXzgpmgAM8jun3-8=-EiFdNoKGJTRn0P09+RKA5hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 13 Jan 2025, Tilman Vogel wrote:

> So, long story short: If I want to know how much space LVM is using
> for the PV such that I can resize the containing block device without
> loss, is it safe to use the value from `pvdisplay`?

I've always been confused by this as well.  I just make the containing
block device "extra big" and then let pvresize (or the filesystem
resize) detect the actual space available.
