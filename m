Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5A5mNT3005813
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:48:23 -0400
Received: from csmtp2.one.com (csmtp2.one.com [195.47.247.206])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5A5m7Wd007093
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:48:08 -0400
Received: from [10.61.88.5] (64-103-25-233.cisco.com [64.103.25.233])
	by csmtp2.one.com (Postfix) with ESMTP id 0A89A16000BFB
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 05:48:06 +0000 (UTC)
Message-ID: <4A2F4916.6090604@nektulos.de>
Date: Wed, 10 Jun 2009 07:48:06 +0200
From: Stefan Radovanovici <stefan@nektulos.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvremove won't work
References: <4A2E0396.4030006@nektulos.de>	<20090609065405.GB10101@maude.comedia.it>	<4A2E096F.1010203@nektulos.de>	<1244540783.18101.184.camel@breeves.fab.redhat.com>	<4A2E3886.2000604@nektulos.de>
	<20090610053839.GB18433@maude.comedia.it>
In-Reply-To: <20090610053839.GB18433@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: stefan@nektulos.de,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 6/10/2009 7:38 AM, Luca Berra wrote:
>> I think I somehow messed up while trying to get rid of /dev/sda4. I
>> used a GUI for this not the CLI, first I tried to move the extents to
>> other PVs (which I think is that pvmove does) and then to actually
>> remove it from the group (which is probably what vgreduce does). If I
>> am not mistaken, the first operation gave an error even though it
>> appeared to have worked somehow at the time.
>>
> it seems to be some leftover from the pvmove operation, unfortunately i
> have no idea if some data was not actually moved correctly.
> did you record the error message the pvmove operation reported?

No, unfortunately not, it was just a popup in that GUI. The LVM is mounted now, with only the 2 remaining partitions as PVs, and so far the data seems to be in order so maybe pvmove worked. I guess I will live it at that and when the time comes, I will just remove the failing disk from the system.

Regards,
Stefan
