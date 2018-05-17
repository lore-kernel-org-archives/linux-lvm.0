Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867995C25A
	for <linux-lvm@redhat.com>; Thu, 17 May 2018 00:04:09 +0000 (UTC)
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 273B130EE34B
	for <linux-lvm@redhat.com>; Thu, 17 May 2018 00:03:58 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n202-v6so6585509ita.1
	for <linux-lvm@redhat.com>; Wed, 16 May 2018 17:03:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+2BD2e3HVBo_7TuS9dY7TUpuNn=uf_YAnJF_dBKGr2M0n6rWg@mail.gmail.com>
References: <CA+2BD2e3HVBo_7TuS9dY7TUpuNn=uf_YAnJF_dBKGr2M0n6rWg@mail.gmail.com>
From: Patrick Mitchell <patricklmitchell9@gmail.com>
Date: Wed, 16 May 2018 20:03:56 -0400
Message-ID: <CA+2BD2dXAMqgt3agf6FVhuqMMXDCfC+ALy2sHezP=1h-f52Spw@mail.gmail.com>
Subject: Re: [linux-lvm] pvscan takes 45-90 minutes booting off ISO with
	thin pools
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
To: linux-lvm@redhat.com

Changing the ISO's lvm.conf, setting "activation = 0" in global makes
it boot very quickly.  I can then manually run a single "pvscan
--cache --activate ay" to activat everything, and it just takes a few
seconds.  So, I'm thinking this has to be a locking problem with
trying to activate so many logical volumes and thin pools
simultaneously.

On Mon, May 14, 2018 at 1:02 AM, Patrick Mitchell
<patricklmitchell9@gmail.com> wrote:
> Sometimes when booting off an Arch installation ISO (even recent
> kernel 4.16.8 & lvm2 2.02.177) LVM's pvscan takes 60-90 minutes.  This
> is with large thin pools, which seems to have caused such delays for
> people in the past, with a fix being adding "--skip-mappings" in
> thin_check_options.
>
> This used to always happen when booting off an ISO, until I made a
> custom one with "--skip-mappings".  With this, it's intermittent.
> Sometimes nearly instant, sometimes 45-90 minutes.
>
> This delay never happens when booting off an install on a drive.  (I'm
> thinking there must be a cache that obviously doesn't exist on the
> ISO?)
>
> When there's a massive delay:
>
> root@archiso ~ # date && ps ax | grep scan
> Mon May 14 03:08:14 UTC 2018
>   717 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:65
>   718 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:19
>   719 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:51
>   720 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:115
>   721 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:99
>   722 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:68
>   724 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:52
>   725 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:49
>   727 ?        S<s    0:00 /usr/bin/lvm pvscan --cache --activate ay 8:67
>   728 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:66
>   731 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:83
>   733 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:50
>   748 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:2
>   752 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:1
>   753 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:3
>   754 ?        S<Ls   0:01 /usr/bin/lvm pvscan --cache --activate ay 8:4
>   755 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:33
>   756 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:36
>   757 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:35
>   759 ?        S<Ls   0:00 /usr/bin/lvm pvscan --cache --activate ay 8:34
>   768 ?        S<Ls   0:01 /usr/bin/lvm pvscan --cache --activate ay 259:1
>
> And iotop shows 0 bytes being read or written for most of it.
>
> Is Arch using pvscan incorrectly?  Is it meant for a process to be ran
> for each device?  Is concurrently running a pvscan for each devicepath
> causing lock contention?  Should Arch be running one instance of
> pvscan without device major and minor block numbers?
>
> Here is Arch's "lvm2-pvscan@.service"
>
> =====
>
> [Unit]
> Description=LVM2 PV scan on device %i
> Documentation=man:pvscan(8)
> DefaultDependencies=no
> StartLimitInterval=0
> BindsTo=dev-block-%i.device
> Requires=lvm2-lvmetad.socket
> After=lvm2-lvmetad.socket lvm2-lvmetad.service
> Before=shutdown.target
> Conflicts=shutdown.target
>
> [Service]
> Type=oneshot
> RemainAfterExit=yes
> ExecStart=/usr/bin/lvm pvscan --cache --activate ay %i
> ExecStop=/usr/bin/lvm pvscan --cache %i
