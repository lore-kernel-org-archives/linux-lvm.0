From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LDM and devfs with LVM
Message-ID: <41530000.1006679809@dizzy>
In-Reply-To: <ABEIKDKIEHNINPAIOGPAGECMCAAA.mark_a_anders@yahoo.com>
References: <ABEIKDKIEHNINPAIOGPAGECMCAAA.mark_a_anders@yahoo.com>
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
Date: Sun Nov 25 21:17:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Mark Anders <mark_a_anders@yahoo.com>

>
> I am trying to make LVM work with both LDM and devfs.  Is this supported?
> I have two disks which were configured as dynamic disks in windows.
> Linux is able to see and access all the dynamic disk partitions (through
> /dev/discs/disc0/part? and /proc/partitions but not through fdisk).  Does
> LVM need to access the partition table or can it operate using only
> /proc/partitions and the device files?

Works fine for me. If you have devfs set up to keep the
stats on links then it'll just make its own copy of the
/dev/vgXX files. Alternative is to move the volume groups
out of /dev. Problem there is that the --preifx switch
doesn't work entirely -- there are a were code changes you
have to make in order to move vg's out of /dev/ the last
time I tried it.

Only real thing to make a point of is mounting /dev before
the LVM volumes (not hard since one is normally done before
mouting the root volume the other after).

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
