From: Bradley M Alexander <storm@tux.org>
Subject: Re: [linux-lvm] More research on lvm problems
Message-ID: <20011119135126.A1789@sonsofthunder.yi.org>
References: <20011119010011.A891@sonsofthunder.yi.org> <20011119093701.A21796@balu.kawo2.rwth-aachen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011119093701.A21796@balu.kawo2.rwth-aachen.de>
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
Date: Mon Nov 19 12:50:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 19, 2001 at 09:37:01AM +0100, Markus Dobel wrote:
> On Mon, Nov 19, 2001 at 01:00:11AM -0500, Bradley M Alexander wrote:
> > 
> > [defiant /home/storm]# mount -a
> > mount: special device /dev/vg01/lvm_tmp does not exist
>                                     ^here
> [...]
> 
> > But looking in /dev:
> > 
> > [defiant /home/storm]# ls -l /dev/vg01
> > total 0
> > crw-r-----    1 root     root     109,   0 Dec 31  1969 group
> > brw-r-----    1 root     root      58,   0 Dec 31  1969 lv_archive
>                                                             ^here
> Maybe just take a look at the letter "m". :)

Thanks Markus. Looking at this stuff at 1am can apparently cause one to
miss the obvious. :)

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
Do vegetarians eat animal crackers?
