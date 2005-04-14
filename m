Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3ENZIO14803
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 19:35:18 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3ENZBUl027677
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 19:35:12 -0400
Received: by wproxy.gmail.com with SMTP id 68so686434wra
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 16:35:03 -0700 (PDT)
Message-ID: <87f94c3705041416357039a4a5@mail.gmail.com>
Date: Thu, 14 Apr 2005 19:35:03 -0400
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] How to mirror or Replicate a primary server's data to
	a secondarymachine
In-Reply-To: <1113495234.25261.28.camel@grma-lap>
Mime-Version: 1.0
Content-Disposition: inline
References: <1113495234.25261.28.camel@grma-lap>
Content-Transfer-Encoding: 8bit
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>
Cc: nahant-list@redhat.com, taroon-list@redhat.com, linux-poweredge@dell.com

On 4/14/05, Gary Mansell <Gary.Mansell@ricardo.com> wrote:
> Hi,
> 
> I am considering whether to go down the path of a dual server, manual
> failover solution for one of my RHEL fileservers.
> 
> I would have two identical servers in two different machine rooms on our
> site and if the main server failed then I would manually reconfigure the
> secondary server with the primary server's IP address so that the client
> machines can carry on working.
> 
> Can anyone recommend to me what I need to do to mirror the data across
> the two servers so that updates to the primary server are also made to
> the secondary server
> 
> Thanks in advance for any help
> 
> Regards
> 
> Gary Mansell

If you need ordered writes (as a database would), the only solution
I'm sure works is DRBD.  I then MD layered above NBD can also be used,
but I'm not positive it supports ordered writes.

If you choose DRBD, then Linux-HA (heartbeat) can be added to the mix
to get rid of the manual failover aspect.  SLES (SuSE Linux Enterprise
Server) comes with both of these and Novell's support.

Or all of the above are GPL and you can use yourself and the community
for support.

HTH
Greg
