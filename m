Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E01121122
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2020 01:28:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADD878007AC
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2020 01:28:42 +0000 (UTC)
Date: Thu, 26 Mar 2020 20:32:24 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20200327003224.GB3078@bdmcc-us.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200326233144.GM17504@agk-dp.fab.redhat.com>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] storage-logger: Recording changes to the udev
 database
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: dm-devel@redhat.com, linux-lvm@redhat.com

On Thu, Mar 26, 2020 at 11:31:45PM +0000, Alasdair G Kergon wrote:
> I'm experimenting with ways of recording changes to the udev database so
> you can look back at the history of the storage stack on a particular
> machine.  This is still a work-in-progress, but it's reached a point
> where I'd like more people to try it out.
> 
> I've written a shell script that records data related to storage uevents
> in the system journal and a perl script that helps you to interrogate
> this data later to create a representation of the storage components.
> 
> If you're interested, please try this out and let me know if you think
> pursing this approach further would lead to something that you would
> use and distributions should ship.


Alasdair,

I have downloaded and installed in a Debian 9 environment.

There are a couple of differences that I have seen so far.

First, most importantly, the udev rules are in /etc/udev/rules.d.

Secondly, it appears that the journalctl command does not like the
output fields option.

I will install this on another machine that has a bit more device
activity, and comment later.


Brian


 
  
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
