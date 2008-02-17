Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1HCnppC028506
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2008 07:49:51 -0500
Received: from ulx.hu (ulx.tvnet.hu [195.38.96.124])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1HCnOpe027137
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2008 07:49:27 -0500
Received: from lucy.ulx.hu (lucy [172.16.0.2])
	by ulx.hu (Postfix) with ESMTP id 0E507140342
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2008 13:49:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lucy.ulx.hu (Postfix) with ESMTP id BEA656405D
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2008 13:49:18 +0100 (CET)
Received: from lucy.ulx.hu ([127.0.0.1])
	by localhost (lucy.ulx.hu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oj02evM9cn7y for <linux-lvm@redhat.com>;
	Sun, 17 Feb 2008 13:49:12 +0100 (CET)
Received: from lucy.ulx.hu (mailserver.ulx.hu [172.16.0.3])
	by lucy.ulx.hu (Postfix) with ESMTP id C7AAC6405C
	for <linux-lvm@redhat.com>; Sun, 17 Feb 2008 13:49:12 +0100 (CET)
Message-ID: <31248093.1203252552606.OPEN-XCHANGE.WebMail.ox@lucy.ulx.hu>
Date: Sun, 17 Feb 2008 13:49:12 +0100 (CET)
From: =?UTF-8?Q?Lajk=C3=B3_Attila?= <Lajko.Attila@ulx.hu>
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
In-Reply-To: <1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
MIME-Version: 1.0
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
	<F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
	<1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Here is the output of vgreduce:
ftp://ftp.ulx.hu/upload/clvmd/vgreduce.tar.gz

Attila


2008. febr. 15, 22:06 DU dátummal Jonathan Brassow <jbrassow@redhat.com>
ezt írta:

> If the problem is reproducible, we should be able to track it down.
>
> When a failure happens, the kernel sends an event to userspace that
> signals 'dmeventd' to take action. If we take dmeventd out of the
> picture, we can run the commands ourselves with higher verbose
> settings.
>
> When you activate the volume, you can 'lvchange -ay --monitor n <vg>/
> <lv>' - this will prevent dmeventd from monitoring the mirror. Then
> kill the log device. Finally, run 'vgreduce --removemissing <VG> -
> vvvv' to perform the recovery. (redirecting all the output to a file
> will give us something to look at if the failure is reproduced.)
>
> We may need to grab debugging output from clvmd too, but that can get
> messy, so we'll start with this.
>
> brassow
>
> P.S. It looks like you must have *.debug; in your /etc/syslog.conf,
> yes?
>
> On Feb 15, 2008, at 10:17 AM, Lajkó Attila wrote:
