Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683960@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] LVM don't work anymore (wrong version?)
Date: Thu, 15 Feb 2001 11:21:24 +0100
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi,
I have this same problem on two of our servers! The 2 runs the same kernel:
2.4.1 with ACL patch and LVM 0.9.1beta4

With the second one, I can do much more tests than the other. It's a
semi-prod machine.
Here is what I did:

[root@zorro /root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md6"  is associated to an unknown VG (run
vgscan)
pvscan -- ACTIVE   PV "/dev/md7"  is associated to an unknown VG (run
vgscan)
pvscan -- ACTIVE   PV "/dev/md8"  is associated to an unknown VG (run
vgscan)
pvscan -- total: 3 [8.8 GB] / in use: 3 [8.8 GB] / in no VG: 0 [0]
 
[root@zorro /root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md6" with UUID
"v7Y8gz-KMXB-d6Iq-Y0U1-iiSo-javD-wOL89P"  is associated to an
unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/md7" with UUID
"xTl7Nc-6DhQ-KV3c-HHd0-LI50-nQwq-wFBYCG"  is associated to an
unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/md8" with UUID
"oDXPq6-s9Zn-dOHF-ss8J-Rdxt-jTKT-wFoIGQ"  is associated to an
unknown VG (run vgscan)
pvscan -- total: 3 [8.8 GB] / in use: 3 [8.8 GB] / in no VG: 0 [0]
 
[root@zorro /root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found
 
[root@zorro /root]# vgcreate
vgcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan
 
[root@zorro /root]#


What to do now?  I wait for your help!
Thanks
-jec
