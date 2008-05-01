Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41MCUAk020871
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 18:12:30 -0400
Received: from vms040pub.verizon.net (vms040pub.verizon.net [206.46.252.40])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41MCJRn022073
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 18:12:19 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms040.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700KU8N7F0AF3@vms040.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 17:16:27 -0500 (CDT)
Date: Thu, 01 May 2008 18:12:09 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <20080501215952.GV18935@agk.fab.redhat.com>
Message-id: <481A4039.3050208@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <481A1D32.6020705@Media-Brokers.com> <481A1FAF.5050303@verizon.net>
	<481A221D.80209@Media-Brokers.com> <481A262C.7080908@verizon.net>
	<20080501202534.GU18935@agk.fab.redhat.com>	<481A286E.80309@verizon.net>
	<481A2947.9070907@Media-Brokers.com>	<481A29DD.6040108@verizon.net>
	<481A2BB4.7080504@Media-Brokers.com>	<481A2EB3.40703@verizon.net>
	<20080501215952.GV18935@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> It's up to your initrd and/or initscripts whether or
> not and how to use those facilities.
>
>   
Alasdair,
  Is it possible to define an init script that would run early enough 
(before LVM tries to activate the volumes) so that I could vgreduce the 
old snapshot?
  Or does this require a new initrd?

Gerry
