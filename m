From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] VFS-Patch
Message-ID: <1224790000.1004112428@tiny>
In-Reply-To: <20011026140658.57325.qmail@web14401.mail.yahoo.com>
References: <20011026140658.57325.qmail@web14401.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Oct 26 11:06:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Friday, October 26, 2001 07:06:58 AM -0700 Aman Shahi
<shahi_aman@yahoo.com> wrote:

> 
> Hi Patrick,
> I tried with both 2.4.12-ac5 and 2.4.12-ac6 yesterday.
> Kernel compilation was giving error on alloc_kiovec
> and free_kiovec in lvm-snap.c. I replaced them with
> alloc_kiovec_sz and free_kiovec_sz and added one more
> int pointer in the calls. I am not sure whether that
> was proper, but I was able to compile the kernel. I
> was using 2.4.11 VFS-lock patch as u said.
> 
> But when using snapshot my Machine got hung. I tried
> 2-3 times with both ac5 and ac6. But all the time the
> machine got hund and FS got corrupted.
> 
> What might have I done wrong ?

Is this an SMP machine?  What happens when you turn on the spinlock
debugging (under the kernel debugging section in make menuconfig).

-chris
