Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k02IZL102577
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2006 13:35:21 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k02IZD3J031215
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2006 13:35:13 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id D888C25098
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2006 11:34:59 -0700 (MST)
Date: Mon, 02 Jan 2006 11:34:58 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] RAID 5 recovery?
Message-ID: <71AA34433C5F2753DDABE7D0@dhcp-2-206.wgops.com>
In-Reply-To: <1136226503.2785.9.camel@dogbert>
References: <1136226503.2785.9.camel@dogbert>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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



--On January 2, 2006 6:28:23 PM +0000 John Rowe <rowe@excc.ex.ac.uk> wrote:

> Due to an extended power outage over the new year, I have a RAID5 array
> with two dirty devices so it won't come up. The HOWTO suggests running:
>
>  mdadm --assemble --force
>
> Is this good advice? I'm running RedHat 9 so I don't have mdadm but of
> course I'm happy to install it.


I suggest you talk to/find the MD people.  LVM != RAID/MD.  However, yes, 
this is the only thing that might help you AFAIK.
