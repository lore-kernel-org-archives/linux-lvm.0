Received: from mx4-phx2.redhat.com (mx02.colomx.prod.int.phx2.redhat.com
	[10.5.7.2])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s559TuqI026343
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 05:29:56 -0400
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id s559Tubk031847
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 05:29:56 -0400
Date: Thu, 5 Jun 2014 05:29:56 -0400 (EDT)
From: Rajesh Joseph <rjoseph@redhat.com>
Message-ID: <1021489358.18243958.1401960596909.JavaMail.zimbra@redhat.com>
In-Reply-To: <53903637.5030800@redhat.com>
References: <1208338730.18211142.1401956193776.JavaMail.zimbra@redhat.com>
	<1862191909.18215030.1401956807760.JavaMail.zimbra@redhat.com>
	<53903637.5030800@redhat.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Zdenek for the quick reply.

We are using thin volumes and thin snapshot, but we need all or most snapshots active. Therefore we are enabling the snapshot by-default.
As you suggested we can have a workaround to mount those snapshot volumes by using 'nouuid' option.
But the problem is in most of our use case the origin volume is mounted using the /etc/fstab. And here the mount entry is made using UUID.
So in some cases instead of Origin volume the snapshot volume get mounted.

Thanks & Regards,
Rajesh

----- Original Message -----
> From: "Zdenek Kabelac" <zkabelac@redhat.com>
> To: linux-lvm@redhat.com
> Sent: Thursday, June 5, 2014 2:49:51 PM
> Subject: Re: [linux-lvm] File-system uuid on LVM snapshot
> 
> Dne 5.6.2014 10:26, Rajesh Joseph napsal(a):
> > Hi all,
> >
> > Origin volume and snapshot volume share the same file-system UUID. So after
> > the snapshot we fix the uuid by running xfs_admin or tune2fs.
> > Do you have any recommendation or best practice in this regard?
> >
> 
> 
> With thin pools and thin volumes - snapshot of thin volume is now created
> 'inactive' and it's skipped from default activation  (you could always
> override skip with -K  i.e. : lvchange -ay -K vg/mythinsnap)
> 
> So with thins you should mostly have only a single volume active with the FS
> UUID.  If you happen to have multiple volumes active and you need to mount
> xfs
> filesystem  - use  'nouuid' (and eventually  norecovery for read-only
> activated snapshots)  mount options.
> 
> For old-snapshosts - all volumes need to be available/active - so you need to
> use 'nouuid' option always.
> 
> I don't see much point in changing  FS UUID on your snapshot - unless of
> course you plan to use snapshots as different volumes with just a 'single'
> starting point  (i.e. preinstalled tree of files)
> 
> Regards
> 
> Zdenek
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
