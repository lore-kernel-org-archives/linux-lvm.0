Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4C7WXeL028108
	for <linux-lvm@redhat.com>; Tue, 12 May 2015 03:32:33 -0400
Message-ID: <5551AC90.5080705@redhat.com>
Date: Tue, 12 May 2015 09:32:32 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20150511113519.7570055c@leda.localdomain>
In-Reply-To: <20150511113519.7570055c@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] invalid snapshot with umounted fs
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 11.5.2015 v 11:35 Christian Hesse napsal(a):
> Hello everybody,
>
> I have a backup scripts that creates read-only snapshots from my lvm volumes,
> then runs rsync on them.
>
> This fails for one of my volumes, mount reports an unknown filesystem on the
> snapshot. The only difference compared to my other volumes is the fact that
> it is not mounted by default.
> Mounting the filesystem fixes the problem, the snapshot is valid when created
> from mounted filesystem.
>
> I saw this behavior with lvm2 versions 2.02.116 to 2.02.119. Probably I did
> not have this configuration before, so possibly the problem exists even
> longer.

Hi


You would need to probably pass more data with your email as without metadata 
archive it's quite hard to guess what is going on.

rule #1 is - when you snapshot gets overfilled - it's automatically LOST - 
it's made invalid and any filesystem on it becomes unreadable.

rule #2 - configure & use dmeventd  (see lvm.conf thresholds) to avoid this 
situation to happen.

If you see some other bug - open BZ case (for rawhide if you can't match your 
distro) and fill in  all info - kernel  version, LVM metadata,  dmsetup status 
and so on...

Regards

Zdenek
