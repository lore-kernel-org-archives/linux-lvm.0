From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1x8ynjk2iz.fsf@users.sourceforge.net>
References: <16272.19483.577313.115811@gargle.gargle.HOWL> <200310172128.10259.mike@gaima.co.uk>
 <16272.21933.838510.310433@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: RAID 1 on Device Mapper - best practices?
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
Date: Fri Oct 17 15:56:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"John Stoffel" <stoffel@lucent.com> writes:

> Mike> At first this didn't work, as the startup scripts Gentoo provide
> Mike> initialise LVM before MD, but that was easily changed.
>
> Yeah, I thinking I need to just tweak the scripts under debian as
> well, but I wanted to find out what people found to be the best way to
> do this.

I've got mine set up so the kernel detects the arrays by itself.  It
can't get simpler.

-- 
M�ns Rullg�rd
mru@users.sf.net
