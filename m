Return-Path: <tmdg@uksr.hp.com>
Message-ID: <3B09204F.DEBB31E@uksr.hp.com>
Date: Mon, 21 May 2001 14:03:59 +0000
From: Tom Dawes-Gamble <tmdg@uksr.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
References: <01051916333601.00791@mama> <3B082B2E.A0EB9C96@tls.msk.ru> <01052113223000.01413@mama>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Peter Kirk wrote:
> 
> I have put my .config on the end, maybe some of you know what is
> misconfigured.
> 
> Thanks in advance
> 
========= Snip lots os stuff ==============

> # CONFIG_BLK_DEV_DAC960 is not set
> CONFIG_BLK_DEV_LOOP=m
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_BLK_DEV_INITRD is not set
> 
> #
> # Multi-device support (RAID and LVM)
> #
> CONFIG_MD=y
> # CONFIG_BLK_DEV_MD is not set
> # CONFIG_MD_LINEAR is not set
> # CONFIG_MD_RAID0 is not set
> # CONFIG_MD_RAID1 is not set
> # CONFIG_MD_RAID5 is not set
> CONFIG_BLK_DEV_LVM=m
> 

============= Snip even more =============================


It looks to me like youhave not configured any RAM disk stuff.

CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_INITRD=y

Is what I have in my config

Tom.

- -- 
char  *t,*n,*i="%.9s%.7s%.7s\n";extern void exit(int);extern int printf(const 
char  *,...);int main(){int v=*i,g,e=*(i-~(v/=v))%*(i+v);g=*i+~e--; 
t=n="  DISPLAY'tmdg@uksr';,,;'.hp.com'*>"+g;v=g-e;  e-=printf(i,n- v,e+n,t);
t=n="  DISPLAY'http://www.itrc.hp.com/' *>"-~g;exit(g+~printf(i,n+~v,e+n,t));}

-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.1i

iQA/AwUBOwkgTgbfKggmajr3EQLVAACfRFYkdfNE0ZCi71UCJMCL6Njg9GgAoJjS
u/JE/sEL49bwcmr7Oej2oO4b
=zv1q
-----END PGP SIGNATURE-----
