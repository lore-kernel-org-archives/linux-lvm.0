Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3A896rd021326
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 04:09:06 -0400
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k3A8933G015077
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 04:09:04 -0400
Date: Mon, 10 Apr 2006 10:08:56 +0200 (MEST)
From: "Thomas Meller" <thomas.meller@gmx.net>
MIME-Version: 1.0
References: <20060408211158.56899.qmail@web60411.mail.yahoo.com>
Subject: Re: [linux-lvm] Concise LVM Summary
Message-ID: <16747.1144656536@www056.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

vgdisplay -v <VG>| grep -B2 Total
-?-

> VG home [PE (4MB): 0 (0 b) / 52205 (203.93 GB)]
> LV /dev/home/lvol0 /home [LE: 52205 (203.93 GB); DF: 64G/201G (129G)
> 34%]
> PV /dev/sdb [PE (4096KB): 0 (0 b) / 38156 (149.05 GB); DF: ??/149G (??)
> ??%]
> PV /dev/hdb4 [PE (4096KB): 0 (0 b) / 14049 (54.88 GB); DF: ??/55G (??)
> ??%]
> 
> 
> however, there are a few things I have yet to figure out:
> 
> - determine the actual disk usage of a particular PV in a given LV

> - whether pvdisplay,vgdisplay,lvdisplay offer anything more than
>   pvs, vgs, lvs with all columns displayed

-- 
"Feel free" - 10 GB Mailbox, 100 FreeSMS/Monat ...
Jetzt GMX TopMail testen: http://www.gmx.net/de/go/topmail
