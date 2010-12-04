Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oB4JeahJ001726
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:40:36 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB4JeSeP020396
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:40:28 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1POxy7-0005Vo-SY
	for linux-lvm@redhat.com; Sat, 04 Dec 2010 11:40:28 -0800
Date: Sat, 04 Dec 2010 13:40:27 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <201012042006.46803.d_baron@012.net.il> (from
	d_baron@012.net.il on Sat Dec  4 12:06:46 2010)
Message-Id: <1291491627.8066.13@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] "Condensing" Physical Volumes
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

   A followup for the case where it's the filesystems that
have free space.  This is an example of reclaiming space where
the file  system has free space.  That filesystem is on a partition,
which is part of a logical volume.  We shrink from the inside
out - first the filesystem, then the partition, then the logical
volume.  If you don't have partitions within your LVs, skip that part.


#!/bin/sh


PATH="$PATH:/sbin:/root/bin"
export PATH

VG=bob

if [ -z "$2" ]
then
     echo "usage: $0 name size_in_gb (dh -h, NOT df -H)"
     exit
fi

name=$1
fssize=$2

echo "called clone_shrink $name $fssize"

kpartx -p '' -a /dev/mapper/${VG}-${name}
mount /dev/mapper/${VG}-${name}1 && sleep 2 &&
used=`df -P -BG | grep "$name" | awk '{ print \$3 }' | sed 's@G@@'` &&

if [ $used -gt $fssize ]
then
     echo "$name is using $used G, which is more than $fssize G" 1>&2
     exit 1
fi

/dev/mapper/${VG}-${name}1 &&
kpartx -dv -p '' /dev/mapper/${VG}-${name} && sleep 2 &&

# filesystem overhead
partsize=`perl -e "print int($fssize * 1.04)"` &&
vgsize=`expr $partsize + 1` &&


lvchange -ay $VG/$name &&
kpartx -p '' -a /dev/mapper/$VG-${name} &&
e2fsck -fp /dev/mapper/$VG-${name}1 2>/dev/null &&
resize2fs /dev/mapper/$VG-${name}1 ${fssize}G &&
e2fsck -fp /dev/mapper/$VG-${name}1 2>/dev/null
kpartx -p '' -d /dev/mapper/$VG-${name} &&
kpartx -p 'p' -d /dev/mapper/$VG-${name} &&

# If changing to parted or other, these are 1024 GB, not 1000 GB
lvchange -an $VG/$name &&
lvchange -ay $VG/$name &&
echo -e "d\nn\np\n1\n63\n+${partsize}GB\na\n1\np\nw\n | fdisk -u -S 63  
/dev/mapper/$VG-${name}"
echo -e "d\nn\np\n1\n63\n+${partsize}GB\na\n1\np\nw\n" | fdisk -u -S 63  
/dev/mapper/$VG-${name}
kpartx -p '' -d /dev/mapper/$VG-${name} &&
kpartx -p 'p' -d /dev/mapper/$VG-${name}


lvchange -an $VG/${name} &&
lvreduce -L ${vgsize}G $VG/${name} &&
lvchange -ay $VG/${name}

   The above commands are slightly adjusted from a script we use.
They may not be right for your situation.  They may not be right at all.
You should read and fully understand all commands before running them.

   Note particularly that due to overhead, 1000 vs. 1024, or other
reasons, the size of each container may need to be specified as being
a little larger than what it is supposed to contain.  Be very careful
when reducing the size of things - you could cut the end off of your
filesystems.  Also be sure you are familiar with vgcfgbackup,  
vgcfgrestore,
and other tools for undoing what you've done in case of problems.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 12/04/2010 12:06:46 PM, David Baron wrote:
> I need more extents to move stuff off older, possibly failing IDE  
> disks to my
> new SATA terrabyter. However, not enough extents are available. The  
> disk is
> very sparsely populated.
> 
> Is there any way to "condense" physical volumes to recover/expose  
> empty
> extents in order to make use of them?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
