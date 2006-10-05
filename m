Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95DMTYA000437
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 09:22:29 -0400
Received: from filesrv1.idealcorp.com (66-192-27-146.static.twtelecom.net
	[66.192.27.146])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k95DMNL0009828
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 09:22:23 -0400
Received: from [192.168.1.18] (client08.idealcorp.com [192.168.1.18])
	by filesrv1.idealcorp.com (Postfix) with ESMTP id 673C0F6819D
	for <linux-lvm@redhat.com>; Thu,  5 Oct 2006 09:22:16 -0400 (EDT)
Message-ID: <45250726.5070300@idealcorp.com>
Date: Thu, 05 Oct 2006 09:22:46 -0400
From: John Ward <jward@idealcorp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Avoiding disk changes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

> Try to use hdparm to set your hard-drive in read-only mode.

Interesting suggestion, certainly shouldn't hurt.  But AFAIK the device 
mapper runs in the kernel and it's going to do it's "own thing" before I 
get a chance to hdparm it.

That's why I'm most interested in determining what (if anything) a LVM 
configuration does ... especially in situations where it detects a 
bad/repairable configuration (if that even makes sense).

Regardless, I'll do some experimenting - not sure if there are going to 
be any limitations with hdparm and configuring my disks via a USB adapter.
