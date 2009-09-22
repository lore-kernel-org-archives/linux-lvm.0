Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MDGLow010386
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 09:16:21 -0400
Received: from relay03.mail-hub.dodo.com.au (relay03.mail-hub.dodo.com.au
	[123.2.6.238])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MDGBeX009624
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 09:16:12 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay03.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1Mq5Dx-0002xf-KI
	for linux-lvm@redhat.com; Tue, 22 Sep 2009 23:16:10 +1000
From: Hugh <whobedobe@dodo.com.au>
Subject: Re: [linux-lvm] grow lv bug
Date: Tue, 22 Sep 2009 23:16:02 +1000
References: <200909220808.16458.whobedobe@dodo.com.au>
	<20090921223257.GB22590@us.ibm.com>
	<20090921224718.GH1210@agk-dp.fab.redhat.com>
In-Reply-To: <20090921224718.GH1210@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909222316.02416.whobedobe@dodo.com.au>
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
Content-Type: Text/Plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday 22 September 2009 08:47:18 Alasdair G Kergon wrote:
> On Mon, Sep 21, 2009 at 03:32:57PM -0700, malahal@us.ibm.com wrote:
> > DevSize is smaller than PSize!
> 
> Yes, we've seen a few of these recently.
> Would be useful if the reporters gave more background context to see
> if there are any common factors between the cases that could lead to
> mitigation.
> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
Simple Alasdair, why didn't you ask in the first place.

I added 20G of space to the vmware virtual drive.
pvresize - success
vgresize - success
and then I tried to do a lvresize but it failed.

I didn't understand your original answer but Marian was a bit clearer, however 
I'm still confused and I can't fix my drive.

There are so many fs types and they race them through fedora. I realise this 
isn't your problem but I'm left not knowing how to fix this. I tried gparted 
but it can't resize lvms and I don't know how to resize my sdb2. Could you 
offer any help or point me to a dummies guide since this is a lvm partition. I 
found a guide to resize an ext3 or ext2, but not lvm and I don't know if it 
will break if I try to delete the partition and recreate it?

HYCH,

Hugh
