Message-Id: <200308151705.h7FH5ro28539@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] SEGSEGV with vgcreate
In-Reply-To: <200308142049.h7EKnFo04036@mail.osdl.org>
MIME-Version: 1.0
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
Date: Fri Aug 15 12:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've determined that this was caused by the DAC960 driver when LVM
attempted to open a device that did not exist, which would have been
attached to that controller.  A fixed driver fixed this problem.

Mark

On 14 Aug, To: linux-lvm@sistina.com wrote:
> Hi, wasn't sure how to report this problem.  I'll run through what I've
> done so far.  I'm running a 2.6.0-test3 kernel using LVM2 2.00.05.  I
> run:
> 
> pvcreate /dev/sde
> dd if=/dev/zero of=/dev/sde bs=1k count=1
> blockdev --rereadpt /dev/sde
> vgcreate log_volume /dev/sde
> 
> I ran strace on vgcreate, and I'll attached the output.  Is there any
> other information I can provide?
