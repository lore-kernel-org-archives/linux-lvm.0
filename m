Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2F6DY2019885
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 11:06:13 -0400
Received: from qmta15.westchester.pa.mail.comcast.net
	(qmta15.westchester.pa.mail.comcast.net [76.96.59.228])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2F6CCC021949
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 11:06:12 -0400
Date: Wed, 2 Nov 2011 15:06:12 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <4EB15A20.9000109@ankh.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a
	Logical	Volume Group ?
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

----- James Hawtin <oolon@ankh.org> wrote:
> Marek Podmaka wrote:
> >
> > My question was about if it is possible to change the partition table
> > (extend partition or add new partition) while using the PV in
> > activated VG.
> >
> >   
> 
> Yes it is possible however like with all things some times it does not 
> work and the kernel fails to re-read it, this can also happen with 
> resizing disks, and sometimes online lun presentation does not work either.
> 
> James

I just experienced that.

I had to reboot the machine to "see" the expanded LUN.
I used fdisk to make a partition out of the LUN expansion, but I had to reboot again before I could do anything further.
After the second reboot, I was able to make a PV out of the new partition, roll it into the existing VG and then expand the two test LV's I had previously created to utilize the new elbow room.

This is on a RHEL 5.7 system.

Is there a way to do this without the rebooting ?

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)
