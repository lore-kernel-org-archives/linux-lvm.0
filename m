Date: Thu, 27 Sep 2001 09:40:37 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Disk Died - Ideas?
Message-ID: <53040000.1001601637@dizzy>
In-Reply-To: <3BB30FD9.853E39DA@lmco.com>
References: <3BB09C88.8234FDE4@lmco.com>
 <20010925110909.D392@turbolinux.com> <3BB30FD9.853E39DA@lmco.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jeff Layton <jeffrey.b.layton@lmco.com>

> Andreas Dilger wrote:
>
>> On Sep 25, 2001  11:02 -0400, Jeff Layton wrote:
>> >    Well, of course, the last disk gave up the ghost (lots of SCSI
>> > errors, machine will not boot without unplugging drives from
>> > machine). I'm pretty sure you can guess what I'm going to ask :)
>> > Can I just unplug the last drive, bring the system up, don't run
>> > fsck on lvol1, mount lvol1, and try to pull as much data as I can
>> > off what's left of the filesystem? If this works, then I can just
>> > redo the PVs, the VGs, and the LVOLs and recreate the filesystem
>> > and move over what data I can recover.

<broken record>

boot once.

vgexport /dev/vgwhatever;
vgimport /dev/vgwhatever <list of drives that didn't croak>

you will now have your VG back on line with whatever portion of the
data is no the clean drives.  any LV's spanning the dead drive are
likely to be lost anyway.  It'll take you less time to vgextend the
imported group onto a new, working drive an recover backups onto
new LV's than almost anything else you can try.

</broken record>


--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
