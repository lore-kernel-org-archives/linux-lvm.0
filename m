From: Jord Tanner <jord@indygecko.com>
Message-Id: <1070314787.10000.4.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Dual Boot with LVM
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
Date: Mon Dec  1 15:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I posted a message on this, but no-one has an answer. I try again.

I dual boot my machine between RedHat 9 and Gentoo 1.4. Both use the
same PV, and share several LVs. In RedHat all operates as expected. In
Gentoo, the LVs are usable, but lvscan, lvcreate, etc give the following
error:

root@gecko root # lvscan
lvscan -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of
volume  group "Volume00"


Running pvscan in Gentoo shows the PV to be inactive:

root@gecko root # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part2" of VG
"Volume00" [53.71 GB / 33.32 GB free]
pvscan -- total: 1 [53.71 GB] / in use: 1 [53.71 GB] / in no VG: 0 [0]

Yet, the LVs can be mounted without trouble.


What can I do to correct this?

-- 
Jord Tanner <jord@indygecko.com>
