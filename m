Return-Path: <jdomingo@crosswinds.net>
Date: Sun, 12 Aug 2001 22:21:39 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812222139.A14464@dardhal.mired.net>
References: <20010812135402.A452@dardhal.mired.net> <997636232.20870.2.camel@monster.omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <997636232.20870.2.camel@monster.omnifarious.org>
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

On Sunday, 12 August 2001, at 12:10:31 -0500,
Eric M. Hopper wrote:

> On 12 Aug 2001 13:54:02 +0000, Jos� Luis Domingo L�pez wrote:
> > As far as I know, there are plans to remove much of the thingss that
> > currently appear under /proc. It seems that only information about
> > processes currently running will remain under /proc.
> > 
>
Check this linux kernel mailing list for the (still scarce) details about
"removing" kernel tunables from /proc:
http://uwsg.iu.edu/hypermail/linux/kernel/0105.3/1439.html

To be precise, dicussion about modifying existing /proc starts here:
http://uwsg.iu.edu/hypermail/linux/kernel/0105.3/1469.html

There were not much discussion about the subject, but it seems that in
2.5.x /proc will just hold information about running processes. The rest
is still to be defined :)

Regards.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
