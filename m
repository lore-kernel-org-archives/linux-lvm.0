Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i25Mcn810953
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 17:38:49 -0500
Received: from ms-smtp-02.rdc-kc.rr.com (ms-smtp-02.rdc-kc.rr.com [24.94.166.122])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i25Mcnb03896
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 17:38:49 -0500
Received: from sasami.localdomain (CPE-24-31-241-155.kc.rr.com [24.31.241.155])
	by ms-smtp-02.rdc-kc.rr.com (8.12.10/8.12.7) with ESMTP id i25Mckgs013007
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 16:38:46 -0600 (CST)
Received: from yggdrasil.localdomain ([192.168.0.2])
	by sasami.localdomain with esmtp (Exim 4.30)
	id 1AzNxu-00039k-61
	for linux-lvm@redhat.com; Fri, 05 Mar 2004 16:38:46 -0600
Received: from adric by yggdrasil.localdomain with local (Exim 4.30)
	id 1AzNxu-0000ep-2g
	for linux-lvm@redhat.com; Fri, 05 Mar 2004 16:38:46 -0600
From: Greg Norris <haphazard@kc.rr.com>
Subject: Re: [linux-lvm] linux 2.6.3 -- device-mapper: dm-linear: Device lookup failed
Message-ID: <20040305223845.GA2513@yggdrasil.localdomain>
References: <20040305003050.GA4134@yggdrasil.localdomain> <20040305090144.GC744@reti>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040305090144.GC744@reti>
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
Date: Fri Mar  5 17:37:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 05, 2004 at 09:01:44AM +0000, Joe Thornber wrote:
> >    kernel: device-mapper: dm-linear: Device lookup failed
> 
> This is a serious error, it means that device mapper was asked to
> instance a linear mapping across a non-existent device.  Could you
> turn on verbose logging in the LVM2 tools, and try and find out which
> LV is failing to activate please ?

Once I did this, I quickly learned that LVM2 is perfectly happy with
all of my LVs.  Apparently I managed to install both LVM2 and EVMS, and
it was the latter throwing the errors.  Now that it's gone,
everything's back to normal.

Sorry for cluttering up the list...
