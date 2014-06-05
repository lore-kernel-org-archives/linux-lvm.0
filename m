Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s55AVOiZ003404
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 06:31:24 -0400
Message-ID: <539046FB.8090701@redhat.com>
Date: Thu, 05 Jun 2014 12:31:23 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1208338730.18211142.1401956193776.JavaMail.zimbra@redhat.com>	<1862191909.18215030.1401956807760.JavaMail.zimbra@redhat.com>	<53903637.5030800@redhat.com>
	<1021489358.18243958.1401960596909.JavaMail.zimbra@redhat.com>
In-Reply-To: <1021489358.18243958.1401960596909.JavaMail.zimbra@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] File-system uuid on LVM snapshot
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

Dne 5.6.2014 11:29, Rajesh Joseph napsal(a):
> Thanks Zdenek for the quick reply.
>
> We are using thin volumes and thin snapshot, but we need all or most snapshots active. Therefore we are enabling the snapshot by-default.
> As you suggested we can have a workaround to mount those snapshot volumes by using 'nouuid' option.
> But the problem is in most of our use case the origin volume is mounted using the /etc/fstab. And here the mount entry is made using UUID.
> So in some cases instead of Origin volume the snapshot volume get mounted.


So this rather looks like you are not using  'snapshot' as snapshot but rather 
as a quick COW device clone - where you obviously need to change identifiers, 
since they are used later independently. (something like we do with 
'vgimportclone' where we duplicate VG)

Maybe it might be worth to think about fsadm extension to support filesystem 
cloning as a built-in feature which would handle change if fs UUID across 
different filesystems...

Regards

Zdenek
