From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xwucyty8b.fsf@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovering from disk failure
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
Date: Thu Aug 28 06:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Recently one of two disks in a volume group crashed, and I can't read
it at all.  Now, some LVs are entirely on the disk that survived.  Is
there any way I can just disable the broken LVs and continue using the
complete ones?  I'm using device-mapper and LVM2, but I used to use
LVM1, and have not converted the disks to the new format.  I have both
LVM1 and LVM2 tools available, as well as a bunch of different
kernels.  Dirty hacks are OK, too.

Now I'm considering building a RAID5 array and run LVM on top of
that.  Is there something fundamentally bad with such a setup?

-- 
M�ns Rullg�rd
mru@users.sf.net
