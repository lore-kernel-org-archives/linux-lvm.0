Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i380Roj20047
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 20:27:50 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i380RnWB009303
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 20:27:49 -0400
Subject: Re: [linux-lvm] lvm2 weirdness on software RAID5
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <20040407234649.GA27033@ossmann.com>
References: <1081378532.25836.264.camel@arthur.cbd.careercast.com>
	<20040407234649.GA27033@ossmann.com>
Message-Id: <1081384072.25830.285.camel@arthur.cbd.careercast.com>
Mime-Version: 1.0
Date: Wed, 07 Apr 2004 17:27:52 -0700
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2004-04-07 at 16:46, Michael Ossmann wrote:
<snip>
> Looks like lvm is configured to allow both /dev/md* and
> /dev/hd* as physical devices.  You probably want to limit it
> to /dev/md* so that it doesn't get confused by things it
> finds on the raw disk partition devices.  You can do this
> with:
> 
>   filter = [ "r|^/dev/hd*|" ]
> 

Ahh! Very interesting. I didn't see any mention of this in the HOWTO's
or anything, though I didn't look very hard.

> in the devices block of your /etc/lvm/lvm.conf.  If you do
> not have an /etc/lvm/lvm.conf, you can copy the sample
> config in the lvm2 distribution or create a fresh one with:
> 
>   # lvm dumpconfig > /etc/lvm/lvm.conf
> 
> You could also make the filter more specific if you want:
> 
>   filter = [ "r|^/dev/hdc*|" ]
> 

Note that lvm dumpconfig printed nothing. I used the example.conf from
the tarball and that worked perfectly.

Thanks.
