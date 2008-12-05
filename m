Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB5D86Eo009233
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 08:08:06 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB5D7VtT022491
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 08:07:31 -0500
Received: from soda.linbit (office.linbit [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F2852E06979
	for <linux-lvm@redhat.com>; Fri,  5 Dec 2008 14:07:29 +0100 (CET)
Date: Fri, 5 Dec 2008 14:07:29 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] Limiting i/o bandwith for pvmove?
Message-ID: <20081205130729.GC8120@barkeeper1-xen.linbit>
References: <20081204212123.GV2700@ppc.in-berlin.de>
	<20081205022403.GU26097@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20081205022403.GU26097@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Fri, Dec 05, 2008 at 02:24:03AM +0000, Alasdair G Kergon wrote:
> On Thu, Dec 04, 2008 at 10:21:23PM +0100, Philipp Schmidt wrote:
> > Is there a way to limit the bandwidth usage of pvmove, like it is
> > possible when reconstructing software raid mirris sets?
>  
> I wish there was!  This problem annoys me too but nobody's been bothered 
> enough about it to come up with a workaround yet...

really ugly workaround: do it chunk-by-chunk...

for i in `seq 0 10 10000`; do
	pvmove overloaded01:$i-$[i+99] newarray:$i-$[i+99]
	sleep 5
done

or something like that...
you have to adjust offsets as needed.
you may want to restrict to a particular lv (-n yourlv).
you can find out the PE mapping of your lvs with
 pvs -o name,pvseg_start,pvseg_size,vg_name,lv_name
append /dev/pvname to restrict output on one pv

hth,

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
