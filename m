From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Volume Group with 4 HDs- one crashed
Message-ID: <20030110141920.B2963@uk.sistina.com>
References: <3051931894.20030110143835@gmx.net> <20030110141257.A2963@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030110141257.A2963@uk.sistina.com>; from agk@uk.sistina.com on Fri, Jan 10, 2003 at 02:12:57PM +0000
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
Date: Fri Jan 10 08:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 10, 2003 at 02:12:57PM +0000, Alasdair Kergon wrote:
> > I also remove the devnodes left by LVM 1 (/dev/mpeg/mp3 /dev/mpeg/mpvie),
> > but still I cant access the VG's.
> Recent LVM2 tarballs deal OK with any nodes left behind like that.
> What version are you using?
Ah you said: .12
That change went into .13
  
vgdisplay wouldn't show them because you didn't add -P

Do a 'vgchange -an -P' and then try activating them again.

Try 'lvdisplay -P'  to check if they're active, or  check the attr. 
columns (see man page) in the new 'lvs -P' command.

Alasdair
-- 
agk@uk.sistina.com
