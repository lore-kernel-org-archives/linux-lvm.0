Return-Path: <wichert@cistron.nl>
Date: Wed, 25 Jul 2001 16:55:27 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Logical Volume file system
Message-ID: <20010725165527.I32341@cistron.nl>
References: <20010725162635.F32341@cistron.nl> <20010725165117.B598@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010725165117.B598@dardhal.mired.net>; from jdomingo@internautas.org on Wed, Jul 25, 2001 at 04:51:17PM +0000
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

Previously Jos� Luis Domingo L�pez wrote:
> Does it mean that applications can use a LV as a "raw device" ?.

There is no such as a `raw device'. A LV can be seen as a normal blockdevice
from userland, just like a normal harddisk or disk slice.

I think what you are referring to is `raw io', which is something you
can do with any block device. Currently you still need a special rawio
patch for Linux kernels, but it's a well tested and stable patch.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
