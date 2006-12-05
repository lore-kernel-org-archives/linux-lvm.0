Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB5F0lBv026955
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 10:00:47 -0500
Received: from mx2.studentuniverse.com (mx2.studentuniverse.com
	[146.115.12.43])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB5F0jwE009261
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 10:00:45 -0500
Received: from sumail03.studentuniverse.com (sumail03.studentuniverse.com
	[192.168.1.7])
	by mx2.studentuniverse.com (8.13.6/8.13.6/SuSE Linux 0.8) with ESMTP id
	kB5F0Wbu016848
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 10:00:34 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] vgimport/vgexport commands when logically
	movingdisks	between systems
Date: Tue, 5 Dec 2006 10:00:31 -0500
Message-ID: <D2575519D6CA2840B6D3E26087EA71B6011B5B@sumail03.studentuniverse.com>
From: "Marlier, Ian" <ian.marlier@studentuniverse.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

 

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Patrick Caulfield
> Sent: Tuesday, December 05, 2006 5:29 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] vgimport/vgexport commands when 
> logically movingdisks between systems
> 
<snip>
> 
> 
> Yes. IF YOU'RE VERY CAREFUL!
> vgimport/vgexport are not the tools you want for this job.
> 
> 
> -- 
> 
> patrick

I ask this having gone back to Google a couple of times a week for
months, trying to find a clear-and-simple doc...

Given the setup that Dave is talking about, what _are_ the tools that he
(and, well, I) want for this job?

I've got the same basic set of requirements (using LVM2, though), and
have had a devil of a time figuring out what I actually need to have
installed and configured and running, and where I need them to be
installed and configured and running, to get it to work right...

Thanks!

- Ian
