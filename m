Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2CHU3817382
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 12:30:03 -0500
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] setting VG UUID
Message-ID: <20040312172959.GA3950@chaos.ao.net>
References: <20040107065801.A27995@cs.mcgill.ca> <20040107092415.A28215@cs.mcgill.ca> <20040108212542.GF23918@homer.msp.redhat.com> <20040108163409.A3963@cs.mcgill.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040108163409.A3963@cs.mcgill.ca>
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
Date: Fri Mar 12 17:17:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 08 Jan 2004, Navindra Umanee wrote:

> Alasdair G Kergon <agk@redhat.com> wrote:
> > > Should "vgchange -a n" maybe clean up these symlinks?
> > It's supposed to do.
> 
> Hmmm.  I've hacked my init scripts to do it in the meanwhile, but I
> will pay closer attention to what happens next time I boot and report
> back.

It's probably trying to do it AFTER the kernel unmounts / (remounts RO)
Watch your shutdown, that's where I see "unable to BLA, read-only
filesystem" messages.   Since /dev gets cleaned up on boot I'm not too
worried about it.

--Dan
