Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3AEehXO001035
	for <linux-lvm@redhat.com>; Tue, 10 Apr 2007 10:40:43 -0400
Received: from vpn-14-196.rdu.redhat.com (vpn-14-196.rdu.redhat.com
	[10.11.14.196])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l3AEegiw017461
	for <linux-lvm@redhat.com>; Tue, 10 Apr 2007 10:40:42 -0400
Subject: Re: [linux-lvm] Sharing volumes via SAN?
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <20070409182959.GA7163@pri.dmz.gmi.com>
References: <20070409182959.GA7163@pri.dmz.gmi.com>
Date: Tue, 10 Apr 2007 10:40:57 -0400
Message-Id: <1176216057.4380.2.camel@linux-cxyg>
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

On Mon, 2007-04-09 at 11:29 -0700, Adam D. Morley wrote:
> Hi,
> 
> I'd like to share LVM volumes hosted on a SAN between two systems.  I do
> not want to mount at the same time (ie: GFS), but rather I just want
> to be able to swap them between hosts.  I'm assuming this is possible
> now by simply assigning SAN LUNs to both systems, but I don't see
> much talk of about a piece of LVM that handles knowing which host
> "owns" a given LV.
> 
> Background: In Solaris, when using Sun's VM, one can create a shared
> diskset which is seen by two hosts, but only one can do IO against the
> volumes at a given time.  Solaris also implements a forcible take
> mechanism which allows the passive host to take the volumes from the
> active host, panicing the active host out.  Regular takes are also
> implemented, to allow the volumes to migrate between hosts if first
> released by the active host.
> 
> It doesn't seem like LVM does this out of the box, probably because it
> lacks a built-in lock manager.  If it does, could someone point me to a
> resource that shows how it works?
> 

See Q#6:
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions



> In the event LVM doesn't do this, is this something that CLVM will do?
> Was there ever a version of CLVM for the 2.4.x kernel series?

> Thanks!
> 
