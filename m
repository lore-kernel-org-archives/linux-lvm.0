From: Luca Ferroni <luca.ferroni@studio.unibo.it>
Message-Id: <20040112153912.1530c7d3.luca.ferroni@studio.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] df and lvs incompatible output
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
Date: Mon Jan 12 18:12:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,
I use LVM2 on my laptop, and I have one volume group called "mio_vg"

I extended my Logical Volume lv_usr and I experienced some problems:
according to LVM2 (lvs output) my lv_usr is 7,5G, whereas with df its size seems to be 4,0G.

How can I solve my problem?

wallace ~ # df -h
Filesystem         Dimens. Usati Disp. Uso% Montato su
/dev/mio_vg/lv_home   1,4G  939M  405M  70% /home
/dev/mio_vg/lv_usr    4,0G  3,6G  276M  93% /usr
/dev/mio_vg/lv_var    2,8G  1,2G  1,6G  42% /var
/dev/mio_vg/lv_dati    16G   14G  1,7G  89% /mnt/dati
tmpfs                  30M  1,3M   29M   5% /tmp

wallace ~ # lvs
LV      VG     Attr   LSize  Origin Snap%  Move Move% 
lv_dati mio_vg -wn-ao 15,77G                          
lv_home mio_vg -wn-ao  1,39G                          
lv_usr  mio_vg -wn-ao  7,45G                          
lv_var  mio_vg -wn-ao  2,83G

wallace ~ # lvdisplay 
  --- Logical volume ---
  LV Name                /dev/mio_vg/lv_home
  VG Name                mio_vg
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1,39 GB
  Current LE             355
  Segments               1
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:0
   
  --- Logical volume ---
  LV Name                /dev/mio_vg/lv_var
  VG Name                mio_vg
  LV UUID                000000-0000-0000-0000-0000-0000-000001
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2,83 GB
  Current LE             725
  Segments               3
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:1
   
  --- Logical volume ---
  LV Name                /dev/mio_vg/lv_usr
  VG Name                mio_vg
  LV UUID                000000-0000-0000-0000-0000-0000-000002
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                7,45 GB
  Current LE             1908
  Segments               2
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:2
   
  --- Logical volume ---
  LV Name                /dev/mio_vg/lv_dati
  VG Name                mio_vg
  LV UUID                000000-0000-0000-0000-0000-0000-000003
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                15,77 GB
  Current LE             4036
  Segments               3
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:3

Thank you in advance
Bye

-- 
----------------------------------------
Luca Ferroni
www.cs.unibo.it/~fferroni/
----------------------------------------
