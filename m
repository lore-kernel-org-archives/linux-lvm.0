Message-Id: <3C8087F3.50508@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Kernel 2.5.5 - slightly OT
References: <20020302025015.61413.qmail@web13404.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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
Date: Sat Mar  2 02:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>Hi all
>
> Anyone sucessful in compiling lvm (linux) ( not as a module but inside
>kernel itself) for linux  kernel 2.5.5 - 
>
> whenever i add the option of raid and lvm, the make bzImage exits with
>error at lvm.c and rd.c. I omitted these modules and compiled kernel
>and kernel is ok - now i need to access lvm partitions. 
>
> any work arounds to load older lvm kernel modules into current kernel
>- tried even a forced insmod - no use ! - says some unresolved externals.
>
about rd.c there was a topic on linux-kernnel mailing list ,
you have to delete the second argument on the line it bombs i think it 
was " len << 9 "
it should be fixed in 2.5.6-pre1

about lvm ( i think it's already fixed in 2.5.6-pre2 )
some of the includes are missing

both problems are fixed in 2.5.5-dj1 and -dj2
if you try the dj tree it should work

and i'm almost happy  to say that i have almost working 2.5.6-pre1-xfs + 
2.5.5-dj2
i have troubles with XFS LV's  over soft-raid-0
no troubles with JFS ( i didn't try ext2, ext3 or reiser)
the raid-0 code isn't that ready in some situations, it can not split 
too big requests
wich is my PB with XFS

regards

svetljo
