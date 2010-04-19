Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3JGljbn001694
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2010 12:47:45 -0400
Received: from mirapoint7.brutele.be (mirapoint7.brutele.be [212.68.199.151])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3JGlYCd025074
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2010 12:47:35 -0400
Message-ID: <4BCC8925.4090209@tvcablenet.be>
Date: Mon, 19 Apr 2010 18:47:33 +0200
From: =?ISO-8859-1?Q?Fran=E7ois_Valenduc?=
 <francois.valenduc@tvcablenet.be>
MIME-Version: 1.0
References: <4BCAC8B2.7090505@tvcablenet.be> <4BCB8FEE.9030802@cfl.rr.com>
In-Reply-To: <4BCB8FEE.9030802@cfl.rr.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Le 19/04/10 01:04, Phillip Susi a �crit :
> On 04/18/2010 04:54 AM, Fran�ois Valenduc wrote:
>> Hello everybody,
>>
>> I am using gentoo and I use LVM snapshots to make backups of my system.
>> Unfortunately, I always have a problem to remove these. LVM always
>> complains that it can't remove an open logical volume. However, the
>> snapshot is unmounted when I try to remove it. It seems it's only
>> possible to remove the snapshot if the corresponding volume is
>> deactivated. So, I am forced to boot on a live cd to remove the snapshot
>> of my root partition. Is this really normal ?
> 
> No, it is not normal.  Obviously something on your system has the
> snapshot open.  Perhaps it is being auto mounted?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
I would really like to know the process which has the snapshot open.The
script I use to backup my system is the following:

#!/bin/sh
logrotate -v -f /etc/logrotate.conf
vgcfgbackup
lvcreate -L1G -n backup -s /dev/gentoo/root
if [ $? = 0 ]; then
        if [ ! -e /mnt/backup ]; then
                mkdir /mnt/backup
        fi
        mount -o ro /dev/gentoo/backup /mnt/backup
        cd /mnt/backup
        NAME="/home/francois/Backup/gentoo_64_$(date +%F).tar.bz2"
        tar cvfpj ${NAME} --exclude=tmp/* *
        cd /
        umount /mnt/backup
        if [ $? = 0 ]; then
                sync
                lvremove -f gentoo/backup
        fi
fi


So, the snaphot is clearly unmounted before I try to remove it. But I
can almost never remove the snaphot. In fact, I have noticed that if I
don't use the "-f" option, I can remove the snapshot but it always fails
if I use it. But, I would like to use my script without any confirmation
message.

Fran�ois
