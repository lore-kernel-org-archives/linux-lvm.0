From: Scott Mcdermott <smcdermott@questra.com>
Message-ID: <20030818221037.GC513@questra.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] RAID5 backed LVM with LVM2: varying block size
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
Date: Mon Aug 18 17:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

is the RAID5-backed LVM snapshot problem fixed in LVM-2, or
only in kernel 2.6 ?

btw software RAID5 is *horribly* slow if you are any kind of
cpu bound at all even a little...
