From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Inode problems
Message-ID: <20030821163812.G8426@sistina.com>
References: <20030821073958.15125.qmail@ispower.org>
Mime-Version: 1.0
In-Reply-To: <20030821073958.15125.qmail@ispower.org>; from security@rechena.com on Thu, Aug 21, 2003 at 08:39:58AM +0100
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
Date: Thu Aug 21 09:45:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 21, 2003 at 08:39:58AM +0100, Joao Rechena wrote:
> 
> Greetings, I'm using LVM for almost 6 months without any problem..
> 2 days ago on of my filesystems filled up to 100%, then with the fs full 
> I've enlarged it,

Did e2fsadm (with the implicit fsck) grow the fs successfully ?
IOW: did that fsck run without any errors ?

Before you change anything more, make sure you've got a backup of your data ;)

> and everithing looked to be ok, except that when I then 
> tried to mkdir anything It returned to me the msg "Device is full", wierd. 

That sounds like the fs hasn't grown actually which is the case when
fsck returns an error to e2fsadm.

> 
> I cleaned the fs a little and then reducit again, with the e2fsadm command, 
> everithing looked to started working fine again, until I've made a dmesg and 
> discovred this: 
> 
> EXT2-fs error (device lvm(58,1)): ext2_check_page: bad entry in directory 
> #344422: directory entry across blocks - offset=12440, inode=411202, 
> rec_len=16420, name_len=28 

We need the _exact_ size of the fs (use tune2fs -l /dev/... and look for
the block count and block size paramaters).
See if that fits the LV size.

> 
> Can anyone tell-me how to solve this ? 
> 
> I've enlarged the fs again, deleted the dir with that inode, but the problem 
> presists. 
> 
> Best Regards 
> 
> rech 
> 
> Joao Rechena 
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
