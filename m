From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] reinstall, import, export question
Message-ID: <NBBBKLKHMJHIJLHOGAOJCEKLJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200112121346.fBCDkNQ18525@lewis.abi.tconline.net>
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
Date: Wed Dec 12 16:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Lewis Bergman
>
> > I want to be able to simply reinstall the system
> > and carry the physical volumes, and the VG's and
> > LV's they hold over to the rebuilt system.
> I just finished doing this.
> I installed a new python version from source which torched all my
> printing in RH7. So instead of reinstalling the RPM I decided to wipe the
OS and do a
> fresh install. Here is my setup.
>
[snip]
>
> Of course You know most all of that I am sure but it is easier
> for me to lay it out that way.

Nice and methodical!
:)

> If you don't have a "dedicated" LVM disk as I do

yeah I have 2 disks on seperate IDE controllers that I
use for LVM. The system partitions are still on normal
partitions and on one drive.

> That will most surely complicate things if the OS doesn't support an
> upgrade or install of LVM. I know RH and deb don't. (the two I use) I have
seen on
> the list that suse and another do. This worked for me at least.

Mandrake seems to do it well; I set these volumes up at install
time. I have this feeling that I'll be able to reintegrate my
volumes at reinstall time too, but I wanted to clarify the
export/import thing wondering if it was essential.



> Hope I didn't forget anything major.
> --
> Lewis Bergman
> Texas Communications
> 4309 Maple St.
> Abilene, TX 79602-8044
> 915-695-6962 ext 115
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
