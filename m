Message-ID: <23233866A70C32479532C8D0B8AE7B96032AAC12@i2km07-ukbr.domain1.systemhost.net>
From: narsimha.kulkarni@bt.com
MIME-Version: 1.0
Subject: [linux-lvm] volume group and physical volume
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
Date: Tue May 27 10:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am trying to create volume group and physical volume.


when i do vgscan 

helena:/etc # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "helena_vg"
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume
group)
vgscan -- ERROR "lv_read_all_lv(): number of LV" creating "/etc/lvmtab" and
"/e"

the conf file for helena_vg is not to be found. how can i completely remove
it.

helena:/etc # vgremove helena_vg
vgremove -- volume group "helena_vg" doesn't exist

then i want to remove this PV /dev/hda3

pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
vgscan)


narsimha
