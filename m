Message-ID: <XFMail.20020903224718.f.hinzmann@hamburg.de>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Florian Hinzmann <f.hinzmann@hamburg.de>
Subject: [linux-lvm] Error after moving volume group to another machine
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
Date: Tue Sep  3 15:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello!

I want to move three harddisks physically and temporarily into
another machine. These three harddisks are forming one volume group.

The target machine had one volume group with the same name,
but I did rename it in the meanwhile.

But the moved VG isn't detected properly. This is what I get:
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg01" from physical volume(s)
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vgpum01"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

I don't know what this means, what is the problem here? I have logs of pvscan, 
lvmdiskscan and vgscan available. All with and without "-v -d". I am not 
sure if binary attachments are allowed here so I won't include them yet. 

Any hint appreciated. If you want me something to try or provide more
information I will do it.


  Regards
     Florian


--
  Florian Hinzmann                         private: f.hinzmann@hamburg.de
                                            Debian: fh@debian.org
PGP Key / ID: 1024D/B4071A65
Fingerprint : F9AB 00C1 3E3A 8125 DD3F  DF1C DF79 A374 B407 1A65
