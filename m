Date: Mon, 5 Apr 2004 14:32:30 -0700
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040405213230.GA12461@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] experimeinting with mirroring, other targets
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thornber@redhat.com
Cc: linux-lvm@redhat.com


I'm interested in experimenting with some of the new targets that
are available in the udm1 kernel (e.g. mirroring, multipath).

I've seen the multipath tools and I'm looking those over.

Is the only way to set up mirroring targets to use the dmsetup
tool?

Also, does LVM allow me to layer these targets, for example if I
wanted a logical volume that is multipathed, mirrored, and striped?

Thanks!

Dave Olien
