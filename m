From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
Message-ID: <20030117192650.GB3610@localhost>
References: <20030113214928.NXIW20432.imf21bis.bellsouth.net@marsha> <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ> <20030117100237.GC15042@gw.silicide.dk> <001601c2be1b$fd442050$c600a8c0@COMPAQ>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001601c2be1b$fd442050$c600a8c0@COMPAQ>
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
Date: Fri Jan 17 13:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Friday, 17 January 2003, at 20:31:34 +0900,
Sean Oh wrote:

> Yes, I specified the ro option in ext3 snapshots. But it is still not
> mountable, giving the error 'Cant write to read-only device' and 'EXT3-FS:
> write access unavailable, cannot proceed'
> 
Did you try to mount the ext3 snapshot not only in read-only mode, but
_also_ without replaying the journal (option -o noload). I can't verify
this, because my kernel is compiled without the required "vfs-lock patch".

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.4.20-xfs)
