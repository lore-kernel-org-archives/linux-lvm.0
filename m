Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SIwkV27626
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 14:58:46 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SIwahd032652
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 14:58:37 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 80EB025875
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:58:13 -0600 (MDT)
Date: Sun, 28 Aug 2005 12:58:13 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] shared scsi, external storage, vtrack
Message-ID: <9EE5CE8EBD6DA92F6D7F10DA@dhcp-2-206.wgops.com>
In-Reply-To: <4311BBDD.3070105@tpway.com>
References: <4311BBDD.3070105@tpway.com>
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



--On August 28, 2005 4:27:57 PM +0300 Andrew Kornilov <hiddenman@tpway.com> 
wrote:

> Hi all.
>
> I have two identical servers with CentOS (aka RHEL4.1) and one external
> data storage Vtrak 8110
> (http://www.promise.com/product/product_detail_eng.asp?segment=VTrak&prod
> uct_id=135) which connected by two scsi cables to this servers. I need to
> setup something called "shared scsi" but i haven't any experience with
> such things. My main task is build HA system (Vtrak used for postgresql
> databases). Can anybody help me with docs, HOWTOs and other?

You'll need to do this one of two ways.  First (simplest, most catastrophic 
error-prone) either make *CERTAIN* the systems NEVER, EVER, simultaneously 
mount the storage volumes, or, use a multi-host disk filesystem such as 
Sistina's GFS.

outside of that there's nothing special to be done.  one host has to be 
passive/inactive at all times in the first option, the second option means 
you can't use LVM, since, unless I'm mistaken, LVM has *no* capability for 
shared storage mediums.

Now most of these products can also be setup so that each host has their 
own storage space, and therefore they work like any other disk subsystem, 
each host only sees what they can access, but it sounds like you're not 
interested in that.

In any case, with postgresql, you're not going to be able to share their 
backend storage, so you'll have to have two totally separate storage areas 
if you want two live servers, or, you have one live, and one passive 
standby.

>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
