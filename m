Message-ID: <001d01c35d0a$971333a0$0d01a8c0@aphrodite>
From: "Rupert Hair" <rupert.hair@ntlworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV Move
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
Date: Thu Aug  7 12:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have just received a nice new disk and I would like to use it to
replace one of my PVs.  This would be no problem (it is well documented
in the HOWTO) but I would like to put the new disk in place of the old
one on the IDE cable.  (i.e. one of my PVs is currently /dev/hdd1 and I
would like to copy the data from that onto the new disk and then put the
new disk on /dev/hdd)

So my question is really can I change where LVM is expecting to find a
PV?

Thanks in advance.

Rupert
