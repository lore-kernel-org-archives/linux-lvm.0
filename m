From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Volume Group with 4 HDs- one crashed
Message-ID: <20030110141257.A2963@uk.sistina.com>
References: <3051931894.20030110143835@gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3051931894.20030110143835@gmx.net>; from nik39@gmx.net on Fri, Jan 10, 2003 at 02:38:35PM +0100
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
Date: Fri Jan 10 08:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 10, 2003 at 02:38:35PM +0100, nik-da-3'9'' wrote:
> >   2 logical volume(s) in volume group "mpeg" now active
So did that not activate 2 of the logical volumes?

You have to add '-P' to *every* tool that you want to attempt
to use volume groups that are Partially missing.
(But tools only support the flag where it makes sense to.)

>   Found volume group "data" using metadata type lvm1
So it found that OK.

> I also remove the devnodes left by LVM 1 (/dev/mpeg/mp3 /dev/mpeg/mpvie),
> but still I cant access the VG's.
Recent LVM2 tarballs deal OK with any nodes left behind like that.
What version are you using?
 
> What to do next? Any help is really appreciated, as there is still lots of
> important data on the VGs.
 
Read the -P section of 'man lvm' for extra hints on recovery: depends
if you're able to replace the disk with another, or if you want to
remove the disk from the VG completely.

See also the thread a few days back:
  Re: [linux-lvm] problem

Alasdair
-- 
agk@uk.sistina.com
