Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99DDD1992A
	for <linux-lvm@redhat.com>; Wed,  2 Jan 2019 15:23:45 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D89CD2D808
	for <linux-lvm@redhat.com>; Wed,  2 Jan 2019 15:23:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b20so21168798lfa.12
	for <linux-lvm@redhat.com>; Wed, 02 Jan 2019 07:23:43 -0800 (PST)
MIME-Version: 1.0
References: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
	<807b41c03c2d66e16153a8ee3489b4f1@assyoma.it>
	<167bde59673.fc2fc0a351387.5941487526649049402@vacanti.org>
In-Reply-To: <167bde59673.fc2fc0a351387.5941487526649049402@vacanti.org>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 2 Jan 2019 09:23:30 -0600
Message-ID: <CAAMCDecQo9NV_JjufQmk6Wj7pL3xam2xqR7G60EXsDAHi+_mCA@mail.gmail.com>
Subject: Re: [linux-lvm] PV not found
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
To: giuseppe@vacanti.org, LVM general discussion and development <linux-lvm@redhat.com>

Disable lvmetad (in systemctl and by editing lvm.conf to not use metad).

I have had lvmetad cause disks to not get detected on boot up on
several reboots. Restarting it will fix it sometimes and then doing a
vgchange -ay afterwards enabled the lvs.  It is easiest to just
disable it as I believe I have seen notes indicating lvmetad is being
moved away from.

On Wed, Jan 2, 2019 at 4:11 AM Giuseppe Vacanti <giuseppe@vacanti.org> wrote:
>
> Hello,
>
> I have found a solution to the problem, however the problem seems to come back after every reboot.
>
> I have been put on the good path by the remarks made on this list by John and Gionatan.
>
> The fix is the following:
>
> - convince myself that the device has the correct uuid, I used blkid and compared the result with the information in the lvm backup
> - run pvck -t on /dev/sdc. Nothing special, all seems OK
> - run vgscan --cache. This command brings back knowledge of the VG the PV belongs to
> - now pvs lists my PV again, but the LV is inactive
> - I activate the LV with lvchange
> - all is back, I can mount and use the LV
>
> After a reboot however the information about the VG is gone again, and I have to repeat the steps above to be able to use the LV.
>
> I have a running system, but I don't know what is happening. Where can I look to figure this out?
>
> Regards, Giuseppe
>
> --
> Giuseppe Vacanti
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
