From: "Bipin Butala" <bipinbipin@hotmail.com>
Mime-Version: 1.0
Message-ID: <F9BSt7qrXf266xrymKR00027851@hotmail.com>
Subject: [linux-lvm] merging 2 logical volumes in same volume group
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
Date: Fri Apr  4 22:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

i have two logical volumes in the same volume group and was
wondering if/how it would be possible to merge them into a single
logical volume, without having to migrate the data.

i attempted to extend the filesystem at the time of creation but
ran into the error
  "not enough physical extents to create"
i couldn't find much documentation regarding this error.
any suggestions or ideas are greatly appreciated.

here are some outputs.

[root@fido-1]# ls /dev/fido_vg/
group  lv1-fido  lv2-fido

[root@fido-1]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "fido_vg" [55.91 GB / 412 MB free]
pvscan -- ACTIVE   PV "/dev/hde1" of VG "fido_vg" [55.91 GB / 416 MB free]
pvscan -- ACTIVE   PV "/dev/hdf1" of VG "fido_vg" [57.24 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf2" of VG "fido_vg" [57.24 GB / 496 MB free]
pvscan -- total: 4 [226.33 GB] / in use: 4 [226.33 GB] / in no VG: 0 [0]

[root@fido-1]# lvscan
lvscan -- ACTIVE            "/dev/fido_vg/lv1-fido" [111.01 GB] contiguous 
striped[2]
lvscan -- ACTIVE            "/dev/fido_vg/lv2-fido" [114 GB]
lvscan -- 2 logical volumes with 225.01 GB total in 1 volume group
lvscan -- 2 active logical volumes


regards,

                  B | P | N


Bipin E Butala
Unix and Multimedia Engineer
3232 Blaisdell Ave S (apt.#105)
Minneapolis, MN 55408
(612) 747-4218




_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online  
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
