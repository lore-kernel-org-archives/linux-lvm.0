Return-Path: <root@totoro.ovh.net>
Date: Thu, 5 Jul 2001 02:48:50 +0200
From: Totoro <totoro@ovh.net>
Subject: Re: [linux-lvm] Unable to compile 2.4.6
Message-ID: <20010705024850.A15245@totoro.ovh.net>
References: <9880000.994292407@dizzy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9880000.994292407@dizzy>; from lembark@wrkhors.com on Wed, Jul 04, 2001 at 07:20:07PM -0500
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

Hello,

You have to patch the source manually,
the beta7 has an old function of the kernel yet:

get_hardblocksize  becomes    get_hardsect_size

you have just to changes these names and this work fine, normally.


Totoro

On Wed, Jul 04, 2001 at 07:20:07PM -0500, Steven Lembark wrote:
> 
> Run configure, apply patch.  2.4.6 links before patch, doesn't link after applying patch.
