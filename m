From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xu14jtio7.fsf@kth.se>
References: <Pine.LNX.4.44.0312020510230.4857-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: still need to install device mapper with 2.6 kernel?
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
Date: Tue Dec  2 08:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Robert P. J. Day" <rpjday@mindspring.com> writes:

>   i think i'm confused about the support for device mapper in the 
> 2.6 kernel.  i'm aware that i need to install device-mapper for
> LVM2, and i know where to get the device-mapper tarball.
>
>   but, in the configuration process for the 2.6 kernel, you can 
> select device mapper support, so i did and built it into the
> kernel.  i assumed (perhaps unwisely) that device mapper was now
> part of the 2.6 kernel source tree, and i now had it since i'd
> selected it as part of the configuration in the kernel build for
> my 2.6.0-test11 kernel.  therefore, i didn't need to explicitly 
> install device-mapper anymore.

Linux 2.6 includes device-mapper, but (obviously) only the kernel side
of it.  You still need to install the user space library.

-- 
M�ns Rullg�rd
mru@kth.se
