Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s559JqKN020905
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 05:19:52 -0400
Message-ID: <53903637.5030800@redhat.com>
Date: Thu, 05 Jun 2014 11:19:51 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1208338730.18211142.1401956193776.JavaMail.zimbra@redhat.com>
	<1862191909.18215030.1401956807760.JavaMail.zimbra@redhat.com>
In-Reply-To: <1862191909.18215030.1401956807760.JavaMail.zimbra@redhat.com>
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

Dne 5.6.2014 10:26, Rajesh Joseph napsal(a):
> Hi all,
>
> Origin volume and snapshot volume share the same file-system UUID. So after the snapshot we fix the uuid by running xfs_admin or tune2fs.
> Do you have any recommendation or best practice in this regard?
>


With thin pools and thin volumes - snapshot of thin volume is now created 
'inactive' and it's skipped from default activation  (you could always 
override skip with -K  i.e. : lvchange -ay -K vg/mythinsnap)

So with thins you should mostly have only a single volume active with the FS 
UUID.  If you happen to have multiple volumes active and you need to mount xfs 
filesystem  - use  'nouuid' (and eventually  norecovery for read-only 
activated snapshots)  mount options.

For old-snapshosts - all volumes need to be available/active - so you need to 
use 'nouuid' option always.

I don't see much point in changing  FS UUID on your snapshot - unless of 
course you plan to use snapshots as different volumes with just a 'single' 
starting point  (i.e. preinstalled tree of files)

Regards

Zdenek
