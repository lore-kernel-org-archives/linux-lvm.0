Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0TIdjGo029028
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 13:39:45 -0500
Received: from n20.bullet.mail.ukl.yahoo.com (n20.bullet.mail.ukl.yahoo.com
	[87.248.110.137])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0TIdVo3006664
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 13:39:32 -0500
Message-ID: <905780.79489.qm@web87111.mail.ird.yahoo.com>
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
	<20100128211720.GA23619@us.ibm.com>
	<Pine.LNX.4.64.1001290822570.27080@bmsred.bmsi.com>
Date: Fri, 29 Jan 2010 18:39:30 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <Pine.LNX.4.64.1001290822570.27080@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] alternative to pvmove on root volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> On Thu, 28 Jan 2010, malahal@us.ibm.com wrote:
> > given that pvmove also works by mirroring I'm not convinced I haven't

> > just been lucky so far .  So does anyone have any ideas or even better
> > experiance on whether this is likely to work or am I setting myself up
> > for a world of pain if I try it on a live server?
> 
> Yes, pvmove works very similar. It will create a mirror for each segment
> one at a time, so it may have to create lot more mirrors depending on
> your configuration. If it ends up needing more 'lvconverts' (suspends),
> then the probability of failure (deadlock) will increase.

I've been testing using VMs cloned from the same template, the clones that I used pvmove on have deadlocked maybe 75% of the time, and the ones that I lvconverted have never deadlocked. However given your explanation I think its probable that I've just been lucky and my 10 or so tests haven't had enough 'suspends' to trigger the issue. Oh well back to the planned downtime route.

Thanks for the help :)

chris



      
