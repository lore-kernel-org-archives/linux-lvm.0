Return-Path: <wichert@cistron.nl>
Date: Mon, 13 Aug 2001 00:35:13 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813003513.B30146@cistron.nl>
References: <20010812135402.A452@dardhal.mired.net> <997636232.20870.2.camel@monster.omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <997636232.20870.2.camel@monster.omnifarious.org>; from hopper@omnifarious.org on Sun, Aug 12, 2001 at 12:10:31PM -0500
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

On 12 Aug 2001 13:54:02 +0000, Jos� Luis Domingo L�pez wrote:
> As far as I know, there are plans to remove much of the thingss that
> currently appear under /proc. It seems that only information about
> processes currently running will remain under /proc.

The name /proc already suggests it is a filesystem for processes,
not kernel configuration.

> Kernel parameters, system information, kernel variables and kernel
> tunables will probably disappear and will be replaced by some sort of
> user-space application that will allow query and modfication of kernel
> values and tunables. Something similar to Solaris' ndd, AFAIK.

From what I remember the idea is to move all the no-process stuff
from /proc to (an)other filesystem(s), /kernel or so. 

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
