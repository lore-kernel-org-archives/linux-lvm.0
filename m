Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 450DF63761
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 08:15:22 +0000 (UTC)
Received: from sonic315-10.consmr.mail.gq1.yahoo.com
	(sonic315-10.consmr.mail.gq1.yahoo.com [98.137.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9681881E02
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 08:15:16 +0000 (UTC)
Date: Fri, 15 Sep 2017 08:15:13 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <914479528.2618507.1505463313888@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <914479528.2618507.1505463313888.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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


>  From the two proposed solutions (lvremove vs lverror), I think I would  prefer the second one.

I vote the other way. :)
First because 'remove' maps directly to the DM equivalent action which brought this about. Second because you are in fact deleting the object - ie it's not coming back. That it returns a nice and timely error code up the stack instead of the kernel doing 'wierd things' is an implementation detail.

Not to say 'lverror' might have a use of it's own as a "mark this device as in an error state and return EIO on every OP". Which implies you could later remove the flag and IO could resume subject to the higher levels not having already wigged out in some fashion. However why not change the behavior of 'lvchange -n' to do that on it's own on a previously activated entry that still has a ref count > 0? With '--force' of course

With respect to freezing or otherwise stopping further I/O to LV being used by virtual machines, the only correct/sane solution is one of 'power off' or 'suspend'. Reaching into the VM to freeze individual/all filesystems but otherwise leave the VM running assumes significant knowledge of the VM's internals and the luxury of time.
