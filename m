From: Jan Rhebergen <jan@rhebergen.net>
In-Reply-To: <20031111212622.753c2f18.jan@rhebergen.net>
Message-ID: <Pine.LNX.4.44.0311121431100.7174-100000@rhebergen.net>
MIME-Version: 1.0
Subject: [linux-lvm] how to do a LVM partition backup?
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
Date: Wed Nov 12 07:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all,

While I figure out how to recover form a LVM problem I want to backup the
complete partiton that has the LVM stuff on as well as the MBR. The firts
two partitions on the drive are "regular" partition and the 3rd one is a
LVM partition. I have a second hard drive with a spare partition with
enough space. Could I use something like partimage or will a simple dd do?

regards,

Jan
