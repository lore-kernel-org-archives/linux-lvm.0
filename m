Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2AIF3806848
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 13:15:03 -0500
Received: from Cantor.suse.de (ns.suse.de [195.135.220.2])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2AIF107008682
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 13:15:01 -0500
Received: from extimap.suse.de (extimap.suse.de [195.135.220.6])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by Cantor.suse.de (Postfix) with ESMTP id 6F5212CD3B5
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 19:14:55 +0100 (CET)
Received: from watt.suse.com (roc-24-169-15-66.rochester.rr.com [24.169.15.66])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(Client did not present a certificate)
	by extimap.suse.de (Postfix) with ESMTP id CD844803C1
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 19:14:48 +0100 (CET)
Subject: Re: [linux-lvm] [PATCH] calc_max_buckets bug
From: Chris Mason <mason@suse.com>
In-Reply-To: <20040310154444.GE643@reti>
References: <1078927858.25064.1468.camel@watt.suse.com>
	 <20040310154444.GE643@reti>
Message-Id: <1078942647.25076.1530.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 13:13:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 2004-03-10 at 10:44, Joe Thornber wrote:
> On Wed, Mar 10, 2004 at 09:10:59AM -0500, Chris Mason wrote:
> > Hello everyone,
> > 
> > This is in both 2.4.x lvm and 2.6.x dm code, calc_max_buckets is broken
> > for 32bit machines with > 4GB of ram.  This leads to -ENOMEM errors
> > during snapshot creation.
> 
> heh, this must be the only bit of code I copied from LVM1 :) Serves me
> right for being lazy.

Do you see any problems with using a smaller fixed size on the hash
table.  It seems like 2MB should be enough to me.

-chris
