From: Anders Widman <andewid@tnonline.net>
Message-Id: <2712663015.20020304230010@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Manegeability with LVM
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
Date: Mon Mar  4 16:00:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello.

I have a system with 14 disks of diffenrent sizes (40-120GB).

As my need for diskspace increases all the time I was thinking of
using LVM so I could make use of all diskspace and grow/shrink/replace
drives as I need to.

The only downside to this is the possibility of massive dataloss if I
loose any of the 14 disks (drive fails to spin etc...). Would it be
possible to setup up a software redundancy like RAID5 with LVM so I
can keep this manageability LVM gives me?

I know this has been up in this list before, but I couldn't find a
suitable answer.

//Anders
