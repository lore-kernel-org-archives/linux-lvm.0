From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie to snapshot
Message-ID: <20030520092734.A9086@sistina.com>
References: <001501c31d2a$0ea25f20$6c7745cb@codevel> <3EC788E9.9020701@adelphia.net> <002001c31d4d$eebf5630$6c7745cb@codevel>
Mime-Version: 1.0
In-Reply-To: <002001c31d4d$eebf5630$6c7745cb@codevel>; from armani@codevel.com on Sun, May 18, 2003 at 10:58:23PM +0800
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
Date: Tue May 20 02:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, May 18, 2003 at 10:58:23PM +0800, armani wrote:
> Thanks for toby's explainations!
> ==
> Eventually I create a new snapshot of my LV partition.
> But I have another problem with the snapshot of LV.
> That is how much snapshot I could create for my LV partition ?
> As I know some commercial software could create 254 snapshots for one LV
> such as IBM.
> 
> So I try to create another snapshot for LV by issuing the following command:
> 
> This is my first snapshot for /dev/Vol1/LV1
> 
> [root@met root]# lvcreate --size 100M -s -nsnapshot /dev/Vol1/LV1
> lvcreate -- WARNING: the snapshot will be automatically disabled once it
> gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/Vol1/snapshot"
> lvcreate -- doing automatic backup of "Vol1"
> lvcreate -- logical volume "/dev/Vol1/snapshot" successfully created
> 
> I tried to create another snapshot for /dev/Vol1/LV1
> 
> [root@met root]# lvcreate --size 100M -s -nsnapshot1 /dev/Vol1/LV1
> lvcreate -- WARNING: the snapshot will be automatically disabled once it
> gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/Vol1/snapshot1"
> lvcreate -- doing automatic backup of "Vol1"
> lvcreate -- logical volume "/dev/Vol1/snapshot1" successfully created
> 
> And how can I estimate the sizes and counts for them ?

lvdisplay /dev/Vol1/snapsh*

> Is there any rules or principles to formalize the procedures ?

There's no tool in the LVM distro for that so far.
You can write a script (Shell, Perl, ...) around lvdisplay to
create alerts when a snapshot runs out of space or extend it automatically.

> 
> 
> > A snapshot will only capture what you have in the fs at the moment you
> -- snip --
> > -toby
> 
> -- Armani Liao
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
