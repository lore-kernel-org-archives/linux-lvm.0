Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77JfqZB021818
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:41:52 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m77Jfqf6015172
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:41:52 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KRBMu-0006aJ-1i
	for linux-lvm@redhat.com; Thu, 07 Aug 2008 20:41:52 +0100
Date: Thu, 7 Aug 2008 20:41:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way to
	increase PV metadatasize?
Message-ID: <20080807194151.GT7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1218132476.4013.10.camel@dogen.thepride.>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Aug 07, 2008 at 07:07:56PM +0100, John Leach wrote:
> As I understand, this is because the PVs don't have enough space for the
> metadata.  This size can be set to a larger value when pvcreating with
> --metadatasize but I have obviously missed that boat :)
> Is there a way to increase this with live PVs, rather than shifting all
> the data off them and recreating and shifting back on?
 
Unfortunately there is no way to increase this retrospectively.
Nor have we written tools to manipulate metadata areas yet.

You might be able to take steps to make the metadata smaller if you have
long names you can shorten or fragmented LVs that can be defragmented with a
sequence of pvmoves.

> I have a multinode RedHat Cluster with CLVMD and two PVs.  I can add
> additional PVs if that helps (though as I understand *every* PV needs
> enough metadata space).

You're right that the best option is to add more PVs.

Roughly:

Create a new PV with a much larger metadata area, add it to the VG,
then stop using the too-small metadata areas on the old PVs.

For extra resiliance it might be wise to add two PVs so you have two
copies of the metadata, or use the pvcreate option to have 2 metadata
copies on the single PV you're adding, one at the front and ane at the end.

To remove the metadata areas you need to:

   get an up-to-date metadata backup (vgcfgbackup)

  pvcreate --restorefile pointing at a copy of that backup file requesting 0 metadata areas
and specifying the same uuid as it had before

  vgcfgrestore from the backup file
 
Alasdair
-- 
agk@redhat.com
