Date: Thu, 04 Oct 2001 12:57:21 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] What have I done!?
Message-ID: <30980000.1002218241@dizzy>
In-Reply-To: <20011004113309.E31061@turbolinux.com>
References: <009401c14cc3$c63106c0$836788cf@industry>
 <009501c14cc7$2f5cd360$836788cf@industry>
 <20011004113309.E31061@turbolinux.com>
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


-- Andreas Dilger <adilger@turbolabs.com>

>> Is there a way that I can blow the whole thing away and start over?  I
>> think I've screwed things up too badly to try to resurrect them.  I'd
>> really like to blow it all away and start over and see if this stuff
>> happens again, but again I can't use the lv* tools to remove the
>> configurations because of the errors I mention in my initial post so I
>> need a manual way to blow away the entire LVM configuration and start
>> from scratch again.
>
> "pvcreate -ff" I think

If you really want to wipe things clean:

    (1) vgexport /dev/vgname; # avoids collisions w/ stale config info.
    (2) for disk in your disks here; do pvcreate -ff $disk; done;

The export isn't strictly necessar:  rm -rf and a vgscan should do the
same basic thing with a few nastygrams added in.  Personally, I get
enough nastygrams to prefer avoiding a few more :-)


--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
