Return-Path: <claudio@conectiva.com>
Date: Sun, 17 Dec 2000 09:01:04 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] Fwd: [md@Linux.IT: LVM tools broken on PPC (and many
 other archs)]
In-Reply-To: <0012170917090F.00774@lyta>
Message-ID: <Pine.LNX.4.21.0012170855330.16662-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: md@Linux.IT

On Sun, 17 Dec 2000, Russell Coker wrote:

> This is a general LVM driver issue, and therefore something that's more 
> appropriate for the main LVM developers to deal with, as don't have access to 
> non-Intel hardware and I don't have the knowledge of LVM driver internals 
> that these people have it doesn't make sense for me to try and deal with this.

I have access to a PPC box (an iMac DV running Debian), so I can test the
changes eventually done to the code. I can't promise a fix myself since
I'm no PPC expert, and no LVM expert either.


> Date: Fri, 15 Dec 2000 18:07:27 +0100
> From: Marco d'Itri <md@Linux.IT>
> 
> pv_get_size() tries parsing the MBR, but that fails on PPC because of
> the different endianess from what the function expects.
> 
> From the changelog I see Andrea Arcangeli contributed a very crude
> workaround for the alpha platform, which has the same endianess of i386
> but (I suppose) a different disk label format.
> The same "fix" works for PPC too (and sparc, and so on), so I think the
> #ifndef __alpha__ at the beginning of lib/pv_get_size.c should really be
> #ifdef __i386__ until some better code is written (FYI, you can find
> byte swapping code within fdisk).
> 
> The fix needs to be fixed too, because other code will expect something
> in the buffer pointed by the second argument. I just added that at the
> end of the function:
> 
>         if (dummy)
>                 memset(dummy, 0, sizeof (struct partition));
> 
> With this fix, everything seems to work fine.

I'll have a look.
