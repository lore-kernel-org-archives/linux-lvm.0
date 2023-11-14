Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB226AED
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyhX3uwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699995094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=txuF6vwEIzRCYYn+BnSFAvkdx17kzVdXB/+swM0lzLA=;
	b=ZyhX3uwnltaPu7usHMrSTP90/zriVWFRq5FCM8mYX3uKsdTK1TuJ15LAEXj4+1AUHCHrqv
	OO94et0yRavsClowwuqwv4aq4FW4mOd4QaKj38ngKkvJ+68OOZPkDGyoDHQPmhhHpmLqyy
	WYffrkB6uAxCeTWVAYn0Zr/U8bDgGKY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-259-XZ5BlpGzP0i-Lmz9l6EdcQ-1; Tue,
 14 Nov 2023 15:51:31 -0500
X-MC-Unique: XZ5BlpGzP0i-Lmz9l6EdcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D27523C23FC4;
	Tue, 14 Nov 2023 20:51:30 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AD43143;
	Tue, 14 Nov 2023 20:51:30 +0000 (UTC)
Date: Tue, 14 Nov 2023 14:51:28 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Glass Su <glass.su@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"hare@suse.de" <hare@suse.de>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVPd0NyOgJjRTzvi@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <ZVOnoCjNmOYToBpt@redhat.com>
 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 05:48:45PM +0000, Martin Wilck wrote:
>        "If the system devices file does not yet exist, the pvcreate or
>        vgcreate commands will create it if they see no existing VGs on
>        the system."
> 
> That basically means that every new installation (where PVs and VGs
> will usually have to be created first) will use system.devices, and
> thus disable use of filtering and traditional-style multipath component
> detection. Right?

Yes, a new install with no visible, existing VGs would run pvcreate or
vgcreate which would create a new system.devices.  That means the regex
filter is disabled, and multipath component detection is unnecessary (we'd
still check when a user adds a new device to system.devices to verify they
aren't doing something dumb.)

The installer should probably decide ahead of time how it wants lvm to
look in the end, and then make that happen, rather than relying on lvm to
adapt to the installer environment.  In the case of anaconda, they set up
new PVs without using system.devices, then at the end it runs
"vgimportdevices -a" to create a new system.devices from the PVs it
created, plus any others that are attached to the system when the
installer is running.  (We've had problems with not planning ahead
sufficiently when it comes to OS images where the "install" doesn't happen
on the actual system.)

The sentence you quoted is not mainly about installation, but rather that
lvm needs to have some kind of defined behavior for itself that's
independent of an installer.

> AFAICS the other use case is MD RAID, no? I think that LVM could rely
> on udev for that as well. 

Right, I don't think we'd risk relying only on udev to detect that when
AFAIK we've always included native detection to some degree.  The
consequences of using a raid image directly can be a bigger problem.  The
other case is detecting if a disk is partitioned (so we can ignore the
whole disk.)

> > This means adding another config
> > option... not much different from just using multipath_wwids_file="".
> 
> For multipath, external_device_info_source=udev used to mean "udev
> only" until recently, unless I'm mistaken. 

Yes, although the default external_device_info_source has always been
"none"... complicated by the fact that at various points in time some
parts of lvm made ad hoc calls to check the udev state regardless of the
none|udev value... it was a mess until I overhauled it all, the settings
were not entirely followed, and it was not possible to control entirely.

> The semantics of this settings has changed. I don't know what the
> situation was for MD or possible other subsystems. I'm fine with calling
> the algorithm "udev" if the respective semantics are still the same that
> used to be called "udev" in the past.

Hm, that past was not as ideal as you imagine, there is no coherent
behavior to restore.  There is the option I offered of a new setting that
means exactly what you need: use only udev for detecting multipath
components.

> > Yes, it just causes lvm to skip the use of /etc/multipath/wwids for
> > checking if a device is a multipath component.
> 
> Thanks. I'm still not happy about it, but if we find no other solution,
> I guess it will be ok.

Could you try multipath_wwids_file="" and see if that's sufficient before
we add a new setting that's nearly the same?

Thanks,
Dave

