Date: Tue, 28 Aug 2001 17:19:09 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Bug in the min and max macros in lvm-snap.c
Message-ID: <20010828171909.B338@dardhal.mired.net>
References: <00aa01c12fc9$5f3cda00$3300a8c0@local>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00aa01c12fc9$5f3cda00$3300a8c0@local>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tuesday, 28 August 2001, at 07:57:20 -0600,
Hostmaster (www) wrote:

> Hi,
> 
> I'm installing the lvm_1.0.1-rc1 patch to a RedHat install (kernel 2.4.3-12).
> 
> After installing the kernel patch, the kernel build was failing on the min and max macros in lvm-snap.c.
>
Maybe I'm wrong, but AFAIR Linus changed max and min macros on 2.4.9, so
they are not backwards compatible. As lvm_1.0.1-rc1 was intended for
kernel 2.4.9, I suppose it used those new max/min macros, so LVM 1.0.1-rc1
doesn't work with kernels < 2.4.9.

Check last week's linux kernel mailing list archives to check what people
think about this sudden change :)

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
