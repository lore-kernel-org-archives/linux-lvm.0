Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1K4q75h005446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 23:52:07 -0500
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mx1.redhat.com (Postfix) with ESMTPS id 3CEEF552E7
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 04:52:06 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id j78so65737815lfb.1
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 20:52:06 -0800 (PST)
Received: from [10.42.0.193] (15.convex.ru. [82.193.154.227])
	by smtp.gmail.com with ESMTPSA id 73sm1945859lfu.9.2016.02.19.20.52.03
	for <linux-lvm@redhat.com> (version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 20:52:03 -0800 (PST)
From: =?koi8-r?B?7cHSyyDrz9LFzsLF0sc=?= <socketpair@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <54E9CBBC-3CB2-461E-BD0B-6BB9B52D9A25@gmail.com>
Date: Sat, 20 Feb 2016 09:52:03 +0500
References: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
	<56C77BAC.5010702@gmail.com>
In-Reply-To: <56C77BAC.5010702@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


> 20 ����. 2016 �., � 1:31, Zdenek Kabelac <zdenek.kabelac@gmail.com> �������(�):
> 
> Dne 19.2.2016 v 19:40 Lentes, Bernd napsal(a):
>> Hi,
>> 
>> i have a script in which i invoke lvremove and lvcreate. With lvremove i don't have proplems but with lvcreate.
>> I'm redirecting stdout and stderr to a file because the script is executed by cron and i'd like to have a look afterwards if everything went fine.
>> The command is: lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection.log 2>&1. Shell does not accept further commands afterwards, but host still responds to ping. You can have a look on lvcreate_with_redirection.log here: https://hmgubox.helmholtz-muenchen.de:8001/d/b4c7025bac/ .
>> System seems to stop while suspending.
>> 
>> last lines of the log:
>> ======================================================
>> 
>> ...
>>     Creating vg1-lv_root_snapshot-cow
>>     Loading vg1-lv_root_snapshot-cow table (252:3)
>>     Resuming vg1-lv_root_snapshot-cow (252:3)
>>     Loading vg1-lv_root_snapshot table (252:1)
>>     Suspending vg1-lv_root (252:0) with filesystem sync with device flush
>> ======================================================
> 
> 
> Unfortunately you can't do that if you log to the SAME volume you are suspending - i.e. you run your command from your root volume
> which is also suspended.
> 
> We could likely 'buffer' the output while in suspend mode,
> and throw out the output later - but as this is seen as 'debug' help it's assume user takes care and user place for logging which doesn't block.
> 
> So if you want to see logs - use something tmpfs location for it.

Why this happen ? I thought that operations with page cache will not be suspended on fsfreeze(). 

> 
> Regards
> 
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
