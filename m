From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mount reiserfs snapshot failed
Message-Id: <20020419151300.A25208@sistina.com>
References: <3CBE92EB.89FB2B07@mc-lindinger.de>
MIME-Version: 1.0
In-Reply-To: <3CBE92EB.89FB2B07@mc-lindinger.de>; from
    m.bartl@mc-lindinger.de on Thu, Apr 18, 2002 at 11:33:31AM +0200
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
Date: Fri Apr 19 08:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This could still be VM issues.

Have you tried top of CVS, which is in pre-release tests for LVM 1.1-rc2?

Regards,
Heinz    -- The LVM Guy --


On Thu, Apr 18, 2002 at 11:33:31AM +0200, Markus Bartl wrote:
> Hi there.
> 
> Im using the original kernel 2.4.18 with the locking patch and the
> lvm-patch applied. I use the lvm in Version 1.1rc1.
> I got one harddisk with 4 partitions on it, 1 partition is Linux LVM.
> The volume to backup is mounted on /home and has reiserfs. 
> 
> I made a shell-script to perform a test using snapshots.
> Here is what it does (looped):
> 1) create snapshot
> 2) mount snapshot --> fails sometimes (35 loops, 6 fails)
> 3) backup snapshot
> 4) create file on original volume while backup is still running
> 5) unmount snapshot
> 6) remove snapshot
> 
> In some cases mounting the snapshot volume fails with error 32 (wrong fs
> type or bad superblock).
> Anybody got any idea???
> 
> Thanks for your help,
> Markus
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
