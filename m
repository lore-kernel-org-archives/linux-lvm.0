Message-Id: <2162.200.184.103.3.1018967365.squirrel@www.dokbua.com>
Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
From: "Rene @ Webscorpion.com" <rene.madsen@webscorpion.com>
In-Reply-To: <3621.200.184.103.3.1018883627.squirrel@www.dokbua.com>
References: <3621.200.184.103.3.1018883627.squirrel@www.dokbua.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Apr 16 09:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Uhm, 24 hours and my posts is the only one?
Am I the only person on this list?


> Dear LVM gurus
>
> I've installed LVM on several computers over the years, generally
> without problem, but now I've hit a box where I can't make it work:
> This is a P4 with two 60GB IDE drives, hda and hdc.  The Kernel is a
> Redhat 2.4.17 (custom 0.6 fwiw) which I understand is an -ac flavor
> kernel.  It would seem that because of compatibility issues with aquote
> - unrelated to LVM - I need this -ac hack present.
>
> I downloaded and installed the userland tools 1.0.3 and had a beautiful
> patch created. Trying to apply the patch with --dry-run gives a couple
> of errors though, so I didn't dare applying it.
>
> Instead I just compiled the kernel with LVM support in the kernel
> (whichever is present in the 2.4.17 kernel, not as not module) and
> everything seems fine - at least no complaints. This i've done several
> times before without getting into trouble.
>
> Rebooted the kernel, everything still fine. ran vgscan (tookforever but
> eventually came back)  followed by vgchange -a y, which also was ok.
>
> pvcreate on both the partitions (one on each disk) goes fine, and so
> does vgcreate (again, takes forever, but finally...)
>
> Now the problem: lvcreate dumps core. Doesnt matter how much or little
> space I create, what I call it, if I use just one pv or if I try to
> slice it.
>
> I notice in my /var/log/messages that I get MILLIONS (really) of
> errors: kernel: invalidate: busy buffer
> last message repeated 12233432 times
> last message repeated 534252times
> last message repeated 545234242 times
>
> What am I doing wrong? Is this error related to the missing kernel
> patching?
>
> How can I patch a standard kernel for both -ac and LVM ? As I
> understand it they both require a "clean" kernel to apply good?
>
> Sorry for the perhaps stupid quiestions, but I am not a kernel guru - I
> only know just enough to get myself into trouble :-)  I *did* read the
> FAQ and I *did* search google (usenet) - didnt' find the answers tho...
>
> TIA!
> Rene
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
