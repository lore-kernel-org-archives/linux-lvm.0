Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5A2018869
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 15:35:43 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91E70307D847
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 15:35:41 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wAJFZe6d007253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 16:35:40 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Nov 2018 16:35:40 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
Message-ID: <2244ae63b6f35b202b5937a53ff91c7b@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

On 2018-11-15 17:39, Christoph Pleger wrote:

> Unfortunately - though these UIDs are all set to 0 - lvcreate still
> does not work for me. That is, it does work when I call my
> setuid-binary as a non-root user from the command line, but it does
> not work when I call my setuid-binary from PAM module pam_exec - and
> that is what I need my program for. I let my program send lvcreate
> output to a file and that file has the following content:
> 
>  device-mapper: version ioctl on  failed: Permission denied
>   Incompatible libdevmapper 1.02.137 (2016-11-30) and kernel driver
> (unknown version).
>   striped: Required device-mapper target(s) not detected in your 
> kernel.
>   Run `lvcreate --help' for more information.
> 
> What might be the problem here so that lvcreate gives these errors
> though all UIDs are 0?

No matter if I use that setuid-mechanism in the end or not, I would 
still like to know why it does not work as-is with lvcreate. :-)

I guess that the error message "device-mapper: version ioctl on  failed: 
Permission denied" comes from the following lines in LVM's 
libdm/ioctl/libdm-iface.c:


if (_log_suppress || dmt->ioctl_errno == EINTR)
         log_verbose("device-mapper: %s ioctl on %s%s%s%.0d%s%.0d%s%s "
                     "failed: %s",
                     _cmd_data_v4[dmt->type].name,
                     dmi->name, dmi->uuid,
                     dmt->major > 0 ? "(" : "",
                     dmt->major > 0 ? dmt->major : 0,
                     dmt->major > 0 ? ":" : "",
                     dmt->minor > 0 ? dmt->minor : 0,
                     dmt->major > 0 && dmt->minor == 0 ? "0" : "",
                     dmt->major > 0 ? ")" : "",
                     strerror(dmt->ioctl_errno));
else
         log_error("device-mapper: %s ioctl on %s%s%s%.0d%s%.0d%s%s "
                   "failed: %s",
                   _cmd_data_v4[dmt->type].name,
                   dmi->name, dmi->uuid,
                   dmt->major > 0 ? "(" : "",
                   dmt->major > 0 ? dmt->major : 0,
                   dmt->major > 0 ? ":" : "",
                   dmt->minor > 0 ? dmt->minor : 0,
                   dmt->major > 0 && dmt->minor == 0 ? "0" : "",
                   dmt->major > 0 ? ")" : "",
                   strerror(dmt->ioctl_errno));

But somehow, the values are empty ...

Regards
   Christoph
