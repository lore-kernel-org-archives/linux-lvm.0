Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3K5n7UO029052
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 01:49:07 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3K5mwZi010386
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 01:48:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 5AA2586F89
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 07:48:57 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id kx4VDOClNp8d for <linux-lvm@redhat.com>;
	Tue, 20 Apr 2010 07:48:52 +0200 (CEST)
Date: Tue, 20 Apr 2010 07:48:52 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100420054852.GB1371@maude.comedia.it>
References: <4BCAC8B2.7090505@tvcablenet.be> <4BCB8FEE.9030802@cfl.rr.com>
	<4BCC8925.4090209@tvcablenet.be>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4BCC8925.4090209@tvcablenet.be>
Subject: Re: [linux-lvm] Problem to remove LVM snaphots
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

On Mon, Apr 19, 2010 at 06:47:33PM +0200, Fran�ois Valenduc wrote:
>I would really like to know the process which has the snapshot open.The
did you try checking with fuser or /sys/block/dm-*/holders?

>script I use to backup my system is the following:
unrelated to problem but:

>#!/bin/sh
>logrotate -v -f /etc/logrotate.conf
>vgcfgbackup
>lvcreate -L1G -n backup -s /dev/gentoo/root
>if [ $? = 0 ]; then
>        if [ ! -e /mnt/backup ]; then
>                mkdir /mnt/backup
>        fi
>        mount -o ro /dev/gentoo/backup /mnt/backup
add error checking here
>        cd /mnt/backup
>        NAME="/home/francois/Backup/gentoo_64_$(date +%F).tar.bz2"
>        tar cvfpj ${NAME} --exclude=tmp/* *
ugly wildcards, quote the first and consider using . instead of second

>        cd /
>        umount /mnt/backup
>        if [ $? = 0 ]; then
>                sync
>                lvremove -f gentoo/backup
>        fi
>fi
>
>
>So, the snaphot is clearly unmounted before I try to remove it. But I
>can almost never remove the snaphot. In fact, I have noticed that if I
>don't use the "-f" option, I can remove the snapshot but it always fails
>if I use it. But, I would like to use my script without any confirmation
>message.
>
>Fran�ois
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
