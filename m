Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBC1A5BAF
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588806; cv=none; b=txs2WeaPI+47gMd6+8P4NmKYJ757mF9UR5QJsqSc+H0pWbNTpO6OVNAFt6dWyvhKepYepDF2dqw2cNiL3MCTwSzYxFcUg0JRBM2JLqzEpUNjIMyCbYrikFywOgfxXhmZUwK+g685F0T3JXYyZI1nByVe8STAcEWT1Xw4Y0mvCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588806; c=relaxed/simple;
	bh=HzoZJwNawcflF2s26YPDwOjOEbD4EN405TvOUbmhIXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BdVhCtbku5OJRdqXu39g8YxW0Zn0AgzoAWGhXEKJAUvjtxTAoVZVze/FKgjSMqTULYrezhO7HuldQYV849rXQESCvoH4K79urJaBfg0TYxd7eThJk8zdteL34o6H8AhfeprvM/gDowzL1pGbK8JfKlUaMc9Mg7vVTWNikNIggqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flLzbUG6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flLzbUG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754588803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+yMhTUnvUBrdwXK1IZV+XnHk5yzbozBcILfVx+4skk=;
	b=flLzbUG6u0V/DJSV2biK6VUTcKCHloV9REFi4ma0NomewnPPKWmQm0cDP1+zTDZ3Ho0ABY
	1rACmCvcGWCU1QtkIcWQJ0d0kPv+K8TCAv+HJxKgtmg719JDAxfGykYkmblkIPFL/cUSmx
	WWxJrh5oirprtiCSWcRRShLd6HuXU8Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-kYedaU6POr2T9oYW53hYXw-1; Thu,
 07 Aug 2025 13:46:42 -0400
X-MC-Unique: kYedaU6POr2T9oYW53hYXw-1
X-Mimecast-MFC-AGG-ID: kYedaU6POr2T9oYW53hYXw_1754588801
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A2DA18004D4;
	Thu,  7 Aug 2025 17:46:41 +0000 (UTC)
Received: from redhat.com (unknown [10.22.66.53])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22A2519560AD;
	Thu,  7 Aug 2025 17:46:39 +0000 (UTC)
Date: Thu, 7 Aug 2025 12:46:36 -0500
From: David Teigland <teigland@redhat.com>
To: Joshua Long <joshualong@microsoft.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: Question on Computing VG Capacity
Message-ID: <aJTmfPOQIv3JdwGG@redhat.com>
References: <LV3PR21MB4252B491DCFB134F050577BEC12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
 <LV3PR21MB4252594D194D3081D1E50411C12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <LV3PR21MB4252594D194D3081D1E50411C12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzNzS7Z_GUhliIhHXXQXeQulKPielCrXfZC5_5UJ-lU_1754588801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 06, 2025 at 09:49:53PM +0000, Joshua Long wrote:
> Hi everyone,
> 
> I wanted to reach out with a question regarding how to compute the exact usable capacity of a volume group, based on the disks that will be used, without actually creating the VG or physical volumes.
> 
> Specifically, I am looking for a method or tool that can help me determine the capacity accurately beforehand. 
> 
> For example, I have a VG with a single PV with a PE size of 4194304 B. 
> 
> We have one disk with 1920383410176 B, which equals 457855.084 PE. 
> 
> The capacity of the VG with this PV after creation is 1920378863616 B, equaling 457854 PE.
> 
> Is it always true that the total PEs in the VG will be the disk capacity divided by PE size, minus one? Or are there other factors or metadata overheads I should consider? Any guidance or suggestions would be greatly appreciated.

Hi, 

It would require some effort to track down all the factors in the code
that might come into play, so I can't immediately state a firm answer.
A few variables come to mind which might influence the result (basically
through attempts to align things nicely): the system's page size, the
device's minimum_io_size and optimal_io_size, and the device size being a
multiple of the extent size.  The pvcreate man page explains some of this
under "Metadata location, size, and alignment".  It also mentions command
options that you can use to control the end result.  By using those
options, and rounding the device size, I expect you should be able to
predict the total PEs accurately.

Dave

