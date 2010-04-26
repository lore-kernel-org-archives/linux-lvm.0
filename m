Message-ID: <4BD56365.7020007@redhat.com>
Date: Mon, 26 Apr 2010 11:56:53 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4BCAC8B2.7090505@tvcablenet.be> <4BCB8FEE.9030802@cfl.rr.com>
	<4BCC8925.4090209@tvcablenet.be>
In-Reply-To: <4BCC8925.4090209@tvcablenet.be>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-1?Q?Fran=E7ois_Valenduc?= <francois.valenduc@tvcablenet.be>

Dne 19.4.2010 18:47, Fran�ois Valenduc napsal(a):
> Le 19/04/10 01:04, Phillip Susi a �crit :
>> On 04/18/2010 04:54 AM, Fran�ois Valenduc wrote:
>>> Hello everybody,
>>>
>>> I am using gentoo and I use LVM snapshots to make backups of my system.
>>> Unfortunately, I always have a problem to remove these. LVM always
>>> complains that it can't remove an open logical volume. However, the
>>> snapshot is unmounted when I try to remove it. It seems it's only
>>> possible to remove the snapshot if the corresponding volume is
>>> deactivated. So, I am forced to boot on a live cd to remove the snapshot
>>> of my root partition. Is this really normal ?
>>
>> No, it is not normal.  Obviously something on your system has the
>> snapshot open.  Perhaps it is being auto mounted?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> I would really like to know the process which has the snapshot open.The
> script I use to backup my system is the following:
> 
> #!/bin/sh
> logrotate -v -f /etc/logrotate.conf
> vgcfgbackup
> lvcreate -L1G -n backup -s /dev/gentoo/root
> if [ $? = 0 ]; then
>         if [ ! -e /mnt/backup ]; then
>                 mkdir /mnt/backup
>         fi
>         mount -o ro /dev/gentoo/backup /mnt/backup
>         cd /mnt/backup
>         NAME="/home/francois/Backup/gentoo_64_$(date +%F).tar.bz2"
>         tar cvfpj ${NAME} --exclude=tmp/* *
>         cd /
>         umount /mnt/backup
>         if [ $? = 0 ]; then
>                 sync
>                 lvremove -f gentoo/backup
>         fi
> fi
> 
> 
> So, the snaphot is clearly unmounted before I try to remove it. But I
> can almost never remove the snaphot. In fact, I have noticed that if I
> don't use the "-f" option, I can remove the snapshot but it always fails
> if I use it. But, I would like to use my script without any confirmation
> message.

Sounds like udev problem.  Most probably gentoo stepped into the udev
mine-field. It's hard to give a good advice - udev currently has its problems.

You may try to experiment - try to disable udev to see whether it helps in
this script case and renable after the script...

Zdenek
