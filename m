Message-ID: <3D7E4135.9EE88518@storix.com>
From: Anthony Johnson <anthony@storix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Allocation policies
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
Date: Tue Sep 10 14:08:26 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I know there are 2 allocation policies, contiguous and next free. Is
there any information that describes in detail how LVM determines the
extents to assign to a logical volume with it is created or extended?
For example, if the policy is "contiguous", must the LV contain all
contiguous extents or does it use a "best-case" scenario, and how would
that work? Likewise, in the "next free" scenario, is there any weight
given to contiguous space, does it automatically allocate across PVs,
etc?

Thanks!
Anthony
