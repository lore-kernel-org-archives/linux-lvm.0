Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560F62@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] mounting snapshot errors
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
Date: Tue Jan 27 21:54:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

is the filesystem you are snapshotting still mounted when you execute the
snapshot?  They need to be offline before the snapshot takes place.

-----Original Message-----
From: R Dicaire [mailto:rdicaire@kritek.net]
Sent: Tuesday, January 27, 2004 6:01 PM
To: lvm
Subject: [linux-lvm] mounting snapshot errors


I apologize for the repeat but never got a response.

I posted a few days ago regarding the inability to mount snapshots
if the volume's file system is ext3/xfs/reiserfs. Using current lvm
1.0.8 on linux kernel 2.4.23-xfs with lvm 1.0.8 patch and 1.0.8 lvm
tools.

Is there a fix for this issue?

-- 
      aRDy Music
http://www.ardynet.com


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
