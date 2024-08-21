Received: from out.good-with-numbers.com (out.good-with-numbers.com [70.36.235.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211D18E757
	for <linux-lvm@lists.linux.dev>; Wed, 21 Aug 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=70.36.235.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724244448; cv=none; b=U+vaSyOjqlvBPfcKfwS+2n3/Nc3fUnCvT7IeCg107VXQd27tPTensZLBttyJgJXqY435+KgNqLMGFSj2I1z7JIyfdvKDLeJ3L99EWSFxHj31MD4CVheukMI4zPT+eNMYJ8lC0brDpdz+pFCwG103s5f7rrf/wA4dYGXrbFEhHyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724244448; c=relaxed/simple;
	bh=1CR9/x2TcNzl6ut5eyfh17LwtJm6469k0sitgyrsCAc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcXoBxEQhK5BEyZ/ByoVKg31zweUbD71yhQlCDGiJB3w/ieQK73k+PGsrQh7wsNNhV+cvI1oqNBAjzRjXMrDFMamwKo/10w0RSwqRCBB8yKpbwgbEGJwBe7tAEdESALV57KHWbM1LoOI9YPTuPM6hfeJtNpwLFwPy+hx+EseoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com; spf=pass smtp.mailfrom=good-with-numbers.com; arc=none smtp.client-ip=70.36.235.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=good-with-numbers.com
Date: Wed, 21 Aug 2024 12:44:38 +0000
From: Mike <debian@good-with-numbers.com>
To: linux-lvm@lists.linux.dev
Subject: Re: --autobackup option
Message-ID: <ZsXhNgob8ePoQYie@70-36-235-101.dsl.static.fusionbroadband.com>
References: <ZsAIwPIPOs36xR4R@70-36-235-101.dsl.static.fusionbroadband.com>
 <ff0c96cd-72e2-491e-9286-85c6ce604f2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff0c96cd-72e2-491e-9286-85c6ce604f2d@gmail.com>

Zdenek Kabelac wrote:
> This option (--autobackup)  is per command.
> 
> If you want to disable backups for all commands - you need to do it in
> lvm.conf   (  backup/backup=0 }
> 
> In general in most cases this option should be left in its 'default' enabled
> setting - unless you are doint too many changes too frequently and backup do
> consume too many resources...

Thanks.  That's the explanation that I eventually inferred.  The documentation
is misleading: "Enabling this is strongly advised!" suggests that it needs to
be enabled, isn't enabled by default.  And the fact that I couldn't find a
place where the setting would be stored on the LV/VG, etc. suggested that it
only affected the one command.
