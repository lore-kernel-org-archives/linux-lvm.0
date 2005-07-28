In-Reply-To: <1122582390.9888.54.camel@localhost.localdomain>
References: <1119267914.21477.3.camel@dilbert>
	<1122572640.9888.27.camel@localhost.localdomain>
	<4abcc002bdbba2935bc93443c3beec65@redhat.com>
	<1122582390.9888.54.camel@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v622)
Message-Id: <517d02700b97c3eb5b81085969ec0e28@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Progress on LVM2 snapshots
Date: Thu, 28 Jul 2005 15:45:57 -0500
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
To: mingz@ele.uri.edu
Cc: LVM general discussion and development <linux-lvm@redhat.com>


On Jul 28, 2005, at 3:26 PM, Ming Zhang wrote:

> Thanks a lot for this information.
np

> Is there anything external people like us can do to speed up this?

1) File detailed bug reports
2) complain on this list
3) submit patches

>  There
> are many people waiting for this snapshot feature since it is so useful
> and essential. frankly, i know there are plan to replace md with dm, 
> but
> since md is already stable and this snapshot is very unstable, why not
> do this first? :P

The squeaky wheel gets the grease.  Right now, multipath, [cluster] 
mirroring have been getting all the attention at the expense of single 
machine snap-shot.  Hopefully, we can get snapshots soon.

  brassow
