Date: Mon, 10 Sep 2001 14:05:43 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM
Message-ID: <20010910140543.A9418@dardhal.mired.net>
References: <NBBBJHKIOKPKOGOEPEDPEEDBDNAA.stuart@bh90210.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <NBBBJHKIOKPKOGOEPEDPEEDBDNAA.stuart@bh90210.net>
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

On Monday, 10 September 2001, at 04:37:07 -0700,
IT3 Stuart B. Tener, USNR-R wrote:

> List members:
> 
> 	Hello to all, as I am somewhat new to the list. Perhaps one of you will recommend some basic reading to get me started, but I do have a few questions regarding LVM and my proposed deployment of it on my laptop.
> [...]
>
Your best starting point is the new LVM HOWTO at:
http://tech.sistina.com/lvm/doc/lvm_howto/index.html

Linux LVM is considered stable, since it passed version 1.0 (now
1.0.1-rc2). It has been stable for some time before. Current Linux kernels
include an outdated LVM version (2.4.9 still includes LVM 0.9.1-beta2,
dated back in January or so).

What LVM provides is a means or managing your disk space in Linux: so
there is no way to create a Linux LV to hold a Windows or Solaris
installation. AFAIK, W2K has some sort of volume management in some of
their versions, and I'm sure Solaris has something on its own.

Greetings.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
