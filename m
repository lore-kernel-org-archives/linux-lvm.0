Message-ID: <20011026212455.5515.qmail@web14402.mail.yahoo.com>
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] VFS-Patch::linux-2.4.12-ac6 with 2.4.11 VFS-Lock Patch
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
Date: Fri Oct 26 16:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Chris,

Nope I am not building it over a SMP machine. I had
tried 2.4.12 with 2.4.11-VFS-Lock Patch and everything
was fine.

Today I had to re-install linux on my machine, then
again I tried with 2.4.12-ac5 and 2.4.12-ac6, but 
after the first lvcreate operation, and other access
to LVM through any command or the mounted volume hangs
the system, and I have to manually reboot it, after
which my FS is totally corrupted.

So again, I re-installed Linux on my machine, and
built 2.4.12. This time everything worked fine.

I had reinstalled Linux fresh on my machine. Compiled
everything using gcc-3.0.1. LVM code was from CVS. The
only difference was that with 2.4.12 I did not have to
do anything. And that with ac5 or ac6, I had to
manually convert the free_kiovec and alloc_kiovec
calls
to free_kiovec_sz and alloc_kiovec_sz with an extra
int pointer( in lvm-snap.c ). This was the only
difference I had to do during the two kernel
compilation.

I am not sure about the spinlock debugging thing. Do I
try building again with it turned ON , even if I am
not using a SMP configuration ?

regards,
Aman.

>>Is this an SMP machine?  What happens when you turn 
>>on the spinlock debugging (under the kernel 
>>debugging section in make menuconfig).
>>-chris



__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
