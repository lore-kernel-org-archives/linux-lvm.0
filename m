Return-Path: <wichert@cistron.nl>
Date: Wed, 25 Jul 2001 16:26:35 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Logical Volume file system
Message-ID: <20010725162635.F32341@cistron.nl>
References: <3B5EC662.80278028@atix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B5EC662.80278028@atix.de>; from julien@atix.de on Wed, Jul 25, 2001 at 03:15:14PM +0200
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

Previously Julien Baboud wrote:
>  This information isn't displayed in the output of the 'lvdisplay'
> command :(

The LV itself really doesn't care what you put on it, it does not even
need to be a filesystem.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
