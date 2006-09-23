Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8N8SUMa007616
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:28:30 -0400
Received: from iohazard.net (iohazard.net [193.64.31.48])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8N8SOLp026129
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:28:24 -0400
Message-ID: <4514F001.1050300@iki.fi>
Date: Sat, 23 Sep 2006 11:27:45 +0300
From: Aleksandr Koltsoff <czr@iki.fi>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM partition and lvm commands in initrd
References: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
In-Reply-To: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
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

Hi

Mark Ryden wrote:
> Hello linux-lvm,
>  There is one point which I want to understand and I hope I can get
> help here.

initrds are created automatically for you upon kernel package
installation in most linux distributions (fedora included). this means
that the mkinitrd/mkinitramfs-script will sniff around your system and
decide which modules (dm, ext3, hba-drivers, etc) to include in the
initrd and also sometimes decide which scripts to call (vgscan and
friends) and whether to include lvm-related tools into the initrd.
Similar story for software raid.

This means that if you take the initrd and try to boot a system that
doesn't have LVM you're doing something wrong. initrds are not supposed
to be portable, however this will of course depend very much on the
distribution.

Hope this answers your question.

ak.
