Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2JBaZCl006942
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 07:36:35 -0400
Subject: Re: [linux-lvm] liblvm IOCTL/sysfs interface
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
References: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
Date: Thu, 19 Mar 2009 11:37:57 +0000
Message-Id: <1237462677.10568.208.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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

On Thu, 2009-03-19 at 17:01 +0530, Sandeep K Sinha wrote:
> So, I should see the information like.
> 
> lvol0
> vg
> target1 - /dev/sda5 ----  0 -- 10000 ( BEGIN  -- Length )
> target2 - /dev/sda6 ----  10001 -- 4000

dmsetup table

> 
> We do maintain these informations inside the kernel, We should atleast
> have an ioctl or sysfs based interface to extract
> these information.
> 
> Liblvm is under development, won't it be of a good use to provide such
> a functionality.

This is a lower level than liblvm targets (liblvm will work in terms of
"LVM level" objects; pvs, vgs, lvs). The functionality to observe and
manipulate the targets used by a specific LVM device is already provided
by libdevmapper and the dmsetup tool.

Regards,
Bryn.
