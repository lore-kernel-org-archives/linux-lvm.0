From: "Rene Olsen" <rene_olsen@post3.tele.dk>
MIME-Version: 1.0
Message-ID: <3F676739.13431.C25AFD2@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] pvscan showing 0 free on all PV's.
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
Date: Tue Sep 16 13:19:07 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I have a LVM made out of 7 partitions and a total space of approx 760GB.

One of the drived is a 200GB drive and I would like to take that out of the lvm to use it 
for something else.

Easy enough I thought. I made sure that there was 260GB free on the lvm (using df) 
and then I unmounted the lvm and did this: pvmove /dev/hdh1

Now, according to all I have found that should do it. But, it comes back and tells me that 
there is not enough free space to do the operation.

When I do a pvscan it shows the following:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdl1" of VG "vol1" [76.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdi1" of VG "vol1" [115 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdj1" of VG "vol1" [71.53 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "vol1" [57.22 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh1" of VG "vol1" [189.88 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hde1" of VG "vol1" [115 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf1" of VG "vol1" [115 GB / 0 free]
pvscan -- total: 7 [740.58 GB] / in use: 7 [740.58 GB] / in no VG: 0 [0]

Now, why in the world does it show 0 free on all the PV's when a df told me that there 
were at least 260GB free on the lvm.

Am I doing something wrong or ?

Any help will be most appreciated.

Best regards.

Rene
