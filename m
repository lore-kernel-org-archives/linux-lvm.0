From: Remco Post <r.post@sara.nl>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-Id: <20031209185108.7f36d1f0.r.post@sara.nl>
In-Reply-To: <3FD4B28E.6030602@stercomm.com>
References: <E1ATOLU-0004dz-1c@server6.hostpoint.ch>
	<3FD4B28E.6030602@stercomm.com>
Mime-Version: 1.0
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
Date: Tue Dec  9 11:53:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 08 Dec 2003 11:19:10 -0600
Chris Cox <chris_cox@stercomm.com> wrote:


> I have never experienced the data loss element, however, since
> reiser3 does not do true data journaling, but only metadata, it is
> well known fact that while reiser can bring the filesystem
> integrity back to normal after a bad shutdown, some data loss
> is possible.  This is usually true of any metadata only journaling
> filesystem.  Reiser4 supposed fixes this and of course has that
> whiz-bang plugins feature.  Could make reiser4 the best (feature wise).
> 

unorderly shutdowns will, even will full journaling, lead to dataloss of all
data in the buffercache. Filesystem consistency is far more important,
having to resore any filesystem from tape is a pita. Especially ext2 was
very sensitive to unorderly shutdowns.

> I certainly have nothing against JFS or AIX.  I really like its ability
> to dynamically grow without intervention (though that could give
> some administrators a headache).

AIX LVM system (even booting from a LV, though not in the most elegant
fashion thinkable) is quite mature. It is one of AIX typical features I like
the most (unlike smitty... ;-)

-- 
Met vriendelijke groeten,

Remco Post

SARA - Reken- en Netwerkdiensten                      http://www.sara.nl
High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167

"I really didn't foresee the Internet. But then, neither did the computer
industry. Not that that tells us very much of course - the computer industry
didn't even foresee that the century was going to end." -- Douglas Adams
