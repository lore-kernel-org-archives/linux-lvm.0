Message-ID: <20010823225107.2238.qmail@web20301.mail.yahoo.com>
Date: Thu, 23 Aug 2001 15:51:07 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
Subject: Re: [linux-lvm] segfault running vgscan
In-Reply-To: <20010823145432.A20622@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

the static vs dynamic link bit gave me the idea to try
compiling lvm statically - seems to work now.

i can't upgrade glibc since its already at 2.2.4 which
is the most recent (as far as I can tell)


lets hope it doesn't just appear to work...

brad
--- AJ Lewis <lewis@sistina.com> wrote:
> On Thu, Aug 23, 2001 at 12:22:35PM -0700, Brad
> Langhorst wrote:
> > so yes dynamically linked...
> > the problem was with static linking right?
> > 
> > now what? 
> > should I try a less optimized libc?
> 
> I know that there was an issue with atexit() with
> certain versions of
> glibc, it's possibly both when dynamically and
> statically linked.  I'm not
> sure.  I am sure that the following tools call
> atexit() through LVM_LOCK():
> 
> lvchange.c
> lvcreate.c
> lvdisplay.c
> lvextend.c
> lvm_user.h
> lvm_user.h
> lvmchange.c
> lvmsadc.c
> lvreduce.c
> lvremove.c
> lvrename.c
> lvscan.c
> pvchange.c
> pvchange.c
> pvcreate.c
> pvdata.c
> pvdisplay.c
> pvmove.c
> pvscan.c
> vgcfgbackup.c
> vgcfgrestore.c
> vgchange.c
> vgck.c
> vgcreate.c
> vgdisplay.c
> vgexport.c
> vgextend.c
> vgimport.c
> vgmerge.c
> vgmknodes.c
> vgreduce.c
> vgremove.c
> vgrename.c
> vgscan.c
> vgsplit.c
> 
> Can you verify that these are the ones that
> segfault, or that the other
> tools do not?  Can you upgrade glibc?  Or try on a
> machine with a
> different version?
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice: 
> 612-638-0500
> 1313 5th St SE, Suite 111              Fax:   
> 612-638-0500
> Minneapolis, MN 55414                  E-Mail:
> lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B 
> 52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work
> with multiple sub-keys)
> 
> -----Begin Obligatory Humorous
> Quote----------------------------------------
> There's nary an animal alive that can outrun a
> greased Scotsman.
>    - Groundskeeper Willie
> -----End Obligatory Humorous
> Quote------------------------------------------
> 

> ATTACHMENT part 2 application/pgp-signature 


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
