Date: Wed, 22 Aug 2001 16:43:26 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] how to determine if /dev/... is an LV?
Message-ID: <20010822164325.A1216@dardhal.mired.net>
References: <20010822034425.F8742@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010822034425.F8742@pc.ilinx>
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

On Wednesday, 22 August 2001, at 03:44:25 -0400,
Brian J. Murrell wrote:

> Hi all,
> [...]
> Also, is there any relationship between the output from the lvdisplay
> and the minor number for the device?
> 
As /usr/src/linux/Documentation/devices.txt says:

 58 char        Hayes ESP serial card - alternate devices
                  0 = /dev/cup0         Callout device for ttyP0
                  1 = /dev/cup1         Callout device for ttyP1
                    ...
    block       Reserved for logical volume manager

109 char        Reserved for logical volume manager


That is, LVM has block major number 58 reserved for its own use, as well
as char major number 109. One of my machines has LVM installed, with a VG
called Grupo00 and two LV, "mp3" and "usr" (ls -l /dev/Grupo00):

total 0
crw-r-----    1 root     disk     109,   0 jun  4 12:33 group
brw-rw----    1 root     disk      58,   0 jun  5 04:48 mp3
brw-rw----    1 root     disk      58,   1 jun  4 17:50 usr


Hope it helps. Regards,

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
