Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBN1s7r22348
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2004 20:54:07 -0500
Received: from tsmtp1.mail.isp (smtp.terra.es [213.4.129.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBN1s6VS010223
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2004 20:54:07 -0500
Received: from 84.Red-81-40-5.pooles.rima-tde.net ([81.40.5.84])
	by tsmtp1.mail.isp (terra.es) with ESMTP id I95DI701.DJM for
	<linux-lvm@redhat.com>; Thu, 23 Dec 2004 00:34:55 +0100 
Subject: Re: [linux-lvm] Cannot create a Volume Group
From: Fernando Ruza <feruza@terra.es>
In-Reply-To: <1103070543.982.26.camel@luna.horche.gu>
References: <1103067201.995.12.camel@luna.horche.gu>
	<20041215000856.GF18372@agk.surrey.redhat.com>
	<1103070543.982.26.camel@luna.horche.gu>
Message-Id: <1103758488.3788.29.camel@luna.horche.gu>
Mime-Version: 1.0
Date: Thu, 23 Dec 2004 00:34:48 +0100
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi again,

I solved my problem. The issue was that I had not applied the device
mapper patch to my kernel. I did it and every thing worked right.

Best regards,

Fernando.


El mi�, 15-12-2004 a las 01:29, Fernando Ruza escribi�:
> Hi,
> 
> El mi�, 15-12-2004 a las 01:08, Alasdair G Kergon escribi�:
> > On Wed, Dec 15, 2004 at 12:36:55AM +0100, Fernando Ruza wrote:
> > > Everything seems to be create properly, however when now I'm trying to
> > > activate the volume group or to scan it, it says it cannot found it:
> >  
> > > sol:~# vgchange -a y vg1
> > >   Unable to find volume group "vg1"
> > > sol:~# vgscan
> > >  No volume groups found
> >  
> > >   lvm2           2.00.29-1
> > 
> > Firstly, there's a bug in pvcreate 2.00.29 (it'll sometimes fail
> > with an error message when it shouldn't) - upgrade to .31.
> 
> Well, I don't think is the version. I've just upgrade to 2.00.29 before
> writing to the list and with the version I had before it happened the
> same.
> 
> > Use -vvv options to see what's going on and why it ignores things.
> > e.g. pvscan --partial -vvv
> > 
> 
> After doing the pvcreate /dev/hda1 /dev/hda4 /dev/hdb1, pvscan --partial
> -vvv   lists me all the devices y /dev and at the end says:
> 
>   PV /dev/hda1         lvm2 [7,96 GB]
>   PV /dev/hda4         lvm2 [15,48 GB]
>   PV /dev/hdb1         lvm2 [3,00 GB]
>   Total: 3 [26,44 GB] / in use: 0 [0   ] / in no VG: 3 [26,44 GB]
> 
> After doing the vgcreate /dev/vg1 /dev/hda1 /dev/hda4 /dev/hdb1,
> vgscan --partial -vvv   lists me all the devices y /dev and at the end
> says: No volume groups found
> 
> The device /dev/vg1 is not created although vgcreate says Volume group
> "vg1" successfully created.
> 
> 
> > Alasdair
-- 
Yo uso software libre, �Y tu?
�Qu� es el software libre? consulta: http://www.gnu.org/philosophy/free-sw.es.html

Fernando Ruza 
e-mail: feruza@terra.es
jabber: fruza@jabber.guadawireless.net
web: http://guada24.guadawireless.net
Tlf: 661123845
Linux user: #273644 (http://counter.li.org)
Debian Sid (Kernel 2.4.20 & ext3)

"In an internet without fences ... who needs 'gates'"
