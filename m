Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3B795D728
	for <linux-lvm@redhat.com>; Fri, 27 Oct 2017 10:13:45 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 817035F7AF
	for <linux-lvm@redhat.com>; Fri, 27 Oct 2017 10:13:42 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
References: <59E60975.2000001@strike.wu.ac.at>
	<378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
Message-ID: <c08713cd-4bf3-aff0-0896-9f3e165c79b6@strike.wu.ac.at>
Date: Fri, 27 Oct 2017 12:13:39 +0200
MIME-Version: 1.0
In-Reply-To: <378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
Content-Language: de-AT
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to recover from degraded raid1 with thin pool
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 2017-10-19 13:45, Alexander 'Leo' Bergolth wrote:
> On 10/17/2017 03:45 PM, Alexander 'Leo' Bergolth wrote:
>> I just tested lv activation with a degraded raid1 thin pool.
>> Unfortunately it looks like activation mode=degraded only works for
>> plain raid1 lvs. If you add a thin pool, lvm won't activate it in
>> degraded mode. (Unless you specify --activationmode partial, which is
>> IMHO rather dangerous.)
> 
> Unfortunately I cannot even replace a faulty PV if a thin pool is present.

FYI: I managed to remove the missing PV using a rather dirty workaround:
I replaced the missing devices with the error target using dmsetup and edited and restored the VG config:

-------------------- 8< --------------------
### starting point:

### one PV is missing (one leg of the boot LV and of the Thin-subvolumes)
# lvs -a -olv_name,lv_attr,segtype,devices vg_test
  Couldn't find device with uuid cUHx7d-Gl8O-TX2l-mi5B-QCx6-so00-cS0M4z.
  LV                    Attr       Type      Devices                                      
  Thin                  twi-aotzp- thin-pool Thin_tdata(0)                                
  [Thin_tdata]          rwi-aor-p- raid1     Thin_tdata_rimage_0(0),Thin_tdata_rimage_1(0)
  [Thin_tdata_rimage_0] iwi-aor--- linear    /dev/vdb(53)                                 
  [Thin_tdata_rimage_1] Iwi-aor-p- linear    [unknown](53)                                
  [Thin_tdata_rmeta_0]  ewi-aor--- linear    /dev/vdb(52)                                 
  [Thin_tdata_rmeta_1]  ewi-aor-p- linear    [unknown](52)                                
  [Thin_tmeta]          ewi-aor-p- raid1     Thin_tmeta_rimage_0(0),Thin_tmeta_rimage_1(0)
  [Thin_tmeta_rimage_0] iwi-aor--- linear    /dev/vdb(27)                                 
  [Thin_tmeta_rimage_1] Iwi-aor-p- linear    [unknown](27)                                
  [Thin_tmeta_rmeta_0]  ewi-aor--- linear    /dev/vdb(26)                                 
  [Thin_tmeta_rmeta_1]  ewi-aor-p- linear    [unknown](26)                                
  boot                  rwi-a-r-p- raid1     boot_rimage_0(0),boot_rimage_1(0)            
  [boot_rimage_0]       iwi-aor--- linear    /dev/vdb(1)                                  
  [boot_rimage_1]       Iwi-aor-p- linear    [unknown](1)                                 
  [boot_rmeta_0]        ewi-aor--- linear    /dev/vdb(0)                                  
  [boot_rmeta_1]        ewi-aor-p- linear    [unknown](0)                                 
  [lvol0_pmspare]       ewi-----p- linear    [unknown](2613)                              
  thintest              Vwi-aotzp- thin                                                   

# vgreduce --removemissing vg_test --force
  Couldn't find device with uuid cUHx7d-Gl8O-TX2l-mi5B-QCx6-so00-cS0M4z.
  WARNING: Removing partial LV vg_test/Thin.
  Logical volume vg_test/thintest in use.

### the Thin subvolumes still have the missing PV attached:
# lvs -a -olv_name,lv_attr,segtype,devices vg_test
  Couldn't find device with uuid cUHx7d-Gl8O-TX2l-mi5B-QCx6-so00-cS0M4z.
  LV                    Attr       Type      Devices                                      
  Thin                  twi-aotzp- thin-pool Thin_tdata(0)                                
  [Thin_tdata]          rwi-aor-p- raid1     Thin_tdata_rimage_0(0),Thin_tdata_rimage_1(0)
  [Thin_tdata_rimage_0] iwi-aor--- linear    /dev/vdb(53)                                 
  [Thin_tdata_rimage_1] Iwi-aor-p- linear    [unknown](53)                                
  [Thin_tdata_rmeta_0]  ewi-aor--- linear    /dev/vdb(52)                                 
  [Thin_tdata_rmeta_1]  ewi-aor-p- linear    [unknown](52)                                
  [Thin_tmeta]          ewi-aor-p- raid1     Thin_tmeta_rimage_0(0),Thin_tmeta_rimage_1(0)
  [Thin_tmeta_rimage_0] iwi-aor--- linear    /dev/vdb(27)                                 
  [Thin_tmeta_rimage_1] Iwi-aor-p- linear    [unknown](27)                                
  [Thin_tmeta_rmeta_0]  ewi-aor--- linear    /dev/vdb(26)                                 
  [Thin_tmeta_rmeta_1]  ewi-aor-p- linear    [unknown](26)                                
  boot                  rwi-a-r-r- raid1     boot_rimage_0(0),boot_rimage_1(0)            
  [boot_rimage_0]       iwi-aor--- linear    /dev/vdb(1)                                  
  [boot_rimage_1]       vwi-aor-r- error                                                  
  [boot_rmeta_0]        ewi-aor--- linear    /dev/vdb(0)                                  
  [boot_rmeta_1]        ewi-aor-r- error                                                  
  [lvol0_pmspare]       ewi-----p- linear    [unknown](2613)                              
  thintest              Vwi-aotzp- thin                                                   

### create and execute the dmsetup commands used to replace it:
vg="vg_test"
devs="Thin_tdata_rimage_1 Thin_tdata_rmeta_1 Thin_tmeta_rimage_1 Thin_tmeta_rmeta_1"
for d in $devs; do
  d2="$vg-$d"
  t1="$(dmsetup table "$d2")"
  t2="${t1/ linear */ error}"
  echo dmsetup reload "$d2" --table \""$t2"\"
  echo dmsetup suspend --noflush "$d2"
  echo dmsetup resume "$d2"
done

dmsetup reload vg_test-Thin_tdata_rimage_1 --table "0 20971520 error"
dmsetup suspend --noflush vg_test-Thin_tdata_rimage_1
dmsetup resume vg_test-Thin_tdata_rimage_1
dmsetup reload vg_test-Thin_tdata_rmeta_1 --table "0 8192 error"
dmsetup suspend --noflush vg_test-Thin_tdata_rmeta_1
dmsetup resume vg_test-Thin_tdata_rmeta_1
dmsetup reload vg_test-Thin_tmeta_rimage_1 --table "0 204800 error"
dmsetup suspend --noflush vg_test-Thin_tmeta_rimage_1
dmsetup resume vg_test-Thin_tmeta_rimage_1
dmsetup reload vg_test-Thin_tmeta_rmeta_1 --table "0 8192 error"
dmsetup suspend --noflush vg_test-Thin_tmeta_rmeta_1
dmsetup resume vg_test-Thin_tmeta_rmeta_1

\cp /etc/lvm/backup/vg_test /etc/lvm/vg_test-before-error-target.cfg
\cp /etc/lvm/backup/vg_test /etc/lvm/vg_test-error-target.cfg
### edit vg_test-error-target.cfg:
###   remove the missing PV
###   edit Thin_tdata_rimage_1 Thin_tdata_rmeta_1 Thin_tmeta_rimage_1 Thin_tmeta_rmeta_1
###   you may have to remove the lvol0_pmspare volume if it resided on the missing PV

# diff -u /etc/lvm/vg_test-before-error-target.cfg /etc/lvm/vg_test-error-target.cfg
--- /etc/lvm/vg_test-before-error-target.cfg    2017-10-27 11:54:31.546944978 +0200
+++ /etc/lvm/vg_test-error-target.cfg   2017-10-27 12:01:15.156352344 +0200
@@ -21,17 +21,6 @@
 
        physical_volumes {
 
-               pv0 {
-                       id = "cUHx7d-Gl8O-TX2l-mi5B-QCx6-so00-cS0M4z"
-                       device = "[unknown]"    # Hint only
-
-                       status = ["ALLOCATABLE"]
-                       flags = ["MISSING"]
-                       dev_size = 25165824     # 12 Gigabytes
-                       pe_start = 2048
-                       pe_count = 3071 # 11.9961 Gigabytes
-               }
-
                pv1 {
                        id = "FlCr4G-d80M-g9zW-5A2r-qvim-Ayi1-Ce1Rsa"
                        device = "/dev/vdb"     # Hint only
@@ -295,12 +284,7 @@
                                start_extent = 0
                                extent_count = 25       # 100 Megabytes
 
-                               type = "striped"
-                               stripe_count = 1        # linear
-
-                               stripes = [
-                                       "pv0", 27
-                               ]
+                               type = "error"
                        }
                }
 
@@ -316,12 +300,7 @@
                                start_extent = 0
                                extent_count = 1        # 4 Megabytes
 
-                               type = "striped"
-                               stripe_count = 1        # linear
-
-                               stripes = [
-                                       "pv0", 26
-                               ]
+                               type = "error"
                        }
                }
 
@@ -379,12 +358,7 @@
                                start_extent = 0
                                extent_count = 2560     # 10 Gigabytes
 
-                               type = "striped"
-                               stripe_count = 1        # linear
-
-                               stripes = [
-                                       "pv0", 53
-                               ]
+                               type = "error"
                        }
                }
 
@@ -400,33 +374,7 @@
                                start_extent = 0
                                extent_count = 1        # 4 Megabytes
 
-                               type = "striped"
-                               stripe_count = 1        # linear
-
-                               stripes = [
-                                       "pv0", 52
-                               ]
-                       }
-               }
-
-               lvol0_pmspare {
-                       id = "1tNgGe-mRW5-fKXs-1eVG-t91E-40JP-YdGqZi"
-                       status = ["READ", "WRITE"]
-                       flags = []
-                       creation_time = 1509097937      # 2017-10-27 11:52:17 +0200
-                       creation_host = "bastel-c7-lvm.wu.ac.at"
-                       segment_count = 1
-
-                       segment1 {
-                               start_extent = 0
-                               extent_count = 25       # 100 Megabytes
-
-                               type = "striped"
-                               stripe_count = 1        # linear
-
-                               stripes = [
-                                       "pv0", 2613
-                               ]
+                               type = "error"
                        }
                }
        }

 
### write this config to all configured PVs
# vgcfgrestore --force -f /etc/lvm/vg_test-error-target.cfg vg_test
  WARNING: Forced restore of Volume Group vg_test with thin volumes.
  Restored volume group vg_test

### now the missing PV is completely removed from the VG:
# lvs -a -olv_name,lv_attr,segtype,devices vg_test
  LV                    Attr       Type      Devices                                      
  Thin                  twi-aotz-- thin-pool Thin_tdata(0)                                
  [Thin_tdata]          rwi-aor-r- raid1     Thin_tdata_rimage_0(0),Thin_tdata_rimage_1(0)
  [Thin_tdata_rimage_0] iwi-aor--- linear    /dev/vdb(53)                                 
  [Thin_tdata_rimage_1] vwi-aor-r- error                                                  
  [Thin_tdata_rmeta_0]  ewi-aor--- linear    /dev/vdb(52)                                 
  [Thin_tdata_rmeta_1]  ewi-aor-r- error                                                  
  [Thin_tmeta]          ewi-aor-r- raid1     Thin_tmeta_rimage_0(0),Thin_tmeta_rimage_1(0)
  [Thin_tmeta_rimage_0] iwi-aor--- linear    /dev/vdb(27)                                 
  [Thin_tmeta_rimage_1] vwi-aor-r- error                                                  
  [Thin_tmeta_rmeta_0]  ewi-aor--- linear    /dev/vdb(26)                                 
  [Thin_tmeta_rmeta_1]  ewi-aor-r- error                                                  
  boot                  rwi-a-r-r- raid1     boot_rimage_0(0),boot_rimage_1(0)            
  [boot_rimage_0]       iwi-aor--- linear    /dev/vdb(1)                                  
  [boot_rimage_1]       vwi-aor-r- error                                                  
  [boot_rmeta_0]        ewi-aor--- linear    /dev/vdb(0)                                  
  [boot_rmeta_1]        ewi-aor-r- error                                                  
  thintest              Vwi-aotz-- thin                                                   

### lvconvert --repair will work now:
# lvconvert -y --repair /dev/vg_test/boot
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  Faulty devices in vg_test/boot successfully replaced.
# lvconvert -y --repair /dev/vg_test/Thin_tmeta
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  Faulty devices in vg_test/Thin_tmeta successfully replaced.
# lvconvert -y --repair /dev/vg_test/Thin_tdata 
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  Faulty devices in vg_test/Thin_tdata successfully replaced.

# lvs -a -olv_name,lv_attr,sync_percent,segtype,devices vg_test
  LV                    Attr       Cpy%Sync Type      Devices                                      
  Thin                  twi-aotz--          thin-pool Thin_tdata(0)                                
  [Thin_tdata]          rwi-aor--- 100.00   raid1     Thin_tdata_rimage_0(0),Thin_tdata_rimage_1(0)
  [Thin_tdata_rimage_0] iwi-aor---          linear    /dev/vdb(53)                                 
  [Thin_tdata_rimage_1] iwi-aor---          linear    /dev/vdd(53)                                 
  [Thin_tdata_rmeta_0]  ewi-aor---          linear    /dev/vdb(52)                                 
  [Thin_tdata_rmeta_1]  ewi-aor---          linear    /dev/vdd(52)                                 
  [Thin_tmeta]          ewi-aor--- 100.00   raid1     Thin_tmeta_rimage_0(0),Thin_tmeta_rimage_1(0)
  [Thin_tmeta_rimage_0] iwi-aor---          linear    /dev/vdb(27)                                 
  [Thin_tmeta_rimage_1] iwi-aor---          linear    /dev/vdd(27)                                 
  [Thin_tmeta_rmeta_0]  ewi-aor---          linear    /dev/vdb(26)                                 
  [Thin_tmeta_rmeta_1]  ewi-aor---          linear    /dev/vdd(26)                                 
  boot                  rwi-a-r--- 100.00   raid1     boot_rimage_0(0),boot_rimage_1(0)            
  [boot_rimage_0]       iwi-aor---          linear    /dev/vdb(1)                                  
  [boot_rimage_1]       iwi-aor---          linear    /dev/vdd(1)                                  
  [boot_rmeta_0]        ewi-aor---          linear    /dev/vdb(0)                                  
  [boot_rmeta_1]        ewi-aor---          linear    /dev/vdd(0)                                  
  thintest              Vwi-aotz--          thin                                                   
-------------------- 8< --------------------


For the wishlist: :-)
An lvm command to (maybe forcibly) manually set a raid sub-lv to faulty
(i.e. replace the PV with the error target) would be nice.


Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
