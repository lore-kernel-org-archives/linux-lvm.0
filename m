Return-Path: <torsten@imke.infodrom.north.de>
Date: Sat, 23 Jun 2001 22:02:01 +0200
From: Torsten Neumann <torsten@imke.infodrom.ffis.de>
Message-ID: <20010623220201.A9305@imke.infodrom.ffis.de>
Mime-Version: 1.0
Subject: [linux-lvm] LVM compile errors
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

Hi,

While building the LVM user-tools on my hp(*), i recognize that gcc-3 doesn't
like #ifdef directives in printf statements.
Because I only try to compile lvm-0.9(**) i don't include a patch.
Sorry to say that lvm still didn't run on the parisc architecture(***). That 
would be real cool.

  Torsten

(*) Linux imke 2.4.0-pa37 #5 Sat Jun 23 17:57:52 CEST 2001 parisc unknown
(**) Got many undefined symbols while trying to compile kernel 2.4.0 with 
latest 0.9.1-beta7 Patches.
(***) pvcreate(188): unaligned access to 0x40067cf3 at ip=0x400310db, seems
not an lvm related problem.
