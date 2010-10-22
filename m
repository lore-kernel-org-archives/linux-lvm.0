Message-ID: <4CC0DBA2.1010503@cfl.rr.com>
Date: Thu, 21 Oct 2010 20:32:34 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4CBF4B79.9080008@cfl.rr.com> <20101020205530.GC31510@redhat.com>
	<4CBF5A3A.3050106@cfl.rr.com>
In-Reply-To: <4CBF5A3A.3050106@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot merge in the background?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>

After some more testing, I have found that the udev rule was running 
lvchange -a y whenever a PV is added or changed.  It seems that nearly 
any lvm command causes a change event to be emitted on the PVs.  Why is 
this?  After I removed the |change clause from the udev rule so that 
lvchange is no longer run on these change events, I now see that indeed, 
running lvchange -a manually to reactivate an origin volume with a 
pending merge does cause it to activate and merge in the background, 
during which time it can be mounted.  Strangely though, while the merge 
is taking place in the background, I still see change events on the 
underlying PVs being emitted.  Also running lvs while the merge is still 
on going reports IO errors trying to read the snapshot volume, which 
makes sense since according to dmsetup table, it consists only of the 
error target.

With the change to the udev rule, the system boots immediately and 
finishes the merge in the background, as it should, leading me to 
conclude that the problem was all of the udev event ping-pong causing 
udevadm settle to hold up the boot.

On 10/20/2010 05:08 PM, Phillip Susi wrote:
> On 10/20/2010 4:55 PM, Mike Snitzer wrote:
>> "Before finishing the boot"... can you be more specific?  Where was it
>> stopped waiting for a snapshot merge?  How did you know it was waiting
>> for snapshot merge?  Which distro are you using?
>
> It seemed to be stopped waiting for the initial activation of the root
> lv before continuing with the boot.  This manifested as a several minute
> delay before the gui came up, and when I checked the bootchart image, it
> was indeed sitting running lvm for a long time before everything else.
> This is with Ubuntu 10.10.
