Message-ID: <20011026140658.57325.qmail@web14401.mail.yahoo.com>
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] VFS-Patch
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
Date: Fri Oct 26 09:06:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Patrick,
I tried with both 2.4.12-ac5 and 2.4.12-ac6 yesterday.
Kernel compilation was giving error on alloc_kiovec
and free_kiovec in lvm-snap.c. I replaced them with
alloc_kiovec_sz and free_kiovec_sz and added one more
int pointer in the calls. I am not sure whether that
was proper, but I was able to compile the kernel. I
was using 2.4.11 VFS-lock patch as u said.

But when using snapshot my Machine got hung. I tried
2-3 times with both ac5 and ac6. But all the time the
machine got hund and FS got corrupted.

What might have I done wrong ?

regards,
Aman.

> >Not the reply you wanted but 2.4.12ac5 is OK with 
> > the 2.4.11 VFS-lock patch.


__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
