Message-ID: <38E4F5B4.DF212C4B@freeler.nl>
Date: Fri, 31 Mar 2000 21:00:04 +0200
From: jorg de jong <j.e.s.de.jong@freeler.nl>
MIME-Version: 1.0
Subject: [linux-lvm] BUG: use of lvchange leads to disk corruption 
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

Hi,

the use of lvhange can lead to corruption of the lvm data structure on
disk,
and by doing so preventing you to access you data.

Incase you have more than one LV in one VG the use of lvchange will make
your VG inaccessable.

regards,

jorg de jong
