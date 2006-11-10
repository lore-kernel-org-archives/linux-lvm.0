Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAA0IwRQ027618
	for <linux-lvm@redhat.com>; Thu, 9 Nov 2006 19:18:58 -0500
Received: from rwcrmhc11.comcast.net (rwcrmhc11.comcast.net [204.127.192.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAA0IuVb007613
	for <linux-lvm@redhat.com>; Thu, 9 Nov 2006 19:18:56 -0500
Received: from [192.168.1.3] (marvin.localnet [192.168.1.3])
	by furio.localnet (8.13.8/8.13.7) with ESMTP id kAA0Imw6018225
	for <linux-lvm@redhat.com>; Thu, 9 Nov 2006 19:18:49 -0500
Message-ID: <4553C568.1060207@mattgillen.net>
Date: Thu, 09 Nov 2006 19:18:48 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] partition type question
References: <277B4B9B-B884-448C-B8DD-BD1AA6412D32@jmarble.net>
In-Reply-To: <277B4B9B-B884-448C-B8DD-BD1AA6412D32@jmarble.net>
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

Marble John wrote:
> Hello,
> I forgot to change the partition type to 8e from 83 before creating my
> PVs and volumes and filesystems.  Is this going to screw anything up? 

Nope.

> Everything seems to be working fine.  Running the LVM 1 that comes with
> RH3 U6.

You might want to fix it so that on the next reboot the LVM autodetect finds it.

Matt
