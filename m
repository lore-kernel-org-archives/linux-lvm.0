From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] problem
Message-ID: <33170000.1042057292@[192.168.200.4]>
In-Reply-To: <1042049056.1433.29.camel@tux.its.uiowa.edu>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu>
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
Date: Wed Jan  8 14:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Daniel Wittenberg <daniel-wittenberg@uiowa.edu>

> I had 2 drives in my machine, with a VG across both of them.  The only
> thing on the second drive was part of /tmp, so when the second drive
> died I didn't really lose anything.  But I have problems now because I
> can't activate the VG because part of it is missing, but I can't remove
> tmp, so it's a catch-22.  Is there anyway to remove an LV without
> activating the VG?  Or another way I can tell it to ignore missing LV's?

vgexport + vgimport should do it for you if none of the
other LV's stretched onto the dead drive.

If you don't want to spread data across drives that are
not maintained with some sort of RAID then you are
probably better off putting the drives in separate VG's
so that data doesn't accidentally spill across the disks.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 773 252 1080
