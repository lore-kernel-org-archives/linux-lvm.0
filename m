From: Steven Lembark <lembark@wrkhors.com>
Subject: RE: [linux-lvm] Fun little horror story -- please add to FAQ if
    it isn't already documented
Message-Id: <72110000.1009682972@dizzy>
In-Reply-To: <000001c19122$46771750$0b00a8c0@michaelmouse>
References: <000001c19122$46771750$0b00a8c0@michaelmouse>
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
Date: Sun Dec 30 09:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Ben Holness <ben@bens-house.org.uk>

>> Upon the next reboot, the initrd ran fine... found and activated the
>> lv's... but the kernel said "no root partition" and hung.  I could
>> rescue boot the system from the SuSE CD -- everything was there... I
>> finally added a "vgdisplay -v" to the initrd's linuxrc, and
>> that showed me the problem.

We can add it under the general heading of why using
LVM for boot volumes doesn't work on i386 platforms.

Giving /usr its own mount point genrally levaes the
root voume small, static and perfectly happy on a
small partition at the top of your disk. Using a
static link for LVM and installing it in the root
leaves the whole setup quite a bit more dependable.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
