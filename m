From: Stefan Nilsen <stefan.nilsen@wale.dyndns.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200302041927.44619.stefan.nilsen@wale.dyndns.dk>
Subject: [linux-lvm] New lv cannot span pv's
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
Date: Tue Feb  4 12:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I'm using LVM on SuSE 8.1

As can be seen below, I cannot create a logical volume spanning physical 
volumes even if they are in the same volume group.

I'm pretty sure I could do this in older versions of the LVM.

wale:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda5" of VG "vgdata" [11.60 GB / 3.16 GB 
free]
pvscan -- ACTIVE   PV "/dev/hda6" of VG "vgdata" [21.71 GB / 3.24 GB 
free]
pvscan -- total: 2 [33.31 GB] / in use: 2 [33.31 GB] / in no VG: 0 [0]

wale:~ # lvcreate -ntest -L5G vgdata
lvcreate -- not enough allocatable/free physical volume space in 
"vgdata"
lvcreate -- please check, if physical volumes are allocatable

Do I really have to use MD to overcome this problem?
Shouldn't the LVM software take care of this?

/Stefan
