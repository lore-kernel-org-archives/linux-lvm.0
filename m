Date: Wed, 17 Oct 2001 16:43:09 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] problem to compile lvm-1.0.1.rc4
Message-ID: <20011017164309.H644@tykepenguin.com>
References: <000001c1571f$91f28f80$6c88e289@tweety>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c1571f$91f28f80$6c88e289@tweety>; from chberger@pool.informatik.rwth-aachen.de on Wed, Oct 17, 2001 at 05:22:44PM +0200
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

On Wed, Oct 17, 2001 at 05:22:44PM +0200, Christoph Berger wrote:
> Hello,
> i've tried to compile a newer version of LVM.
> I followed the instructions in INSTALL. After patching my kernel 2.4.10,
> i tried to compile LVM, but i get the following error message:

You need to configure the kernel for your machine - cd into /usr/src/linux and
type "make menuconfig".

patrick
