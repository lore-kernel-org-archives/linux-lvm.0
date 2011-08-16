Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7GMf2DI006153
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 18:41:02 -0400
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7GMf087008339
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 18:41:00 -0400
Received: by qyk34 with SMTP id 34so374000qyk.12
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 15:41:00 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Aug 2011 16:40:59 -0600
Message-ID: <CAAQ1uJuXx4DQ7w2Q4L_buN25e_TPHTZEgGT=7vGZpSKqys4tnw@mail.gmail.com>
From: Chris Cameron <chris@upnix.com>
Subject: [linux-lvm] Reported LVM device utilization
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a striped logical volume that consists of 20 underlying
physical volumes. iostat shows that the underlying physical disks
usually stay under 20% utilization, but the device representing the
logical volume sits at 100% utilization near constantly.

I'm not sure how reliable "utilization" in iostat is, but how I came
across this was the considerable iowait being displayed on this server
- usually 2 of the 8 CPUs sit near 98% wait.

So, a couple questions I couldn't seem to answer myself:
* Is 20 physical volumes a reasonable size?
* Is the discrepancy I'm seeing between PV's and the LV LVM overhead?


I appreciate the help.

Chris



Some details:

 [root@ bin]# lvdisplay -m /dev/tsmstgvg/tsmdisk1
  --- Logical volume ---
  LV Name                /dev/tsmstgvg/tsmdisk1
  VG Name                tsmstgvg
  LV UUID                dj2CFo-sK0q-1GvQ-Gpd5-6Hea-Aul1-QLEMwI
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                8.30 TB
  Current LE             68000
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     10240
  Block device           253:8

  --- Segments ---
  Logical extent 0 to 67999:
    Type		striped
    Stripes		20
    Stripe size		128 KB
    Stripe 0:
      Physical volume	/dev/emcpowera
      Physical extents	0 to 3399
    Stripe 1:
      Physical volume	/dev/emcpowerr
      Physical extents	0 to 3399
    Stripe 2:
      Physical volume	/dev/emcpowers
      Physical extents	0 to 3399
    Stripe 3:
      Physical volume	/dev/emcpowerd
      Physical extents	0 to 3399
    Stripe 4:
      Physical volume	/dev/emcpowert
      Physical extents	0 to 3399
    Stripe 5:
      Physical volume	/dev/emcpoweru
      Physical extents	0 to 3399
    Stripe 6:
      Physical volume	/dev/emcpowerf
      Physical extents	0 to 3399
    Stripe 7:
      Physical volume	/dev/emcpowerv
      Physical extents	0 to 3399
    Stripe 8:
      Physical volume	/dev/emcpowerw
      Physical extents	0 to 3399
    Stripe 9:
      Physical volume	/dev/emcpowerh
      Physical extents	0 to 3399
    Stripe 10:
      Physical volume	/dev/emcpowerx
      Physical extents	0 to 3399
    Stripe 11:
      Physical volume	/dev/emcpoweri
      Physical extents	0 to 3399
    Stripe 12:
      Physical volume	/dev/emcpowerj
      Physical extents	0 to 3399
    Stripe 13:
      Physical volume	/dev/emcpowerk
      Physical extents	0 to 3399
    Stripe 14:
      Physical volume	/dev/emcpowerl
      Physical extents	0 to 3399
    Stripe 15:
      Physical volume	/dev/emcpowerm
      Physical extents	0 to 3399
    Stripe 16:
      Physical volume	/dev/emcpowern
      Physical extents	0 to 3399
    Stripe 17:
      Physical volume	/dev/emcpowero
      Physical extents	0 to 3399
    Stripe 18:
      Physical volume	/dev/emcpowerp
      Physical extents	0 to 3399
    Stripe 19:
      Physical volume	/dev/emcpowerq
      Physical extents	0 to 3399

[root@ bin]# iostat 1 2 -xm /dev/emcpowera /dev/emcpowerd
/dev/emcpowerf /dev/emcpowerh /dev/emcpoweri /dev/emcpowerj
/dev/emcpowerk /dev/emcpowerl /dev/emcpowerm /dev/emcpowern
/dev/emcpowero /dev/emcpowerp /dev/emcpowerq /dev/emcpowerr
/dev/emcpowers /dev/emcpowert /dev/emcpoweru /dev/emcpowerv
/dev/emcpowerw /dev/emcpowerx dm-8

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           1.12    0.00    0.87   18.60    0.00   79.40

Device:         rrqm/s   wrqm/s   r/s   w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
emcpowerp         1.00     0.00 19.00 16.00     1.32     0.83   126.17
    0.29    8.40   7.94  27.80
emcpowero         0.00     0.00 16.00 39.00     1.38     0.88    84.07
    0.25    4.64   2.07  11.40
emcpowerl         0.00     0.00 23.00  9.00     1.71     0.57   145.75
    0.14    4.44   4.16  13.30
emcpowerk         0.00     0.00 16.00  8.00     1.50     0.72   190.00
    0.14    5.62   5.54  13.30
emcpowerj         0.00     0.00 22.00 10.00     1.55     0.85   153.50
    0.16    4.88   4.84  15.50
emcpoweri        10.00     0.00 19.00 11.00     1.71     0.88   177.07
    0.16    5.23   4.90  14.70
emcpowern         0.00     0.00 20.00 19.00     1.54     0.84   124.51
    0.17    4.31   4.00  15.60
emcpowerd         0.00     0.00 15.00 13.00     1.34     0.65   145.43
    0.11    3.96   3.71  10.40
emcpowerh         1.00     0.00 21.00 12.00     1.96     0.88   175.76
    0.18    5.45   5.24  17.30
emcpowera         2.00     0.00 21.00 11.00     1.21     0.81   129.75
    0.18    5.72   4.31  13.80
emcpowerf        10.00     0.00 27.00 28.00     1.80     0.73    94.40
    0.21    4.15   2.69  14.80
emcpowerx        16.00     0.00 28.00 20.00     1.88     0.91   119.00
    0.21    4.46   3.65  17.50
emcpowerw        15.00     0.00 30.00 12.00     2.00     0.98   145.14
    0.20    4.79   4.50  18.90
emcpowerv        31.00     0.00 21.00 10.00     1.88     0.86   181.16
    0.16    5.03   4.90  15.20
emcpowerq        13.00     0.00 17.00  8.00     1.30     0.78   169.92
    0.18    7.12   5.52  13.80
emcpoweru         0.00     0.00 16.00 31.00     1.48     0.72    96.00
    0.37    7.81   6.43  30.20
emcpowerm         0.00     0.00 18.00  7.00     1.62     0.65   186.24
    0.14    5.52   5.28  13.20
emcpowert         0.00     0.00 19.00 13.00     1.35     0.71   131.75
    0.31    9.72   9.53  30.50
emcpowers         9.00     0.00 20.00 11.00     1.30     0.75   136.00
    0.13    4.06   3.90  12.10
emcpowerr         0.00     0.00 13.00  8.00     1.20     0.75   189.71
    0.12    5.71   4.86  10.20
dm-8              0.00     0.00 267.00 175.00    31.23    15.75
217.70     3.16    7.36   2.27 100.20
