Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE26611C5
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 10:43:19 +0000 (UTC)
Received: from dns2.obastrlx.ch (dns2.obastrlx.ch [46.163.74.211])
	by mx1.redhat.com (Postfix) with ESMTP id A0BE5308212B
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 10:43:17 +0000 (UTC)
Received: from obastrlx.obastrlx.ch (localhost.localdomain [127.0.0.1])
	by dns2.obastrlx.ch (Postfix) with ESMTPS id 5B261200929
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 12:43:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by obastrlx.obastrlx.ch (Postfix) with ESMTP id 2B38F1A060
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 12:40:25 +0200 (CEST)
Received: from obastrlx.obastrlx.ch ([127.0.0.1])
	by localhost (obastrlx.obastrlx.ch [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4phoGkE1cqfc for <linux-lvm@redhat.com>;
	Mon,  3 Sep 2018 12:40:24 +0200 (CEST)
Received: from obastrlx.obastrlx.ch (localhost [127.0.0.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by obastrlx.obastrlx.ch (Postfix) with ESMTPSA id 117F81A05F
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 12:40:24 +0200 (CEST)
Date: Mon, 3 Sep 2018 12:40:23 +0200 (CEST)
From: Daniel Etter <daniel@obastrlx.ch>
Message-ID: <1370565024.307.1535971224020@obastrlx.obastrlx.ch>
In-Reply-To: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
References: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Prepend LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello

> Oleksandr Panchuk <panolex@gmail.com> hat am 3. September 2018 um 11:04 geschrieben:
> 
> So, Is there any way to prepend LV with some free space ?

I don't know what a LV with free space should be good for,
but you can achieve this by lvextend.

#lvs  /dev/mapper/system-home
 LV   VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
 home system -wi-ao---- 25.00g

# df -h /home
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/system-home   25G  8.0G   16G  34% /home

# lvextend -L +20G /dev/mapper/system-home
  Size of logical volume system/home changed from 25.00 GiB (6400 extents) to 45.00 GiB (11520 extents).
  Logical volume home successfully resized

# df -h /home
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/system-home   25G  8.0G   16G  34% /home

# lvs /dev/mapper/system-home
  LV   VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  home system -wi-ao---- 45.00g                                                    


Daniel
