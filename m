Return-Path: <jdomingo@crosswinds.net>
Date: Wed, 15 Aug 2001 11:07:10 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Renumbered drives hosed VG.
Message-ID: <20010815110710.B740@dardhal.mired.net>
References: <B51F0C636E578A4E832D3958690CD73E0130BFC0@es04snlnt>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130BFC0@es04snlnt>
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Tuesday, 14 August 2001, at 14:52:17 -0600,
Diehl, Jeffrey wrote:

> Hi all,
> 
> I recently upgraded from a modular kernel to a monolithic kernel, which
> renumbered all of my drives.  sda became sdb, sdb became sdc and adc became
> sda, etc.  Now one of my VG's is hosed.  How do I recover from this?
> 
Don't know to recover from this, but if I had several hard disk on my
server and something depended on the kernel detecting them in order, I
would try using devfs (device filesystem).

Is not that hard to setup, seems stable by now and you will never get your
disks messed again. Under devfs naming, a SCSI disk is identified by the
adapter and bus where it is attached, and by its SCSI and LUN numbers (the
"same" for IDE disks). So the kernel will always identify the disks in the
same way.

For example my master disk on the primary IDE channel is:
/dev/ide/host0/bus0/target0/lun0
An my root partition on this disk is:
/dev/ide/host0/bus0/target0/lun0/p3

Regards.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
