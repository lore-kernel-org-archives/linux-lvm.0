From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] reinstall, import, export question
Message-ID: <54800000.1008139651@dizzy>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKEKDJCAA.steve.wray@the.net.nz>
References: <NBBBKLKHMJHIJLHOGAOJKEKDJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed Dec 12 00:47:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Steve Wray <steve.wray@the.net.nz>

> I'd really like to do a reinstall of my main server
> Real Soon Now, but I'm concerned about the LVM side
> of things.
>
> I have a bunch of logical volumes on the system, none
> are essential, its all data. Its backed up but I don't
> want to have to wipe it and restore it.
>
> I want to be able to simply reinstall the system
> and carry the physical volumes, and the VG's and
> LV's they hold over to the rebuilt system.
>
> About the only references to anything like this in
> the docco is about exporting to a different system.
>
> Is this really necessary for my purposes? Or can I
> expect that when the new system comes up, the LVM
> subsystem will find the old volumes nicely?

So long has you have complete backups go for it :-)

You might wan tot consider exporting the volumes then
re-importing them onto the new system after the install
is complete. This avoids the installation cycle accidentally
blowing off the lv's.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
