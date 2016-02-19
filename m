Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1JKVjQo009808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 15:31:45 -0500
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mx1.redhat.com (Postfix) with ESMTPS id 19361627D0
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 20:31:44 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c200so92692508wme.0
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 12:31:44 -0800 (PST)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102])
	by smtp.gmail.com with ESMTPSA id v2sm9150566wmd.24.2016.02.19.12.31.40
	for <linux-lvm@redhat.com> (version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 12:31:41 -0800 (PST)
References: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56C77BAC.5010702@gmail.com>
Date: Fri, 19 Feb 2016 21:31:40 +0100
MIME-Version: 1.0
In-Reply-To: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] problem with lvcreate and redirection
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
To: linux-lvm@redhat.com

Dne 19.2.2016 v 19:40 Lentes, Bernd napsal(a):
> Hi,
>
> i have a script in which i invoke lvremove and lvcreate. With lvremove i don't have proplems but with lvcreate.
> I'm redirecting stdout and stderr to a file because the script is executed by cron and i'd like to have a look afterwards if everything went fine.
> The command is: lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection.log 2>&1. Shell does not accept further commands afterwards, but host still responds to ping. You can have a look on lvcreate_with_redirection.log here: https://hmgubox.helmholtz-muenchen.de:8001/d/b4c7025bac/ .
> System seems to stop while suspending.
>
> last lines of the log:
> ======================================================
>
> ...
>      Creating vg1-lv_root_snapshot-cow
>      Loading vg1-lv_root_snapshot-cow table (252:3)
>      Resuming vg1-lv_root_snapshot-cow (252:3)
>      Loading vg1-lv_root_snapshot table (252:1)
>      Suspending vg1-lv_root (252:0) with filesystem sync with device flush
> ======================================================
>


Unfortunately you can't do that if you log to the SAME volume you are 
suspending - i.e. you run your command from your root volume
which is also suspended.

We could likely 'buffer' the output while in suspend mode,
and throw out the output later - but as this is seen as 'debug' help it's 
assume user takes care and user place for logging which doesn't block.

So if you want to see logs - use something tmpfs location for it.

Regards


Zdenek
