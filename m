From: "Jonathan DeHaan" <jdehaan@home.com>
Subject: RE: [linux-lvm] Boot managers and LVM
Date: Sat, 22 Sep 2001 21:54:37 -0400
Message-ID: <000001c143d2$b3a03a20$0400a8c0@ci696011a.lxintn1.ky.home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0109211107470.20703-100000@duplo.agenda.si>
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
To: linux-lvm@sistina.com

You'll need a separate /boot partition that is not MD or LVM, but otherwise,
it should be fine. I've been doing it that way for at least six months with
no problems.

Jonathan DeHaan
jdehaan@home.com

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Danilo Godec
> Sent: Friday, September 21, 2001 5:10 AM
> To: linux-lvm@sistina.com
> Cc: bug-grub@gnu.org
> Subject: [linux-lvm] Boot managers and LVM
>
>
> Hi!
>
> I'm planning to use LVM with MD devices and I wonder if GRUB is somehow
> able to boot using LVM on / or will I have to go back to Lilo?
>
> Thanks, D.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
