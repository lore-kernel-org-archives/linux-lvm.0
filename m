Message-ID: <B45D0A0B0033EE4CA8E6D22F6F3C0414036BFE9D@NYC-EX103.doubleclick.net>
From: "Tse, Vincent" <vtse@doubleclick.net>
Subject: RE: [linux-lvm] RH AS 2.1 and LVM
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
Date: Wed Jan 28 15:23:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

We use Veritas VM with RHAS 2.1 and we're having a lot of problems when
there's a lot of I/O.  There's some bad interactions between the Veritas
module and the AS 2.1 kernel that causes our boxes to hang.  They sometimes
work themselves free, but it could take up to half an hour to do so.  RH
claims that their latest AS 2.1 kernel fixes this issue, but the belief is
that it only partially alleviates this issue.

I'd try to stay away from Veritas at this point since they're really still
playing catch-up in the Linux arena.  Good luck!




-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of lvm@silvex.com
Sent: Wednesday, January 28, 2004 3:07 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] RH AS 2.1 and LVM


Does LVM support comes from RH or sistine for AS 2.1? Is LVM on RH AS 3.0
stable enough to be used in production ? Can it co exist with Secure Path ?

Will Veritas Volume Manager be a musch better solution?

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
