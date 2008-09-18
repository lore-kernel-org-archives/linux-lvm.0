Date: Thu, 18 Sep 2008 15:59:45 -0400
From: Richard Michael <rmichael-lvm@edgeofthenet.org>
Subject: Re: [linux-lvm] How to start duplicate VG with new name and UUID?
Message-ID: <20080918195945.GA17231@nexus.edgeofthenet.org>
References: <20080917194243.GA11502@nexus.edgeofthenet.org>
	<48D21DB9.6040804@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <48D21DB9.6040804@redhat.com>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Sep 18, 2008 at 10:22:01AM +0100, Bryn M. Reeves wrote:
> Richard Michael wrote:
> > Hello list,
> > 
> > I'm using FC7 2.6.23.12-52.fc7 and LVM2 lvm2-2.02.24-1.fc7.
> > 
> > I have a RAID1 mdadm software array containing a VG.  Half the array has
> > been removed from the system and now returned and I want data from the
> > old half, before it is resync'd back into the array.
> 
> See:
> 
> http://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html
> 
> And the reply from Alasdair which improves a couple of the steps.

Thanks Bryn.  I actually did quite a bit of searching before posting,
and found your message you reference, but it wasn't applicable as your
first step was to deactivate the VG (and I can't deactive the existing
VG with mounted LVs).  But, I should have looked at Alasdair's reply,
which solves that problem.

Sorry for the noise, and thanks for pointing me to his reply, I'll give
it a go.

Regards,
Richard
