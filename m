Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12DAF2156A34
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 14:59:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43B5801223
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 14:59:02 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id n25so18944426ljj.4
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 07:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
In-Reply-To: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 14 Sep 2020 09:58:45 -0500
Message-ID: <CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
Subject: Re: [linux-lvm] Issue after upgrading the LVM2 package from
 2.02.176 to 2.02.180
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

In general I would suggest fully disabling lvmetad from the config
files and from being started up.

Issues around it not answering (like above) and answering but somehow
having stale/wrong info have burned me too many times to trust it.  It
may be a lvmetad bug, or be udevd weirdness.

The only significant improvement it makes is it reduces the lvm
command time on installs with significant numbers of devices, but
given that the info has been wrong often enough that is not worth the
risk.

On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina
<krishchennu414@gmail.com> wrote:
>
> Hi Team,
>
> While trying to analyze one the issue, we felt that upgrading the current LVM2 package in our repository will be the best approach.
> As part of that, we have updated the respective package from  2.02.176 to 2.02.180. We have verified the same and booted x86_64 hardware without any issues.
>
> But while trying to boot mips64 hardware we have started observing the below issue.  Providing the snippet of the log,
>
> # executing command: vgchange -an
> (status, output): (0,   WARNING: Failed to connect to lvmetad. Falling back to device scanning.)
>   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
>
> Attached the detailed log for reference. There is no other change included other than the LVM2 update.
>
> LVM2 Version: 2.02.176
> Updated LVM2 version: 2.02.180
>
> Please share inputs on why this issue is being observed with .180 version?
> Please let me know if i can share any other information.
>
> Thanks.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
