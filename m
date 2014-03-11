Message-ID: <531ECA9E.6080602@oracle.com>
Date: Tue, 11 Mar 2014 16:34:38 +0800
From: xiaowei <xiaowei.hu@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segmentation fault in LVM2 latest version.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, zkabelac@redhat.com
Cc: Joe Jin <joe.jin@oracle.com>

Hi all,

I can reproduce one segmentation fault in 
lvm2(lvm2-2.02.100-8.el6.x86_64) with below steps:

1. create PV,VG with 9 disk, 4GB each:
     pvcreate /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg 
/dev/sdh /dev/sdi /dev/sdj
     vgcreate vgmlpap /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf 
/dev/sdg /dev/sdh /dev/sdi /dev/sdj
2.create a LV , say 2G initial, 6 strips.
    lvcreate -L 2G -n lvpap007 -i 6 -I 128k vgmlpap
3.extend this LV several times with 1 strip:
    lvextend -L +600M -i 1 /dev/mapper/vgmlpap-lvpap007   (repeat this 
several times)
4.segmentation fault appear when the first physical volume can't meet 
the required extends.


I tracked this a little more, and found that it's due to the strip 1 
parameter and when the first PV leaves no enough extends, it need 2 area 
to do the space allocation, but the area number was not extend , so when 
it try to access the aa array in function _alloc_parallel_area of file 
lib/metadata/lv_manip.c with a non exist index it segment fault! This lines:

                 aa[s].len = (ah->alloc_and_split_meta) ? len - 
ah->log_len : len;
                 /* Skip empty allocations */
                 if (!aa[s].len)
                         continue;

                 aa[s].pv = pva->map->pv;
                 aa[s].pe = pva->start;

I am not an expert of LVM code , could you please give a quick fix of  
this? It should be not hard:)


Please reply me with my email , I am not in the mail list.

Thanks,
Xiaowei
