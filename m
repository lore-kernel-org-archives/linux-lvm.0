Message-ID: <3F937B53.5080603@quanticom.net>
From: Miguel Angel <miguel@quanticom.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] help me please from Barcelona (Spain)
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
Date: Mon Oct 20 08:04:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: support@sistina.com, linux-lvm@sistina.com, mge@sistina.com

I recently create another vg in my lvm there are two VG01 is the first 
and  VG00 is the new , I migrate some non more critical filesystems 
including 4 of oracle, /usr/local /opt etc , the VG00 is in a new  disk 
of 124Mb, the root filesystem /usr /lib /etc /var are in the VG01 but in 
the boot process take and error and the server don't boot, the fstab is 
ok and the initrd image ok, to can boot I need to take out the new disk 
whith the VG00, please help me there are a lot of information and 
databases that i don't wanna lose.
Sorry for my english and a lot of thank's from Barcelona (Spain)

ERROR 2 writing volume group backup file /etc/lvmtab.d/VG01.tmp in 
vg_cfgbackup.c [line 271]
ERROR: unable to do  a backup of volume group "VG01"
ERROR "lvm_tab_vg_remote(): unlink" removing volume group "VG01" from 
/etc/lvmtab


redhat 9 kernel 2.4.23-pre7

--------------------------------------------------df -h
/dev/VG01/root        992M  549M  403M  58% /
/dev/hda2             201M   58M  133M  31% /boot
/dev/VG01/usr         6.0G  5.0G  728M  88% /usr
/dev/VG01/home        4.0G  2.9G  980M  75% /home
/dev/VG01/local      1008M  599M  359M  63% /usr/local
/dev/VG01/var         1.5G  724M  701M  51% /var
/dev/VG01/tmp         485M   11M  450M   3% /tmp


---------------------------------------------------- portion fstab
##/dev/VG00/src         /usr/src        ext3            defaults 
1       2
##/dev/VG00/rpm         /home/miguel/rpm ext3           defaults 
1       2
##/dev/VG00/Linux               /Linux          ext3            defaults 
        1       2
##/dev/VG00/oracle      /usr/oracle     reiserfs        defaults 
1       2
##/dev/VG00/oradata     /usr/oracle/oradata reiserfs    defaults 
1       2
##/dev/VG00/admin               /usr/oracle/admin reiserfs      defaults 
        1       2
##/dev/VG00/arch                /usr/oracle/arch reiserfs       defaults 
        1       2
##/dev/VG00/notes               /opt/notes      ext3 
defaults,noatime        1       2
##/dev/VG00/notesdata
