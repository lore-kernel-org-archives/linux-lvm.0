From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] invalidate: busy buffer
Message-ID: <20011216215414.GB12889@sky.net>
References: <20011214191634.GB24486@auctionwatch.com> <20011216205044.F26924@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011216205044.F26924@tiger.bigcats.invalid>
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
Date: Sun Dec 16 15:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
* Wolfgang Weisselberg <weissel@netcologne.de> [011216 20:50]:
> BTW, is there a good reason to run vgscan on boot time every
> time?  I have had more sorrow than joy with that.  If my
> vg's really changed, I can always run it from the (non-LVM)
> / which will come up, even if only as an emergency system.

Ok, but you need to run vgscan && vgchange -ay every time you wanna use
your LVM-drives, and I think that's normally every time you boot your
PC.
I won't run the commands every time I reboot manually. But... I add them
to /etc/rcS.d/S99local incl. the mount command. This takes nearly the
same effect as if I run it manually after the booting finished.

Regards
Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
