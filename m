From: "Ian E. Morgan" <imorgan@webcon.ca>
Message-ID: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net>
MIME-Version: 1.0
Subject: [linux-lvm] Help: LVM on top of SW RAID0+1
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
Date: Wed Mar 12 17:38:31 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Current config:

md1: raid0 of hda3, hdb3
md2: raid0 of hdc3, hdd3
md3: raid1 of md1, md2

Situation:

md1 was created first, and is currently one big PV in VG "foo".

md2 was created identically to md1, and then md3 was created causing md2 to
be synced to be identical to md1.

I would now like VG "foo" to use md3 instead of md1.

I tried:

# vgexport foo
# vgimport foo /dev/md3


This seemed to suceed, but vgdisplay says that VG "foo" is still only using
PV md1.

It seems that pvscan and friends see md[123] all as belonging to VG "foo".

How do I make LVM ignore md1 and md2, and force only md3 to be used on VG
"foo"?


Regards,
Ian Morgan

-- 
-------------------------------------------------------------------
 Ian E. Morgan          Vice President & C.O.O.       Webcon, Inc.
 imorgan@webcon.ca          PGP: #2DA40D07           www.webcon.ca
    *  Customized Linux network solutions for your business  *
-------------------------------------------------------------------
