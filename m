Message-ID: <017301c202d0$c77c2410$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <004d01c20110$f2b8ff70$6501a8c0@bomoon> <20020522144651.F9107@sistina.com> <009601c20204$81710e30$6501a8c0@bomoon> <20020523190023.A13788@sistina.com>
Subject: Re: [linux-lvm] Error on vgscan & lvremove
MIME-Version: 1.0
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
Date: Thu May 23 22:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz,

> A 'workaround' for non-devfs configurations is
>
> ls /dev/*/group | sed 's!/group!!' | xargs rm -r ; vgmknodes
>

??Something wrong on "sed 's!/group!!' ", it did not work.

>
> link the single executable statically by running
> "./configure --enable-static_link" (which doesn't use the shared libs).
>

It did not work. I rebuilt LINUX kernel & LVM after
"./configure --enable-static_link".
I got the same result.

Another big issues came as follow;

I tried to go back to LVM1.0.3, but getting a big trouble.

Q1:  Is it backward compatible from LVM1.1-rc2 to LVM1.0.3 or not?

        I already built the volume from LVM1.1-rc2 then I went back to
LVM1.0.3.
        All of LVM tools are not working as shown in the following console
output.

Q2: How could I remove this volume and rebuild? I do not care about the
data.

During boot or after the boot, I have the following errors;

[root@localhost /]# vgscan -f
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "volRaid0"
vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volRaid0"
is inconsistent
vgscan -- ERROR: unable to do a backup of volume group "volRaid0"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"volRaid0" from "/etc/lvmtab"
vgscan -- found inactive volume group "volRaid5"
vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volRaid5"
is inconsistent
vgscan -- ERROR: unable to do a backup of volume group "volRaid5"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"volRaid5" from "/etc/lvmtab"
vgscan -- found inactive volume group "volDisk"
vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volDisk"
is inconsistent
vgscan -- ERROR: unable to do a backup of volume group "volDisk"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"volDisk" from "/etc/lvmtab"
vgscan -- found inactive volume group "volDisk2"
vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volDisk2"
is inconsistent
vgscan -- ERROR: unable to do a backup of volume group "volDisk2"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"volDisk2" from "/etc/lvmtab"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

[root@localhost /root]# ls /dev/*/group
ls: /dev/*/group: No such file or directory
[root@localhost /root]# vgmknodes
vgmknodes -- no volume groups found to create nodes for


Thanks for your help,

Bo
