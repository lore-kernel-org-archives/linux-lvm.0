From: Wiktor Wodecki <wodecki@gmx.de>
Message-ID: <20031113183745.GA9193@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Cuncurrent access to a vg from two hosts
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
Date: Thu Nov 13 12:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

I'm curious if lvm1 allows me to access the same volume group from to
different machines (of course not accessing the same lv's in this vg). I
have two machines connected to a storage array, that's why I ask. Is the
filesystem operations on the LV affecting the VG so that this could lead
to inconsistencies?

-- 
Regards,

Wiktor Wodecki
