From: "Steve Wray" <steve.wray@the.net.nz>
Message-ID: <NBBBKLKHMJHIJLHOGAOJKEKDJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011206100443.GA7973@sky.net>
Subject: [linux-lvm] reinstall, import, export question
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
Date: Wed Dec 12 00:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'd really like to do a reinstall of my main server
Real Soon Now, but I'm concerned about the LVM side
of things.

I have a bunch of logical volumes on the system, none
are essential, its all data. Its backed up but I don't
want to have to wipe it and restore it.

I want to be able to simply reinstall the system
and carry the physical volumes, and the VG's and
LV's they hold over to the rebuilt system.

About the only references to anything like this in
the docco is about exporting to a different system.

Is this really necessary for my purposes? Or can I
expect that when the new system comes up, the LVM
subsystem will find the old volumes nicely?
