Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0GKGVse006584
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 15:16:31 -0500
Received: from mail.esperi.org.uk (user70385@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0GKGTFO008728
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 15:16:30 -0500
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l0GKGROE009454
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 20:16:27 GMT
Subject: Re: [linux-lvm] A question about deleting partitions - LVM related
References: <ebe74ab10701110449k3b5ee6ccw3e41a85dfbdca4a0@mail.gmail.com>
From: Nix <nix@esperi.org.uk>
Date: Tue, 16 Jan 2007 20:16:27 +0000
In-Reply-To: <ebe74ab10701110449k3b5ee6ccw3e41a85dfbdca4a0@mail.gmail.com>
	(Yalusa Jongihlati's message of "Thu, 11 Jan 2007 14:49:02 +0200")
Message-ID: <873b6a20dg.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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

On 11 Jan 2007, Yalusa Jongihlati told this:
> My concern is that this will change the partition numbers of the partitions
> currently 12, 13 and 14. As can be seen these currently form part of LVM
> partitions. If the partition numbers change eg sda12 to sda10, my concern is
> whether LVM will adjust accordingly? Or is there a command I will have to
> run once I have re-partitioned? The LVM partitions are all reiserfs.

It should adapt automatically: this is one of the things vgscan does at
boot time.

-- 
`He accused the FSF of being "something of a hypocrit", which
 shows that he neither understands hypocrisy nor can spell.'
   --- jimmybgood
