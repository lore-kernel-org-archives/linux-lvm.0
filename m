Date: Thu, 18 Oct 2001 11:53:18 +0200
From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011018115318.A2771@balu.kawo2.rwth-aachen.de>
References: <110278234233.20011015163039@difi.de> <20011016105533.A4318@sistina.com> <55520025253.20011018113954@difi.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55520025253.20011018113954@difi.de>; from Stefan.Onken@difi.de on Thu, Oct 18, 2001 at 11:39:54AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 18, 2001 at 11:39:54AM +0200, Stefan Onken wrote:
> 
> > pvcreate /dev/sde1
> > vgextend Stonki2 /dev/sde1
> > pvmove /dev/sdd1 /dev/sde1
> > vgreduce Stonki2 /dev/sdd1
> 
> stupid question: what about resizing the reiserfs file system ?
> Is it not necessary ?

Not for moving things around. These steps do not resize any logical
volume, they just move the data from one pv to another. So you don't
need to resize the file system here either.

Regards, Markus

-- 
Spiegel-Leser wissen mehr. Fuer ein Semester-Abo!
http://www.kawo2.rwth-aachen.de/~mdobel/semesterabo.html
