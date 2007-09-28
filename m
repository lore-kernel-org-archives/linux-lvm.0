Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	l8S7Cxns013006
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2007 17:12:59 +1000
Message-ID: <46FCA97B.9000109@gmail.com>
Date: Fri, 28 Sep 2007 17:12:59 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on a share environnement (SAN inside)
References: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>	<46FBEA1B.7070905@stercomm.com>
	<290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
In-Reply-To: <290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

hubert chomette wrote:
> the two machine use the same lun, on this lun, there is one vg with a 
> logical volume by virtual machine (10 virtual machine).
> The idea is if one xen is down, the other can launch the virtual machine 
> ad continu service.

So its a high-availability cluster...

>>> - Is it possible to allow LVM metadata modification by only one server?
>>> - should I use clvm instead?

The link below describes what can happen.

http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html

It sounds like you should be using CLVM. CLVM extends LVM2 to provide 
cluster-wide management of Logical Volumes. LVM and CLVM are essentially 
the same thing, but CLVM is cluster aware, LVM is not.

Alasdair has some presentations which describe CLVM in detail here:

http://people.redhat.com/agk/talks/CLVM-UKUUG2007/

>>> - Is it possible to migrate lvm to clvm without any data lost?

There's no migration involved, you just need to enable cluster locking 
for the shared volume group.

eg: vgchange -c y VolumeGroupName

--Dave
