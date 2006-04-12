Received: from hydrogen.msp.redhat.com (hydrogen.msp.redhat.com [10.15.80.1])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3CFx9Q3006072
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 11:59:09 -0400
Subject: Re: [linux-lvm] Concise LVM Summary
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <20060412041706.36220.qmail@web60419.mail.yahoo.com>
References: <20060412041706.36220.qmail@web60419.mail.yahoo.com>
Date: Wed, 12 Apr 2006 10:59:08 -0500
Message-Id: <1144857548.16665.7.camel@hydrogen.msp.redhat.com>
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

On Tue, 2006-04-11 at 21:17 -0700, linux_user98765@yahoo.com wrote:
> lvs,pvs,vgs each provide for output of specified columns (with optional
> headers and field separators); HOWEVER this is still limited as (at
> least on my debian pkg) PV and LV commands cannot be combined, thus
> negating the possibility of anything even as simple as:

Of course, but you said you were using a perl script to put the info
together.  Using the commands as suggested makes them easier to parse.

You should be able to figure out how full a PV is that is part of an LV,
but I'm not sure you can determine what parts of a pv an lv uses - or
how much space an lv uses of a pv.

For example:
prompt> lvs --noheadings -o devices vg/lv
  /dev/sda(0)
  /dev/sdb(0)
prompt> pvs --noheadings -o pv_used,pv_size /dev/sda
  17.15G 17.15G

So, you can use vgs to get the vg names, lvs to get the lv names in
those vgs and the devices they live on, and pvs to get basic usage.

If you want to do more, you might consider looking
at /etc/lvm/backup/<vg name>

 brassow
