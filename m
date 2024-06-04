Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2F1487DD
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=70.184.247.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511540; cv=none; b=AxEot2P5k71NwYHiKeFEhQFTEaHSh4fFKeeKfDa1esMTn8fnqNThpw0/+4moaEj2oFpW7HYgrn2C37paeOAheNf++ImX9DXaD9nZRNM2eZIP/SAZ3fyM1xcCk1JsXlQC/4RCY2aVmG9zSwPt9kwf77CNoQriZJRNire2UH4zhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511540; c=relaxed/simple;
	bh=V+UgsKuIsqPPD/RMXh74Ubm1Ee4cMCstB/2sx4EGQSE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tv+agD65jW/p+MUSTnXgnIyAK2vC3wOoMQ85/5rahRuQl5Zupi1n7MphWyTJKAhspchzrtUYCx/YjEHenR29OEsVCPAiwKjK0qzgoauleodoMFhcSeVvmjL1/D+4X7TtL9IJ5S6lg7SKO1uTW4NTHe3WO0Vk+awYaZZbsdO6kgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org; spf=pass smtp.mailfrom=gathman.org; dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b=btgTt0bB; arc=none smtp.client-ip=70.184.247.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gathman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b="btgTt0bB"
Authentication-Results: mail.gathman.org; iprev=pass policy.iprev="2001:470:8:809::1010" (wiki.gathman.org); auth=pass (CRAM-MD5 sslbits=256) smtp.auth=stuart
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gathman.org; 
 i=@gathman.org; q=dns/txt; s=default; t=1717508807; 
 h=date : from : to : cc : subject : in-reply-to : 
 message-id : references : mime-version : content-type : 
 date : from : subject; 
 bh=V+UgsKuIsqPPD/RMXh74Ubm1Ee4cMCstB/2sx4EGQSE=; 
 b=btgTt0bBgQcOiECvpGMZSyNAIu//TOGAm9WsChEzNwXZg5thraCcjnGM
 r7AXpU+REg1VqHDXI+3BHrELzD9QK/xaqlx+S/0BYpOSA3lJOkaJfrDCN6
 /EKqVaNTzoVsdqzdg3wwpK7qK5xLlQGJQtluzOht8Duf/pZhl1tKizgdI=
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 454DklOv003107
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Jun 2024 09:46:47 -0400
Date: Tue, 4 Jun 2024 09:46:47 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: Roger Heflin <rogerheflin@gmail.com>
cc: Jaco Kroon <jaco@uls.co.za>, Zdenek Kabelac <zdenek.kabelac@gmail.com>,
        "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: lvm2 deadlock
In-Reply-To: <CAAMCDee7ea+x43vx8Q4jJwMyVXpV+NVcTMLHyTYar-ZXkV6mwg@mail.gmail.com>
Message-ID: <58c4fae3-7944-916a-80fd-303b71e4120@gathman.org>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za> <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com> <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za> <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com> <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com> <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za> <CAAMCDee7ea+x43vx8Q4jJwMyVXpV+NVcTMLHyTYar-ZXkV6mwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Tue, 4 Jun 2024, Roger Heflin wrote:

> My experience is that heavy disk io/batch disk io systems work better
> with these values being smallish.

> I don't see a use case for having large values.   It seems to have no
> real upside and several downsides.  Get the buffer size small enough
> and you will still get pauses to clear the writes the be pauses will
> be short enough to not be a problem.

Not a normal situation, but I should mention my recent experience.
One of the disks in an underlying RAID was going bad.  It still worked,
but the disk struggled manfully with multiple retries and recalibrates
to complete many reads/writes - i.e. it was extremely slow.  I was
running into all kinds of strange boundary conditions because of this.
E.g. VMs were getting timeouts on their virtio disk devices, leading
to file system corruption and other issues.

I was not modifying any LVM volumes, so did not run into any problems
with LVM - but that is a boundary condition to keep in mind.  You
don't necessarily need to fully work under such conditions, but need
to do something sane.
