Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87BnSoh013679
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 07:49:28 -0400
Received: from osl1smout1.broadpark.no (osl1smout1.broadpark.no [80.202.4.58])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87BnQmx007923
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 07:49:27 -0400
Received: from osl1sminn1.broadpark.no ([80.202.4.59])
	by osl1smout1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0J57003TFY1MWF90@osl1smout1.broadpark.no> for
	linux-lvm@redhat.com; Thu, 07 Sep 2006 12:48:58 +0200 (CEST)
Received: from [192.168.94.233] ([195.212.29.179]) by osl1sminn1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21
	2004)) with ESMTPA id <0J57003C1Y1LA430@osl1sminn1.broadpark.no> for
	linux-lvm@redhat.com; Thu, 07 Sep 2006 12:48:58 +0200 (CEST)
Date: Thu, 07 Sep 2006 12:47:38 +0200
From: Morten Torstensen <morten@mortent.org>
Subject: Re: [linux-lvm] pvmove: moving a mirror logical volume not supported?
In-reply-to: <20060906161917.GP13859@agk.surrey.redhat.com>
Message-id: <44FFF8CA.5090906@mortent.org>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <200609061114.13521.jens.wilke@de.ibm.com>
	<20060906161917.GP13859@agk.surrey.redhat.com>
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Wed, Sep 06, 2006 at 11:14:13AM +0200, Jens Wilke wrote:
>> What is the reason for this?
> 
> No code to do this has yet been written.
> There should be no fundamental problems with doing it.

pvmove is a wrong approach to the problem too, imo. PVs are just storage devices 
for a VG. By moving LVs (or the PEs that the LV resides on), you accomplish the 
same. When there are no PE in use on a PV, it is easy enough to reduce the VG to 
remove the PV.

Like in this scenario when you want to move a VG from an internal disk to, let's 
say SAN volume (with pseudo-commands):

Assuming VG is pn /dev/scsi and new disk is /dev/sandisk.

# extendvg myvg /dev/sandisk
# lvmirror myvg copies=1 strict=1

(one mirror, allocate strict so copies are on different PVs)

Now check that LVs are in sync and that all is OK with the new disk...

# lvmirror myvg copies=0 remove=/dev/scsi
# reducevg myvg /dev/scsi

This strategy would assume that mirroring is done in PE/LE mapping levels.

I have no idea if Linux LVM mirroring supports this. If anyone have links to 
good LVM docs for the mirroring features that will come with LVM in RHEL5 I 
would appreciate it.


-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: Cartoon@jabber.no morten.torstensen@gmail.com

And if it turns out that there is a God, I don't believe that he is evil.
The worst that can be said is that he's an underachiever.
