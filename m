From: "Samuel Leuthold" <sam@asgard.ch>
Message-ID: <000001c3a255$1f5f3940$7801a8c0@asuncion>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20031103134603.407.73496.Mailman@hermes.sistina.com>
Subject: [linux-lvm] Re: One PV destroyed - now the whole VG isn't working anymore
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
Date: Mon Nov  3 15:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello

I have the same Problem as Sebastian. I have 3 disks in my LV. The third =
one
has badblocks. The Data isn't nessecary on this disk.
So can i release the third disk from the LV, reformat and rebind into it
without loosing the data on disk1 and 2?? And what about the reiser? Is =
it
consistent after this "hack"??

disk1 /dev/hdb
disk2 /dev/hdc
disk3 /dev/hdd  <-- the faulty one and the last joined to the LV

Can i do it with these commands?? What is different? Whats the meaning =
of
the "0" in storage\0 ??

mkdir /etc/lvmtab.d
cp /etc/lvmconf/storage.conf /etc/lvmtab.d/storage
echo -ne "storage\0" > /etc/lvmtab
vgchange -ay storage

Please help... i don't want to lose 240GB!

Thanks for help!
Samuel

<<SNIP>>-----------------------------------------------------------------=
---
-------------
Message: 5
Date: Mon, 3 Nov 2003 11:05:55 +0100
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't =
working
anymore
Reply-To: linux-lvm@sistina.com


Sebastian,

you either want to use LVM2/device-mapper and try the "vgchange -P ..."
option to activate partially available VGs

-or-

a quick hack to get LVM1 going:

mkdir /etc/lvmtab.d
cp /etc/lvmconf/storage.conf /etc/lvmtab.d/storage
echo -ne "storage\0" > /etc/lvmtab
vgchange -ay storage

If you have those contents in /etc/lvmtab and /etc/lvmtab.d/storage =
restored
anyway, "vgchange -ay storage" is all you need to do.

Either way presumes, that enough logical extends are accessable fine. =
Backup
your data and recreate the VG afterwards.

Regards,
Heinz    -- The LVM Guy --
<<SNAP>>-----------------------------------------------------------------=
---
-------------
