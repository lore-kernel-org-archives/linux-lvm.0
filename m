From: "T. Pawlak" <thorsten.pawlak@gmx.net>
MIME-Version: 1.0
Message-ID: <3D78E549.8408.39D5AA@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Please Help, vgscan finds too much LEs
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
Date: Fri Sep  6 10:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

this is the second email for my problem. Unfortunately i haven't got an answer to my 
first one. So i'm posting again.

After i've pvreduce my VG vgscan can't activate it. here is the output:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- only found 28926 of 28672 LEs for LV /dev/data/home (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of 
volume group "data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

i don't know what i can do, it is very funny problem because 28926 LEs are found of 
and only 28672 sems to be needed, where are the 254 LEs from?!?

i've made a pvdata -Eva from all 5 PEs, the file is about 1mb of size, so dave 
everyones bandwidth i put it here: http://www.pawlak-world.de/pvdata

if more infos of my configuration is needed please conact me!

i'm using LVM v1.0.5 with kernel patch (i upgraded from 1.0.3 before i made the 
pvreduce)

I hope someone can help me now! It would be very nice if i can reconstruct my data, 
although i have a backup, but only of 60gb of the whole 200gb and it would be nice to 
access the rest again somehow!

bye Thorsten
