Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F951A@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
MIME-Version: 1.0
Subject: [linux-lvm] One VG or many?
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
Date: Tue Jun  4 16:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

	We have about 2TB to slice up and using a single VG seems to provide
the most flexibility for usage of the space. However, using one VG seems
reminiscient of having "all your eggs in one basket" in that if the VG
becomes corrupt, all of the LVs are at risk. So, are there any situations in
which using multiple VGs would be preferable to a single VG, or vice versa?
I'm curious to find out if other people use multiple VGs and, if so, what
requirements or concerns lead to the decision and what criterion are used to
assign data to a specific VG.

Thanks,

-poul
