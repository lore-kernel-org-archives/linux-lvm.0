Subject: Re: [linux-lvm] Block-Level Backup
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030807093631.GE381@fib011235813.fsnet.co.uk>
References: <1060247670.28307.37.camel@rocky>
	 <20030807093631.GE381@fib011235813.fsnet.co.uk>
Message-Id: <1060260466.4360.2.camel@chtephan.cs.pocnet.net>
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
Date: Thu Aug  7 07:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Joe Thornber <thornber@sistina.com>

Am Do, 2003-08-07 um 11.36 schrieb Joe Thornber:

> > but it'll be great if there's a tool,
> > that supoorts block-level increment backup....
> 
> Icremental backup would be good, from the kernel side all you'd need
> is a dm target that records which blocks have changed - anyone
> interested in coding this ?

I'm still here. ;-)

You already wrote something like this. I was thinking about it. Perhaps
we could do some brainstorming how to exactly do this, not from the
programming side, I could find that out myself, but from the "output"
side.

Which options, what data format, what gets logged and where.

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
