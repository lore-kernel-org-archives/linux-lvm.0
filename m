Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2DCgU110155
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 07:42:30 -0500
Received: from smtp-02.arnet.com.ar (smtp-02.arnet.com.ar [200.45.191.22])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k2DCgR0N029979
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 07:42:28 -0500
Message-ID: <4415681D.5080806@arnet.net.ar>
Date: Mon, 13 Mar 2006 09:39:57 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] I/O error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi, we have an IBM server attached to an IBM SAN with a qlogic HBA. When 
I run 'lvdisplay' or any other 'Xdisplay' (vg, pv) command this is the 
output:

  /dev/sdq: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
  /dev/sds: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdt: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV DYM8ElmyYadLJeAJk5TfxMx7pprrFHfk: using /dev/sdu 
not /dev/sdc
  /dev/sdf: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdv: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV Qoe4208RQKg0XK1AfXjInMLglzU8ks6v: using /dev/sdw 
not /dev/sde
  /dev/sdh: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdx: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV n3IC77zXPw0QQ6OcfldMfpKPRG3QsxXW: using /dev/sdy 
not /dev/sdi
  Found duplicate PV EX7OrzfwKADyFhnnlooYEKtvL9t5Gv3W: using /dev/sdj 
not /dev/sdg
  /dev/sdk: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdm: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV ftppICdxAujdcPH0eZ77TBWD6waiOckd: using /dev/sdn 
not /dev/sdl
  Found duplicate PV OuTEiF4W1rYuVGOTEcKQQmrDnDkpyATT: using /dev/sdp 
not /dev/sdr
------------------------------ cut -----------------------------------------

The Storage Admin told me that there are two path to the same storage 
(disk). I would like to know if this is an error to be worried about or 
is just info? And if there's a way to avoid this output. Also, when a I 
run 'dmesg', I have this output (if I clear with 'dmesg -c', it will 
appear again in the next minutes):

Buffer I/O error on device sdk, logical block 0
end_request: I/O error, dev sdk, sector 0
Buffer I/O error on device sdk, logical block 0
end_request: I/O error, dev sdm, sector 0
end_request: I/O error, dev sdm, sector 0
printk: 1 messages suppressed.
Buffer I/O error on device sdm, logical block 0
end_request: I/O error, dev sdq, sector 0
end_request: I/O error, dev sdq, sector 0
end_request: I/O error, dev sds, sector 0

FC4
kernel-smp-2.6.15-1.1831_FC4
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.4.0
Fibre Channel: QLogic Corp. QLA2312 Fibre Channel Adapter (rev 02)

Thanks
German Staltari
