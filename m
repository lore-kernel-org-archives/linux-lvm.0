Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBBDIcr23280
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 08:18:38 -0500
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBBDIVHr021292
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 08:18:37 -0500
Received: from x-berg.in-berlin.de (x-berg.in-berlin.de [192.109.21.10])
	by einhorn.in-berlin.de (8.12.10/8.12.10/Debian-4) with ESMTP id
	iBBDIUE1014993
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 14:18:30 +0100
Received: from philipp by x-berg.in-berlin.de with local (Exim 4.34)
	id 1Cd78n-0000rX-So
	for linux-lvm@redhat.com; Sat, 11 Dec 2004 14:18:29 +0100
Date: Sat, 11 Dec 2004 14:18:29 +0100
From: Philipp Schmidt <philipp@ppc.in-berlin.de>
Subject: Re: [linux-lvm] duplicate pv.
Message-ID: <20041211131829.GA10829@ppc.in-berlin.de>
References: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
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

On 2004-12-11 03:42:13 -0800, johon Doe <johond@yahoo.com>
wrote in <20041211114213.76916.qmail@web52508.mail.yahoo.com>:
> Hi, I have a 2.6.9 kernel and I have problems to
> create an vg device over a raid1 array.

look t your /etc/lvm/lvm.conf, have you set md_component_detection = 1?

i wonder why this isn't set by default, who needs to use md compnents as
singel pv?


AVE!
  phils...

-- 
   {phils}--->---(mail: philipp@ppc.in-berlin.de)-->--(ircnet: phils)--,
    wenn w eine   aube ist dn      man au dran dre en                   |
         o     Schr        an muss     hc         h   (Kurt Schwitters) |
:wq!    <--(phone: +49-179-6737439)--<--(jabber: phils@jabber.ccc.de)--'
