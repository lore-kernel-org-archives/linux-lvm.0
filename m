Message-ID: <DFC80C4F8AE1D011A6560004ACECA354094D69C1@kmdx3.kmd.dk>
From: "Hansen,Ole OHA" <oha@kmd.dk>
Subject: RE: [linux-lvm] LVM/RAID or viceversa?
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
Date: Fri Dec  7 04:02:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Hi,
> I made LVM on a RAID 1 device and it work perfectly :)

Sounds like, we have somewhat the same configuration! 

> But I don't know howto restore data if one of my disk crash.

Well, that should be pretty easy to do.. The first thing to do, if you
suspect one of your disks has died is to do a cat on /proc/mdstat.

I don't know, if you have to issue a raidhotremove, but you need to remove
the faulty disk, make a new one ready, alter the /etc/raidtab (if the new
disk is on another device) and use raidhotadd... Please do yourself the
favour adn read the man pages! :) (Can't remember the syntax for them, since
I've never needed to use them... )

> thx
> DoudOUKE

-- 
Ole Hansen
