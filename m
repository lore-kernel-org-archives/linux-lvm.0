From: "Steve Wray" <steve.wray@the.net.nz>
Message-ID: <NBBBKLKHMJHIJLHOGAOJAEJMJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011206100443.GA7973@sky.net>
Subject: [linux-lvm] reinstall system with volumes intact?
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
Date: Mon Dec 10 21:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok,
I want to reinstall my server from mandrake 8.0 to
mandrake 8.1

I have some logical volumes which I don't want to touch
during the reinstall (they mount under /vol)
I don't want to have to restore the data to them,
I want to be able to reboot the server, do the reinstall
and tell it where to mount the volumes and then have
all my data still there and in the right places when
the new system comes up.

The rest of the partitions are going to be rearranged.

The question is;
Do I have to do anything special to have these volumes
accessible under the new system? Mandrake seems to detect
LVM at install time and comes with some nice install-time
tools to set them up.

However, I'm a little concerned with all the export, import
stuff that I read about; should I export the VG before
the reinstall? Or what?

Or am I just unecessarily paranoid and LVM will see the old
volumes on the new system?
