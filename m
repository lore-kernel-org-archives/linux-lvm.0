From: Jesse Keating <jkeating@pogolinux.com>
Subject: Re: [linux-lvm] Re: RAID5 bug? [was: Re: raid and lvm]
References: <20030206.kbn.38328100@si.homelinux.org> <200302071226.49241.jhs@openenterprise.biz>
In-Reply-To: <200302071226.49241.jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200302062156.59889.jkeating@pogolinux.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Feb  6 23:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thursday 06 February 2003 21:26, Jason Smith uttered:
> But I still have not seen a good solution.  Hopefully, I just haven't
> searched well enough.  Does nobody use RAID level 5 with LVM?  If this is
> still a problem, then it's a big showstopper for Linux as a file server, as
> I see it.

I have a few clients that use LVM on large hardware (3-ware) raid5 arrays.  I 
don't think they've seen (they might not have looked) these types of errors 
when the array is in degraded mode.

Does this effect only software raid?

-- 
Jesse Keating RHCE MCSE
Pogo Linux -- Support Tech
tel: 888.828.7646
