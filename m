Return-Path: <jdomingo@crosswinds.net>
Date: Wed, 27 Jun 2001 00:50:59 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Request for misalignment tests
Message-ID: <20010627005059.A3595@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010626161947.A11918@sistina.com>
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
Cc: Heinz Mauelshagen <mauelshagen@sistina.com>

On Tuesday, 26 June 2001, at 16:19:47 -0500,
Heinz Mauelshagen wrote:

> 
> All,
> [...]
>
Linux kerne 2.4.4 here, with LVM 0.9.1_beta7 patches applied
PV is a 2-partition software RAID-0 device (600 MB total)
VG spans the whole RAID device, and no more PVs
Three LV created over the described VG, 100, 100 and 200 MB each

pvdisplay -v /dev/md0 | grep "^ *00000"
   00000 /dev/Grupo00/Unidad00     00000   512

root@server01:~# pvdisplay /dev/md0 
--- Physical volume ---
PV Name               /dev/md0
VG Name               Grupo00
PV Size               600.25 MB / NOT usable 256 KB [LVM: 121 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              150
Free PE               50
Allocated PE          100
PV UUID               oNXntA-Dg6p-5C5z-pybt-87B0-gI2C-SLzUmp

Everything seems to be OK here. Sending all this information, just in
case. Greetings.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
