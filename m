Date: Thu, 23 Aug 2001 20:49:05 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010823204905.B920@dardhal.mired.net>
References: <20010823014012.A32700@greenhydrant.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010823014012.A32700@greenhydrant.com>
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
Cc: David Rees <dbr@greenhydrant.com>

On Thursday, 23 August 2001, at 01:40:12 -0700,
David Rees wrote:

> Hi,
> 
> I'd like to create an ext2 filesystem over a raw io device, is this even
> possible?  (If not, skip the rest of this message! ;-)
> 
Maybe I'm completely wrong (as usual :), but as far as I know you can
either create a filesystem over any block device (e.g. partition, md, LV,
etc.) and use it as usual, or bind a raw device to an existing block
device, and let the application (e.g. Oracle) manage space on the device
as it wants.

Greetings,

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
