Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102152003.f1FK35J30665@webber.adilger.net>
Subject: Re: [linux-lvm] LVM don't work anymore (wrong version?)
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683960@mailsrv.linkvest.ch> from
 Jean-Eric Cuendet at "Feb 15, 2001 11:21:24 am"
Date: Thu, 15 Feb 2001 13:03:03 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jean-Eric Cuendet writes:
> I have this same problem on two of our servers! The 2 runs the same kernel:
> 2.4.1 with ACL patch and LVM 0.9.1beta4
> 
> [root@zorro /root]# pvscan -u
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/md6" with UUID
> "v7Y8gz-KMXB-d6Iq-Y0U1-iiSo-javD-wOL89P"  is associated to an
> unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/md7" with UUID
> "xTl7Nc-6DhQ-KV3c-HHd0-LI50-nQwq-wFBYCG"  is associated to an
> unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/md8" with UUID
> "oDXPq6-s9Zn-dOHF-ss8J-Rdxt-jTKT-wFoIGQ"  is associated to an
> unknown VG (run vgscan)

Try running 'pvdata -U' on each of the PV's, and see if there are empty
UUID slots on some of them.  This is a bug with the old LVM tools.  If
this is true, you can try to comment out the section in pv_read_all_pv_of_vg
which verifies the UUIDs (starts like "if (uuids) {"), and try vgscan
again.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
