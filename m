From: lembark@wrkhors.com
Subject: Re: [linux-lvm] getting started with LVM
Message-ID: <40970000.1022186992@duke>
In-Reply-To: <3CED546C.2000401@jumpline.com>
References: <3CED546C.2000401@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Thu May 23 15:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Ben Snyder <ben@jumpline.com> on 05/23/02 16:43:24 -0400

> I am currently doing some research for my employer regarding storage and
> backups.  We currently use dump as a backup utility due to limited budget.
> However, dump has been giving us fits due to lseek errors.
> 
> Someone suggested looking into LVM, so here I am.  I looked a the website and
> did a little digging, but I was unable to find out if LVM will serve my
> purposes.
> 
> If anyone can lend a hand and provide feedback that can tell me if LVM is
> worth my effort to solve this problem, or where I can find this sort of
> information, I'd be vert greatful.

Dumping dump might be the first thing that would help. It's
old and tired and deserves a rest... For free utilities you
can get better speed and filtering with cpio, which backs
up from the file system rather than inodes. At that point
LVM is a nice solution for managing anything large enough to
be backed up.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
