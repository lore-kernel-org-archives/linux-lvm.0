Date: Thu, 29 Apr 1999 08:13:42 +0200 (MET DST)
From: Sven Wirth <wirth@decwww.rz.uni-leipzig.de@decwww.rz.uni-leipzig.de>
Subject: [linux-lvm] kann LVM 0.6 nicht initialisieren 
Message-ID: <Pine.OSF.3.96.990429081251.16192A-100000@www.uni-leipzig.de>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hallo ...


Hab bei mir versucht LVM 0.6 zu installieren. Das kompilieren
der Kerneles (statisch), und der Tools ging problemlos. Im 
Proc-Verzeichnis ist auch das File LVM da. Wenn ich vgsacan auf-
rufe bekomme ich im debug-Modus folge Fehlermeldung.
lvm_iop_version -- CALLED
lv_status_internal -- AFTER ioctl ret: -105
lvm_iop_version -- LEAVING with ret: -105
Ich finde auch kein Special-file im dev-verzeichnis lvm. Muss ich
das noch erzeugen ? wenn ja wie ? welche major und minor hat das 
file ?

msg s. wirth
