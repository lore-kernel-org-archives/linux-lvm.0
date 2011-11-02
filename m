Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA2HvErI006210
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 13:57:14 -0400
Received: from lead.spiritone.com (lead.spiritone.com [216.99.193.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2HvDGE023881
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 13:57:13 -0400
Received: from toto.seitzassoc.com (helium.seitzassoc.com [216.99.217.243])
	by lead.spiritone.com (Postfix) with ESMTP id 45A234035
	for <linux-lvm@redhat.com>; Wed,  2 Nov 2011 10:57:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by toto.seitzassoc.com (Postfix) with ESMTP id 5DDA910137
	for <linux-lvm@redhat.com>; Wed,  2 Nov 2011 10:57:10 -0700 (PDT)
Message-ID: <4EB18475.5040202@seitzassoc.com>
Date: Wed, 02 Nov 2011 10:57:09 -0700
From: Galen Seitz <galens@seitzassoc.com>
MIME-Version: 1.0
References: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without
 a	Logical	Volume Group ?
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

Dan White wrote:
> ----- James Hawtin <oolon@ankh.org> wrote:
> 
> I had to reboot the machine to "see" the expanded LUN. I used fdisk
> to make a partition out of the LUN expansion, but I had to reboot
> again before I could do anything further. After the second reboot,
> I was able to make a PV out of the new partition, roll it into the
> existing VG and then expand the two test LV's I had previously
> created to utilize the new elbow room.
> 
> This is on a RHEL 5.7 system.
> 
> Is there a way to do this without the rebooting ?

I don't know about the first reboot(not a SAN/LUN user), but I would
expect the second reboot could be avoided by running partprobe.

-- 
Galen Seitz
galens@seitzassoc.com
