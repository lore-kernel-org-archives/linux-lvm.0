Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2KLjHpd029383
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2012 17:45:17 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2KLjFTv014443
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2012 17:45:15 -0400
Date: Tue, 20 Mar 2012 16:45:13 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120320164513.367ccae8@bettercgi.com>
In-Reply-To: <1331852453111518500@businessgrade.com>
References: <1331852453111518500@businessgrade.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Storage Virtualization and LVM
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
To: eneal@businessgrade.com, LVM general discussion and development <linux-lvm@redhat.com>

Since noone else replied I thought I'd share my thoughts and 
invite you to share your experience. If you export the LVs, not 
the PVs, XCP doesn't see the PVs and therefore sees the LVs as 
iscsi LUNs, not as LVs, it won't see the metadata.  The storage
server is writing to the metadata and the snapshot, but not to the 
LV. The XCP is writing to the LV (as an iscsi LUN), but not to the 
snapshot or the metadata. Therefore you're OK because you don't have 
two machines writing to the same thing.

On the other hand, if you export the PVs so that both machines see the
LVs as LVs, meaning both machines see the metadata, then you'd need to
use clvm. (clustered LVM).

I'm not an expert, but I believe the above to be accurate. I plan 
to do the same thing, but had some trouble getting the SCST driver for
Marvell SAS working or LSI/MPT working. The idea was that the initiator 
would then see the LUN as an ordinary disk connected to the SAS
controller. It could therfore boot from that "SAS drive" (actually a
LUN on another machine) without any special drivers being required on
the initiator side. That would be much simpler on the initiator side
than booting from iscsi or similar. In that way, any arbitrary virtual
machine could be run on bare metal by simply exporting it's image
thriough the SCST SAS interface.

I would be interested to hear of your experience - any problems you run
into or even better if you don't have any problems.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 15 Mar 2012 19:00:53 -0400
Errol Neal <eneal@businessgrade.com> wrote:

> 
> Hola.
> I've been doing something in my virtualization environment and I
> thought I better check with the experts before I continue my pratices
> and run into issues. I use SCST to carve out luns via iSCSI and FC to
> servers in my environment. Generally I will take a hardware RAID
> volume from the controller, create a volume group and a number of
> logical volumes and share those out to servers using the targets I
> mentioned above. Most of these servers are running XCP and they also
> use LVM and the VG and LVs are not only visible on the initiator but
> also on the target. So here is where I need so help understanding if
> I'm doing something "bad" or something that could create scenarios
> where data can be corrupted. I've begun doing off-host backups by
> using partclone, nfsclone and dd from the SCST server. I just create
> a snapshot of the visible LV associated with the XCP SR and then run
> partclone or ntfsclone, depending upon the OS on the snapshot. My
> question is around the snapshot. Since the snapshot was not created
> on the XCP host but on the storage server, how does the kernel on the
> XCP host react? Could my practices result data being corrupted?
> 
> Thanks in advance for your thoughts..
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
