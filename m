Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBDFP3r12790
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 10:25:04 -0500
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBDFP1nf019062
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 10:25:02 -0500
Received: from x-berg.in-berlin.de (x-berg.in-berlin.de [192.109.21.10])
	by einhorn.in-berlin.de (8.12.10/8.12.10/Debian-4) with ESMTP id
	iBDFOob5015586
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 16:24:50 +0100
Received: from philipp by x-berg.in-berlin.de with local (Exim 4.34)
	id 1Cds49-0000NV-U1
	for linux-lvm@redhat.com; Mon, 13 Dec 2004 16:24:49 +0100
Date: Mon, 13 Dec 2004 16:24:49 +0100
From: Philipp Schmidt <philipp@ppc.in-berlin.de>
Subject: Re: [linux-lvm] duplicate pv.
Message-ID: <20041213152449.GC21170@ppc.in-berlin.de>
References: <20041212173549.GC3853@ppc.in-berlin.de>
	<20041213084935.61935.qmail@web52503.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041213084935.61935.qmail@web52503.mail.yahoo.com>
Sender: Philipp Schmidt <philipp@x-berg.in-berlin.de>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2004-12-13 00:49:35 -0800, johon Doe <johond@yahoo.com>
wrote in <20041213084935.61935.qmail@web52503.mail.yahoo.com>:
> hi Phils,
> I have Debian and I changed the value from 0 to 1 and
> viceversa, but I have the same problem.
> Any other ideas ?

set remove all md components from your lv, set md_component_detection = 1,
do a pvcreate on this device, run pvscan and then add them to yor vg, 
doubleck twice (by using lvdisplay -v) the md-device has been added and
not its components.

Worked for me

AVE!
  phils...

-- 
   {phils}--->---(mail: philipp@ppc.in-berlin.de)-->--(ircnet: phils)--,
    wenn w eine   aube ist dn      man au dran dre en                   |
         o     Schr        an muss     hc         h   (Kurt Schwitters) |
:wq!    <--(phone: +49-179-6737439)--<--(jabber: phils@jabber.ccc.de)--'
