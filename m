Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1EFMTO07637
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 10:22:29 -0500
Received: from ns3.linuxquebec.com (ns3.linuxquebec.com [64.40.111.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1EFMSAW009521
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 10:22:28 -0500
Received: from ns2.linuxquebec.com (unknown [64.18.178.21])
	by ns3.linuxquebec.com (Postfix) with ESMTP id 0298D2B8032
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 10:30:47 -0500 (EST)
Received: from aragorn.intranet (unknown [10.10.1.116])
	by ns2.linuxquebec.com (Postfix) with ESMTP id C0C1613ED8
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 10:18:27 -0500 (EST)
Subject: RE: [linux-lvm] waah waah - disaster recovery
From: Paul Pianta <pantz@lqt.ca>
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF0489@enyc11p32003.corpny.csfb.com>
References: <0B834CEE3453504B82AB821DFB7047C1FF0489@enyc11p32003.corpny.csfb.com>
Date: Mon, 14 Feb 2005 10:22:11 -0500
Message-Id: <1108394531.4699.48.camel@aragorn.intranet>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2005-02-11 at 20:45 +0000, Rosenstrauch, David wrote:
> 
> > Rosenstrauch, David wrote:
> > 
> > > Basically just dd the data from the partition on the bad 
> > disk to the partition
> > > on the new disk (e.g., "dd if=/dev/hda2 of=/dev/hdb3").
> > 
> > dd_rescue.
> > 
> > http://freshmeat.net/projects/ddrescue/
> > http://www.gnu.org/software/ddrescue/ddrescue.html
> 
> 
> Wow - cool util!  Wish I had known about this a week ago!  :-)

Oooooooh yeah - cool util! It just saved my ass - I have managed to
recover everything that I needed by doing a
'dd_rescue /dev/hdc /dev/hda' while running the systemRescueCd live CD.

Thanks again all for your excellent tips :)

pantz
