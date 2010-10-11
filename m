Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BHfKhq002696
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 13:41:20 -0400
Received: from smtp102-mob.biz.mail.ne1.yahoo.com
	(smtp102-mob.biz.mail.ne1.yahoo.com [98.138.88.35])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o9BHf9Ld020817
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 13:41:10 -0400
Message-ID: <885926.3862.qm@smtp102-mob.biz.mail.ne1.yahoo.com>
MIME-Version: 1.0
content-class: 
From: <beswars@yahoo.com>
Date: Mon, 11 Oct 2010 10:41:22 -0700
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Lvm Strange Problem
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>



Sent from my HTC Touch Pro2 on the Now Network from Sprint�.

-----Original Message-----
From: J�rg Stephan <ml@johestephan.de>
Sent: Monday, October 11, 2010 7:23
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Lvm Strange Problem


> I believe your problem is with your SAN, not LVM (you did mention using iSCSI).
> I'm talking about SAN snapshots, not LVM snapshots (although the SAN server 
> could very well use LVM underneath).  The SAN volumes have no names, just
> LUNs.  At boot, they are searched for a matching UUID, just like directly
> attached physical volumes.  When taking a SAN snapshot (clone), the UUID
> of the clone is the same as the original, whether a filesystem or VG is
> on the SAN LUN.
>
>   

Okay, but we dont use SAN snapshots, we use an lvcreate --snapshot on
the client. So the storage just dont know about them.

What happens is, we lv snapshot a volume, mount it copy the data to the
new volume we create after snapshooting the source, remove the old
snapshot and turning of the new machine. It rans about half an year,
gets stoped, and after it turning on again the lvm data on the iscsi
volume is last cahnged on the 23 februar 2010, even if the snapshot was
made much earlier.

Greets

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
