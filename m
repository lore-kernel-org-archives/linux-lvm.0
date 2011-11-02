Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2IfFJa017068
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 14:41:15 -0400
Received: from qmta09.westchester.pa.mail.comcast.net
	(qmta09.westchester.pa.mail.comcast.net [76.96.62.96])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2IfDSN002055
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 14:41:14 -0400
Date: Wed, 2 Nov 2011 18:41:10 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <1938252049.1709725.1320259270237.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <175586151.1708730.1320258218204.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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

----- Dan White <ygor@comcast.net> wrote:
> ----- James Hawtin <oolon@ankh.org> wrote:
> > Dan White wrote:
> > >
> > > I just experienced that.
> > >
> > > I had to reboot the machine to "see" the expanded LUN.
> > > I used fdisk to make a partition out of the LUN expansion, but I had to reboot again before I could do anything further.
> > > After the second reboot, I was able to make a PV out of the new partition, roll it into the existing VG and then expand the two test LV's I had previously created to utilize the new elbow room.
> > >
> > > This is on a RHEL 5.7 system.
> > >
> > > Is there a way to do this without the rebooting ?
> > >
> > >   
> > Assuming the device is sda then
> > 
> > |echo 1 > /sys/block/sda/device/rescan|
> > 
> > However if that fails (and it can) only a reboot or removing the disk 
> > driver module and reinstalling it will scan it correctly (possible if 
> > you have a mix of local and san disk) however probably a reboot is easiler.
> > 
> 
> OK.
> How about the addition of a new LUN ?
> 
> A new device (/dev/sdb) should "appear", but I'd like to do it without rerbooting.
> 

!! Found the answer myself !!

echo "- - -" > /sys/class/scsi_host/hostX/scan 

where "X" is the controller you want to refresh.  On my system, I see host0 thru host5 in /sys/class/scsi_host/, so I did all 6 and /dev/sdb appeared.  I was able to roll it into my volume group with system-config-lvm.

Wahoo !!

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)
